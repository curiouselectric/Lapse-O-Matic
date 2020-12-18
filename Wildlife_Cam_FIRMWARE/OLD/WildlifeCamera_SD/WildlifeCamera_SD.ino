
/* ********* ESP32_CAM Wildlife Camera Unit **************************

    by Matt Little
    The Curious Electric Company (www.curiouselectric.co.uk)
    hello@curiouselectric.co.uk
    05/12/2020
    This code is Open Source - please adjust and use as you would like.
    Please ensure accreditation
    (although most of this code is based on work of others - see list below).

    More information (full files and firmware) is here:
    https://github.com/curiouselectric/Wildlife_ESP_Cam

    Idea for this code:
    Unit is solar powered with a lithium ion battery bank 18650 cell
    Unit wakes up with a PIR sensor or with external interrupt (via switched contacts) or via sleep mode.
    Reads each time the config file from the SD card - this tells it what mode to run in and other parameters.
    Need a "settings.config.txt" file on the SD card with thes config values.

    At that point the unit takes a number of photos with a delay between them
    Unit can wake up with either SLEEP or TRIGGER.
    SLEEP will be every sleep seconds. TRIGGER will be on PIR or external switch.

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

    To do:
    Setting RTC
    RTC too low resistor value - change it!
    Why getting camera errors?
    Send photos via email if on wifi (https://randomnerdtutorials.com/esp32-cam-send-photos-email/)
    https://rntlab.com/question/esp32-cam-send-email-with-attachment-from-sd-card-problem-no-attachment-in-email/
    Issue with SD_MMC and sending info with SD.
    My workaround: Take photos with SD_MMC. Then open with SD and send.

    Some Information that has been very useful
    https://randomnerdtutorials.com/esp32-cam-take-photo-save-microsd-card/
    https://www.olimex.com/Products/IoT/ESP32/ESP32-CAM/
    https://marksbench.com/electronics/esp32-cam-low-power-trail-camera/
    https://hackaday.com/2020/05/18/esp32-trail-camera-goes-the-distance-on-aa-batteries/
    https://randomnerdtutorials.com/esp32-cam-ai-thinker-pinout/
    https://dronebotworkshop.com/esp32-cam-intro/

    Need to include the following libraries:
    ESP32 Mail Client by Mobizt. Info from : https://randomnerdtutorials.com/esp32-cam-send-photos-email/
*/

#include <esp_camera.h>
#include <FS.h>
#include <SD_MMC.h>
#include <SPI.h>
#include <SD.h>
#include <Preferences.h>
#include <Arduino.h>
#include "ESP32_MailClient.h"
#include <SPIFFS.h>
#include <WiFi.h>

#include "config.h"
#include "camera_pins.h"
#include "Esp.h"
#include "utilitiesDL.h"
#include "wildlife_cam.h"

#include "driver/sdmmc_host.h"
#include "driver/sdspi_host.h"

// Date and time functions using a DS3231 RTC connected via I2C and Wire lib
#include <Wire.h>
#include "RTClib.h"
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
String PHOTO_NAME;          // Holds the name of the photo to send.

// WIFI Stuff
// REPLACE WITH YOUR NETWORK CREDENTIALS
const char* ssid              = "VM1790574";
const char* password          = "xvf8xdwfQgpf";

// To send Email using Gmail use port 465 (SSL) and SMTP Server smtp.gmail.com
// YOU MUST ENABLE less secure app option https://myaccount.google.com/lesssecureapps?pli=1

#define emailSenderAccount    "esp32camemailtest@gmail.com"
#define emailSenderPassword   "ESP32cam"
#define smtpServer            "smtp.gmail.com"
#define smtpServerPort        465
#define emailSubject          "ESP32-CAM Photo Captured"
#define emailRecipient        "matt@re-innovation.co.uk"

// The Email Sending data object contains config and data to send
SMTPData smtpData;

