/* ********* ESP32_CAM Wildlife Camera Unit **************************

    by Matt Little
    The Curious Electric Company (www.curiouselectric.co.uk)
    hello@curiouselectric.co.uk
    17/12/2021
    This code is Open Source - please adjust and use as you would like.
    Please ensure accreditation
    (although most of this code is based on work of others - see list below).

    More information (full files and firmware) is here:
    https://github.com/curiouselectric/Lapse-O-Matic

    Idea for this code:
    Unit is solar powered with a lithium ion battery bank 18650 cell
    Unit wakes up with a PIR sensor or with external interrupt (via switched contacts) or via sleep mode.
    Reads each time the config file from the SD card - this tells it what mode to run in and other parameters.
    Need a "settings.config.txt" file on the SD card with thes config values.

    At that point the unit takes a number of photos with a delay between them
    Unit can wake up with either SLEEP or TRIGGER.
    SLEEP will be every sleep seconds. TRIGGER will be on PIR or external switch.

    ***TO PROGRAM: Set Board to "AI Thinker ESP32-CAM"***

    Done:
    Sort out the LED on (at low glow level)? - This is solved.
    Sort out flash LED - only works on first reprogram - This is solved.
    Sort out interrupt via PIR unit - This is solved.
    Flash on/off (boolean ) is not working? - Sorted
    Sort out RTC for file name - done. I2C shared pins.
    Sort out file names.
    Sort out reprogramming with FTDI/USB
    Sort out running all at 3.3V. Works with low drop out regulator.
    What happens if no RTC connected? - reverts to other filename with a counter
    Report Error to log file. - this happens when camera does not start with timestamp
    if no RTC: need to sort out naming as it's overwriting the same one. - DONE
    Send photos via email if on wifi (https://randomnerdtutorials.com/esp32-cam-send-photos-email/)
    https://rntlab.com/question/esp32-cam-send-email-with-attachment-from-sd-card-problem-no-attachment-in-email/
    Issue with SD_MMC and sending info with SD.

    To do:
    Why getting camera errors? - Sometimes get problem with camera
    Need error feedback - flash 1 for OK, 2 for internet not OK, 3 for SD error, 5 for camera sync error
    Add configuration via WifiManager

    Some Information that has been very useful
    https://randomnerdtutorials.com/esp32-cam-take-photo-save-microsd-card/
    https://www.olimex.com/Products/IoT/ESP32/ESP32-CAM/
    https://marksbench.com/electronics/esp32-cam-low-power-trail-camera/
    https://hackaday.com/2020/05/18/esp32-trail-camera-goes-the-distance-on-aa-batteries/
    https://randomnerdtutorials.com/esp32-cam-ai-thinker-pinout/
    https://dronebotworkshop.com/esp32-cam-intro/

    Need to include the following libraries:
    ESP Mail Client by Mobizt.
    https://github.com/mobizt/ESP-Mail-Client

*/

#include <esp_camera.h>
#include <FS.h>
#include <SPI.h>
#include <SD.h>
#include <Preferences.h>
#include <Arduino.h>
#include <ESP_Mail_Client.h>
#include <SPIFFS.h>
#include <WiFi.h>

// Now support ArduinoJson 6.0.0+ ( tested with v6.14.1 )
#include <ArduinoJson.h>      // get it from https://arduinojson.org/ or install via Arduino library manager

#include "config.h"
#include "camera_pins.h"
#include "Esp.h"
#include "utilitiesDL.h"
#include "lapseomatic.h"

#include "driver/sdmmc_host.h"
#include "driver/sdspi_host.h"

// Date and time functions using a DS3231 RTC connected via I2C and Wire lib
#include <Wire.h>
#include "RTClib.h"
#include "time.h"
RTC_DS3231 rtc;

#include "soc/soc.h"           // Disable brownour problems
#include "soc/rtc_cntl_reg.h"  // Disable brownour problems
#include "driver/rtc_io.h"

// The ESP32 EEPROM library is deprecated. Use the Preferences library instead.
Preferences preferences;
settings  settings_config;              // This holds the settings info from the SD card
// Configure the camera with the pins defined above and recommended settings for xclk, led_c, and format.
camera_config_t config;

// Create a variable to hold the picture number. Since the SD card is formatted FAT32, the maximum number of files
// there can be is 65534, so a 16-bit unsigned number will be fine.
// Want to store this in 'sleep' protected memory
uint16_t PIC_COUNT = 0;
String filename = "";       // This holds the date string for the filename.
String PHOTO_NAME[5];          // Holds the name of the photo to send. Actually want array of names of photos to send.... Max photos to send = 5

// The Email Sending data object contains config and data to send
SMTPSession smtp;
/* Callback function to get the Email sending status */
void smtpCallback(SMTP_Status status);


void setup()
{
  WRITE_PERI_REG(RTC_CNTL_BROWN_OUT_REG, 0);  //disable brownout detector
  Serial.begin(115200);
  //Print the wakeup reason for ESP32
  print_wakeup_reason();
  DEBUGLN(settings_config.DEBUG_FLAG, "Starting");
  switch_off_flash_LED(); // Ensure LED is OFF to start.

  bool rtc_flag = true;

  // Lets try reading/writing to I2C
  // Start the I2C interface
  if (! Wire.begin(I2C_SDA, I2C_SCL)) {
    // If the RTC does not start,
    // Then carry on, but without correct filename.
    DEBUGLN(settings_config.DEBUG_FLAG, "Couldn't find RTC");
    rtc_flag = false;
  }

  if (! rtc.begin()) {
    // If the RTC does not start, wait for a little while (1 sec?)
    // Then carry on, but without correct filename.
    delay(200);
    DEBUGLN(settings_config.DEBUG_FLAG, "Couldn't find RTC");
    rtc_flag = false;
    //abort();
  }
  if (rtc_flag == true)
  {
    if (rtc.lostPower())
    {
      // Here we get the date and time from the SD card??
      DEBUGLN(settings_config.DEBUG_FLAG, "RTC lost power, let's set the time!");
      // When time needs to be set on a new device, or after a power loss, the
      // following line sets the RTC to the date & time this sketch was compiled
      rtc.adjust(DateTime(F(__DATE__), F(__TIME__)));
      // This line sets the RTC with an explicit date & time, for example to set
      // January 21, 2014 at 3am you would call:
      //rtc.adjust(DateTime(2020, 12, 5, 11, 44, 0));
    }
    DateTime now = rtc.now();
    // Set the date with date and time with the data, to use as filename later.
    filename = "D" + (String)now.year() + "_" + (String)now.month() + "_" +
               (String)now.day() + "_T" + (String)now.hour() + "_" + (String)now.minute() + "_" + (String)now.second();
  }
  else
  {
    // RTC is not attached so cannot use it!
    filename = "NO_RTC_";
  }

  // *************** SORT OUT THE SD CARD ****************************** //
  // Start up the SD card, using 1-bit xfers instead of 4-bit (set the "true" option).
  // Frees up GPIO13.
  switch_on_flash_LED();

  if (!MailClient.sdBegin(14, 2, 15, 13))
  {
    // If we're here, there's a problem with the SD card.
    DEBUGLN(settings_config.DEBUG_FLAG, "SD Card Mount Fail");
    // We flash the LED to show an SD card error
    flash_error(3); // Flash 3 times for an SD card mount error
    // This checks the mode the unit is in and then goes to sleep accordingly
    check_mode_then_sleep();
  }

  // Query the card to make sure it's OK
  uint8_t SD_CARD = SD.cardType();
  DEBUG(settings_config.DEBUG_FLAG, "Card Type:");

  if (SD_CARD == CARD_NONE) {
    // If we're here, there's a problem with the SD card.
    DEBUGLN(settings_config.DEBUG_FLAG, "No SD Card!");
    // Flash the LED to highlight this:
    flash_error(10);
    // This checks the mode the unit is in and then goes to sleep accordingly
    check_mode_then_sleep();

  } else if (SD_CARD == CARD_MMC) {
    DEBUGLN(settings_config.DEBUG_FLAG, "MMC");
  } else if (SD_CARD == CARD_SD) {
    DEBUGLN(settings_config.DEBUG_FLAG, "SDSC");
  } else if (SD_CARD == CARD_SDHC) {
    DEBUGLN(settings_config.DEBUG_FLAG, "SDHC");
  } else {
    DEBUGLN(settings_config.DEBUG_FLAG, "UNKNOWN");
  }
  // We are now done the setup and should be ready to take pictures
  // in the main loop() function.

  // Here we read the settings file from the SD card.
  // This will change any default settings defined
  readSettings(SD, SETTINGS_FILENAME, settings_config);

  // ************** START UP THE CAMERA ********************** //
  preferences.begin("trailcam", false); // Open nonvolatile storage (EEPROM) on the ESP in RW mode

  PIC_COUNT = preferences.getUShort("PIC_COUNT", 0);  // Get the stored picture count from the EEPROM.

  // Return 0 if it doesn't exist.
  // getUShort() fetches a 16-bit unsigned value
  // We add the Picture Count to give unique ID to the photoname
  configure_camera(config, settings_config);

  // Start up the camera with the configuration settings made earlier in the "config." statements.
  esp_err_t err = esp_camera_init(&config);

  if (err != ESP_OK) {
    // If we're here, there's a problem communicating with the camera.
    DEBUGLN(settings_config.DEBUG_FLAG, "CAMERA ERROR");

    if (settings_config.DEBUG_FLAG == 1)
    {
      Serial.printf("CAMERA ERROR: 0x%x", err);
    }
    // If this happens want to write a line to the error log file.
    // If possible add the date/time to this log file.
    fs::FS &fs = SD;

    // Now, create a new file using the path and name set above.
    File file = fs.open((String)ERROR_FILENAME, FILE_APPEND);
    if (!file) {
      // If we're here, there's a problem creating a new file on the SD card.
      DEBUGLN(settings_config.DEBUG_FLAG, "Error with opening Error file on SD");
      // This checks the mode the unit is in and then goes to sleep accordingly
      check_mode_then_sleep();
    }
    else
    {
      DEBUGLN(settings_config.DEBUG_FLAG, ("Error on : " + filename + " Code: " + err));
      // Write to file
      // If we're here, the file was created. Now write the captured image to the file.
      file.println("Error on : " + filename );
    }
    file.close(); // Done writing the file so close it.

    // We flash the LED to show an SD card error
    flash_error(5); // Flash 5 times for an camera sync error

    // This checks the mode the unit is in and then goes to sleep accordingly
    check_mode_then_sleep();
    return;
  }
}