// END OF WIFI TEST

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
    // If the RTC does not start, wait for a little while (1 sec?)
    delay(500);
    // Then carry on, but without correct filename.
    DEBUGLN(settings_config.DEBUG_FLAG, "Couldn't find RTC");
    rtc_flag = false;
  }

  if (! rtc.begin()) {
    // If the RTC does not start, wait for a little while (1 sec?)
    // Then carry on, but without correct filename.
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
               (String)now.day() + "_T" + (String)now.hour() + "_" + (String)now.minute();
  }
  else
  {
    // RTC is not attached so cannot use it!
    filename = "NO_RTC_";
  }

  // *************** SORT OUT THE SD CARD ****************************** //
  //SDMMC_SLOT_CONFIG_DEFAULT();
  //  sdmmc_host_t host_slot;
  //  sdmmc_host_init_slot(SDMMC_HOST_SLOT_1, host_slot);

  // Start up the SD card, using 1-bit xfers instead of 4-bit (set the "true" option).
  // Frees up GPIO13.
  SPIClass spi = SPIClass(HSPI);
  spi.begin(14 /* SCK */, 2 /* MISO */, 15 /* MOSI */, 13 /* SS */);

  if (!SD_MMC.begin("/sdcard", true))
  {
    // If we're here, there's a problem with the SD card.
    DEBUGLN(settings_config.DEBUG_FLAG, "SD Card Mount Fail");
    // We flash the LED to show an SD card error
    flash_error(5); // Flash 5 times for an SD card mount error
    // This checks the mode the unit is in and then goes to sleep accordingly
    check_mode_then_sleep();
  }

  // Query the card to make sure it's OK
  uint8_t SD_CARD = SD_MMC.cardType();
  DEBUG(settings_config.DEBUG_FLAG, "Card Type:");

  if (SD_CARD == CARD_NONE) {
    // If we're here, there's a problem with the SD card.
    // Turn the ESP off and wait for the next trigger.
    //digitalWrite(13, LOW);
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
  readSettings(SD_MMC, SETTINGS_FILENAME, settings_config);

  // ************** START UP THE CAMERA ********************** //
  preferences.begin("trailcam", false); // Open nonvolatile storage (EEPROM) on the ESP in RW mode
  PIC_COUNT = preferences.getUShort("PIC_COUNT", 0);  // Get the stored picture count from the EEPROM.
  // Return 0 if it doesn't exist.
  // getUShort() fetches a 16-bit unsigned value
  // We add the Picture Count to give unique ID to the photoname

  configure_camera(config);
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
    fs::FS &fs = SD_MMC;

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
    SD_MMC.end();

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
    PHOTO_NAME = path;
    DEBUGLN(settings_config.DEBUG_FLAG, ("Path is: " + PHOTO_NAME));

    fs::FS &fs = SD_MMC;

    // Now, create a new file using the path and name set above.
    File file = fs.open(path.c_str(), FILE_WRITE);
    if (!file) {
      // If we're here, there's a problem creating a new file on the SD card.
      DEBUGLN(settings_config.DEBUG_FLAG, "Error wth creating file on SD");
      // This checks the mode the unit is in and then goes to sleep accordingly
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

  SD_MMC.end();

  // If we're here then we've taken the pictures and we are ready to shut down. Write the current file number to
  // the EEPROM, then set D13 low.
  preferences.putUShort("PIC_COUNT", PIC_COUNT);  // Store the picture count number in the EEPROM

  // ******** SEND IMAGE via WIFI *****************************
  // Connect to Wi-Fi
  WiFi.begin(ssid, password);
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
    //    if (!SPIFFS.begin(true)) {
    //      Serial.println("An Error has occurred while mounting SPIFFS");
    //      //ESP.restart();
    //    }
    //    else {
    //      delay(500);
    //      Serial.println("SPIFFS mounted successfully");
    //    }
    // Print ESP32 Local IP Address
    Serial.print("IP Address: http://");
    Serial.println(WiFi.localIP());
    sendPhoto();
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
  if (mode_string.indexOf(String("SLEEP")) >= 0)
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

  //  if (!SD_MMC.begin()) {
  //    Serial.println("Card Mount did not begin");
  //    return;
  //  }
  //  SD_MMC.end();
  //  delay(200);

  if (MailClient.sdBegin(14, 2, 15, 13))
  {
    // Set the storage type to attach files in your email (SPIFFS)
    //smtpData.setFileStorageType(MailClientStorageType::SPIFFS);
    smtpData.setFileStorageType(MailClientStorageType::SD);

    // Set the SMTP Server Email host, port, account and password
    smtpData.setLogin(smtpServer, smtpServerPort, emailSenderAccount, emailSenderPassword);

    // Set the sender name and Email
    smtpData.setSender("ESP32-CAM", emailSenderAccount);

    // Set Email priority or importance High, Normal, Low or 1 to 5 (1 is highest)
    smtpData.setPriority("High");

    // Set the subject
    smtpData.setSubject(emailSubject);

    // Set the email message in HTML format
    smtpData.setMessage("<h2>Photo captured with ESP32-CAM and attached in this email.</h2>", true);

    // Set the email message in text format
    //smtpData.setMessage("Photo captured with ESP32-CAM and attached in this email.", false);
    // Add recipients, can add more than one recipient
    smtpData.addRecipient(emailRecipient);
    //smtpData.addRecipient(emailRecipient2);
    Serial.print("File name is: ");
    Serial.println(PHOTO_NAME);

    // Add attach files from SPIFFS/SD
    //smtpData.addAttachFile(PHOTO_NAME, "image/jpg");
    smtpData.addAttachFile(PHOTO_NAME);

    smtpData.setSendCallback(sendCallback);

    // Start sending Email, can be set callback function to track the status
    if (!MailClient.sendMail(smtpData))
    {
      Serial.println("Error sending Email, " + MailClient.smtpErrorReason());
    }

    // Clear all data from Email object to free memory
    smtpData.empty();

    // In this case the GPIO pins are being overridden?
    // See this for info:
    // https://www.instructables.com/Select-SD-Interface-for-ESP32/
    SPI.endTransaction();

    if (!SD_MMC.begin("/sdcard", true))
    {
      Serial.println("SD_MMC not in 1-bit mode");
    }
    uint64_t cardSize = SD_MMC.cardSize() / (1024 * 1024);
    Serial.printf("SD_MMC Card Size: %lluMB\n", cardSize);
  }
  else
  {
    Serial.println("Cannot start SD for mail client");
  }
}

// Callback function to get the Email sending status
void sendCallback(SendStatus msg) {
  //Print the current status
  Serial.println(msg.info());
}