void loop()
{
  uint8_t COUNTUP = 1;  // Create variable to take multiple pictures.
  while (COUNTUP <= settings_config.NUMBER_PHOTOS)
  {
    // Take number_photos pictures before shutting down.
    if (settings_config.FLASH_FLAG == true)
    {
      switch_on_flash_LED();
      digitalWrite(LED_FLASH_PIN, HIGH);
      delay(settings_config.FLASH_START_DELAY);
    }
    // Take picture and read the frame buffer
    camera_fb_t * fb = esp_camera_fb_get();

    if (settings_config.FLASH_FLAG == true)
    {
      delay(settings_config.FLASH_STOP_DELAY);
      digitalWrite(LED_FLASH_PIN, LOW);
    }
    if (!fb)
    {
      // This checks the mode the unit is in and then goes to sleep accordingly
      check_mode_then_sleep();
    }
    // Image captured: Save it here:
    // Want to use the date & time for the file name - to log it.

    String path;
    if (filename == "NO_RTC_")
    {
      path = "/" + filename + (String)PIC_COUNT + "_" + String(COUNTUP) + "_of_" + String(settings_config.NUMBER_PHOTOS) + ".jpg";
    }
    else
    {
      path = "/" + filename + "_" + String(COUNTUP) + "_of_" + String(settings_config.NUMBER_PHOTOS) + ".jpg";
    }
    PHOTO_NAME[COUNTUP] = path;
    if (settings_config.DEBUG_FLAG == 1)
    {
      Serial.print("Photo Path: ");
      Serial.println(PHOTO_NAME[COUNTUP]);
    }

    fs::FS &fs = SD;

    // Now, create a new file using the path and name set above.
    File file = fs.open(path.c_str(), FILE_WRITE);

    if (!file) {
      // If we're here, there's a problem creating a new file on the SD card.
      DEBUGLN(settings_config.DEBUG_FLAG, "Error wth creating file on SD");
      // This checks the mode the unit is in and then goes to sleep accordingly
      // We flash the LED to show an SD card error
      flash_error(3); // Flash 3 times for an SD error
      check_mode_then_sleep();
    }
    else
    {
      // If we're here, the file was created. Now write the captured image to the file.
      file.write(fb->buf, fb->len);
      // Here we increment the picture number
      PIC_COUNT = PIC_COUNT + 1;  // Increment the picture count number each time there's a successful write.
      if (PIC_COUNT >= 65500) {
        PIC_COUNT = 0;            // FAT32 has a limit of 65534 files in a folder
      }
    }
    file.close(); // Done writing the file so close it.

    // Free the memory used by the framebuffer so it's available for another picture
    esp_camera_fb_return(fb);
    delay(settings_config.PHOTO_DELAY); // Wait between photos - adjustable
    COUNTUP = COUNTUP + 1;  // We are done an image capture cycle. Increment the count.
  }

  // If we're here then we've taken the pictures and we are ready to shut down.
  // Write the current file number to the EEPROM
  preferences.putUShort("PIC_COUNT", PIC_COUNT);  // Store the picture count number in the EEPROM

  // If there is data in the wifi SSID then try to connect to wifi.
  // Else we go to sleep

  if (settings_config.WIFI_SSID.length() != 0)
  {
    // In this case we have an SSID so try to connect to WiFi
    char ssid[settings_config.WIFI_SSID.length() + 2];
    settings_config.WIFI_SSID.toCharArray(ssid, settings_config.WIFI_SSID.length() + 1);
    char pass[settings_config.WIFI_PASS.length() + 2];
    settings_config.WIFI_PASS.toCharArray(pass, settings_config.WIFI_PASS.length() + 1);
    if (settings_config.DEBUG_FLAG == 1)
    {
      Serial.print("SSID: ");
      Serial.print(ssid);
      Serial.print(" PW: ");
      Serial.println(pass);
    }
    // ******** SEND IMAGE via WIFI *****************************
    // Connect to Wi-Fi
    WiFi.begin(ssid, pass);
    Serial.print("Connecting to WiFi...");
    int timeout_wifi = 0;
    while (WiFi.status() != WL_CONNECTED && timeout_wifi < 20) {
      delay(500);
      Serial.print(".");
      timeout_wifi++;
    }
    if (timeout_wifi < 20)
    {
      // This means we have connected within 10 seconds, else timeout...
      Serial.println("Connected to WiFi");
      // Print ESP32 Local IP Address
      Serial.print("IP Address: http://");
      Serial.println(WiFi.localIP());
      sendPhoto();
      flash_error(1); // Show that we have sent the email OK
    }
  }
  // This checks the mode the unit is in and then goes to sleep accordingly
  check_mode_then_sleep();
}

void enable_sleep()
{
  switch_off_flash_LED();
  delay(50);
  //   Now go to sleep:
  esp_sleep_enable_timer_wakeup(settings_config.TIME_TO_SLEEP * uS_TO_S_FACTOR);
  Serial.println("Setup ESP32 to sleep for " + String(settings_config.TIME_TO_SLEEP) + " Seconds");
  Serial.println("ZZZZzzzzz....");
  Serial.flush();
  esp_deep_sleep_start();
  Serial.println("This will never be printed");
}

void enable_trigger()
{
  switch_off_flash_LED();
  delay(50);
  //   Now go to sleep:
  esp_sleep_enable_ext0_wakeup(GPIO_PIN_WAKEUP, 0);
  Serial.println("Setup ESP32 to sleep Until Trigger on GPIO 13");
  Serial.println("ZZZZzzzzz....");
  Serial.flush();
  esp_deep_sleep_start();
  Serial.println("This will never be printed");
}

void check_mode_then_sleep()
{
  // Here we either enable sleep or attach an interrupt....
  // depends upon mode_type
  // What mode are we in?
  Serial.print("Mode is: ");
  Serial.println(settings_config.MODE);
  String mode_string = settings_config.MODE;
  if (mode_string.indexOf(String("LAPSE")) >= 0)
  {
    Serial.println("ZZZZzzzzz....");
    enable_sleep();
  }
  else if (mode_string.indexOf(String("TRIGGER")) >= 0)
  {
    Serial.println("Trigger Mode. Attach Interrupt. Then Sleep");
    enable_trigger();
  }
  else
  {
    Serial.println("Mode invalid. Still going to sleep...");
    enable_sleep();
  }
}

void sendPhoto( void )
{
  // Preparing email
  Serial.println("Sending email...");
  delay(10);

  if (MailClient.sdBegin(14, 2, 15, 13))
  {
    char AUTHOR_EMAIL[settings_config.EMAIL_SENDER.length() + 2];
    settings_config.EMAIL_SENDER.toCharArray(AUTHOR_EMAIL, settings_config.EMAIL_SENDER.length() + 1);
    char AUTHOR_PASSWORD[settings_config.EMAIL_PASS.length() + 2];
    settings_config.EMAIL_PASS.toCharArray(AUTHOR_PASSWORD, settings_config.EMAIL_PASS.length() + 1);
    char SMTP_HOST[settings_config.SMTP_SERVER.length() + 2];
    settings_config.SMTP_SERVER.toCharArray(SMTP_HOST, settings_config.SMTP_SERVER.length() + 1);
    int SMTP_PORT = settings_config.SMTP_PORT;
    char RECIPIENT_EMAIL[settings_config.EMAIL_RECIPIENT.length() + 2];
    settings_config.EMAIL_RECIPIENT.toCharArray(RECIPIENT_EMAIL, settings_config.EMAIL_RECIPIENT.length() + 1);
    char EMAIL_SUBJECT[settings_config.EMAIL_SUBJECT.length() + 2];
    settings_config.EMAIL_SUBJECT.toCharArray(EMAIL_SUBJECT, settings_config.EMAIL_SUBJECT.length() + 1);

    if (settings_config.DEBUG_FLAG == true)
    {
      Serial.print("SMTP data:");
      Serial.print(SMTP_HOST);
      Serial.print(", ");
      Serial.print(SMTP_PORT);
      Serial.print(", ");
      Serial.print(AUTHOR_EMAIL);
      Serial.print(", ");
      Serial.print(AUTHOR_PASSWORD);
      Serial.print(", ");
      Serial.print(RECIPIENT_EMAIL);
      Serial.print(", ");
      Serial.println(EMAIL_SUBJECT);
    }

    // This comes from the ESP Mail Client SMTP example
    /** Enable the debug via Serial port
       none debug or 0
       basic debug or 1

       Debug port can be changed via ESP_MAIL_DEFAULT_DEBUG_PORT in ESP_Mail_FS.h
    */
    smtp.debug(1);
    /* Set the callback function to get the sending results */
    smtp.callback(smtpCallback);
    /* Declare the session config data */
    ESP_Mail_Session session;
    /* Set the session config */
    session.server.host_name = SMTP_HOST;
    session.server.port = SMTP_PORT;
    session.login.email = AUTHOR_EMAIL;
    session.login.password = AUTHOR_PASSWORD;
    session.login.user_domain = "mydomain.net";

    /* Declare the message class */
    SMTP_Message message;
    /* Enable the chunked data transfer with pipelining for large message if server supported */
    message.enable.chunking = true;
    /* Set the message headers */
    message.sender.name = "ESP Mail";
    message.sender.email = AUTHOR_EMAIL;

    message.subject = EMAIL_SUBJECT;
    message.addRecipient("user1", RECIPIENT_EMAIL);

    // This defines how the message looks and the text in the message:
    String htmlMsg = "<span style=\"color:#ff0000;\">Lapse-O-Matic<br>This message contains ";
    htmlMsg += settings_config.NUMBER_PHOTOS;
    htmlMsg +=" attachment files.</span>";

    message.html.content = htmlMsg.c_str();
    message.html.charSet = "utf-8";
    message.html.transfer_encoding = Content_Transfer_Encoding::enc_qp;
    message.text.content = "Lapse-O-Matic Photos";
    message.text.charSet = "utf-8";
    message.text.transfer_encoding = Content_Transfer_Encoding::enc_base64;
    message.priority = esp_mail_smtp_priority::esp_mail_smtp_priority_normal;
    /* Set the custom message header */
    message.addHeader("Message-ID: <user1@gmail.com>");

    /* The attachment data item */
    /* Want to send all the photos we have just takem
       Names are in the PHOTO_NAME[COUNTUP] list
    */

    SMTP_Attachment att[settings_config.NUMBER_PHOTOS];
    int attIndex = 0;

    for (int i = 1; i <= settings_config.NUMBER_PHOTOS; i++)
    {
      /** Set the attachment info e.g.
         file name, MIME type, file path, file storage type,
         transfer encoding and content encoding
      */
      att[attIndex].descr.filename = PHOTO_NAME[i].c_str();
      att[attIndex].descr.mime = "image/jpeg";
      att[attIndex].file.path = PHOTO_NAME[i].c_str();
      att[attIndex].file.storage_type = esp_mail_file_storage_type_sd;
      att[attIndex].descr.transfer_encoding = Content_Transfer_Encoding::enc_base64;
      /* Add attachment to the message */
      message.addAttachment(att[attIndex]);
      attIndex++;
    }

    /* Connect to server with the session config */
    if (!smtp.connect(&session))
      return;
    /* Start sending the Email and close the session */
    if (!MailClient.sendMail(&smtp, &message, true))
      Serial.println("Error sending Email, " + smtp.errorReason());

    ESP_MAIL_PRINTF("Free Heap: %d\n", MailClient.getFreeHeap());
    smtp.sendingResult.clear();
    
  }
  else
  {
    Serial.println("Cannot start SD for mail client");
  }
}

/* Callback function to get the Email sending status */
void smtpCallback(SMTP_Status status)
{
  /* Print the current status */
  Serial.println(status.info());

  /* Print the sending result */
  if (status.success())
  {
    Serial.println("----------------");
    ESP_MAIL_PRINTF("Message sent success: %d\n", status.completedCount());
    ESP_MAIL_PRINTF("Message sent failled: %d\n", status.failedCount());
    Serial.println("----------------\n");
    struct tm dt;

    for (size_t i = 0; i < smtp.sendingResult.size(); i++)
    {
      /* Get the result item */
      SMTP_Result result = smtp.sendingResult.getItem(i);
      time_t ts = (time_t)result.timestamp;
      localtime_r(&ts, &dt);

      ESP_MAIL_PRINTF("Message No: %d\n", i + 1);
      ESP_MAIL_PRINTF("Status: %s\n", result.completed ? "success" : "failed");
      ESP_MAIL_PRINTF("Date/Time: %d/%d/%d %d:%d:%d\n", dt.tm_year + 1900, dt.tm_mon + 1, dt.tm_mday, dt.tm_hour, dt.tm_min, dt.tm_sec);
      ESP_MAIL_PRINTF("Recipient: %s\n", result.recipients);
      ESP_MAIL_PRINTF("Subject: %s\n", result.subject);
    }
    Serial.println("----------------\n");

    //You need to clear sending result as the memory usage will grow up as it keeps the status, timstamp and
    //pointer to const char of recipients and subject that user assigned to the SMTP_Message object.
    //Because of pointer to const char that stores instead of dynamic string, the subject and recipients value can be
    //a garbage string (pointer points to undefind location) as SMTP_Message was declared as local variable or the value changed.
    //smtp.sendingResult.clear();
  }
}
