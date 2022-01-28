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
    Unit can wake up with either LAPSE or TRIGGER.
    LAPSE will be every LAPSE seconds. TRIGGER will be on PIR or external switch.

    It uses a real time clock (RTC) to add a timestamp to the photo image.
    It will update the RTC to NTP time (UTC) if the unit connects to wifi at any point.
    This is checked each time it connects.

    This code now uploads the image(s) to Firebase (https://firebase.google.com/) for photo storage.
    Following this tutorial (caefully) for setting up your firebase account and details:
    https://randomnerdtutorials.com/esp32-cam-save-picture-firebase-storage/

    ***TO PROGRAM: Set Board to "AI Thinker ESP32-CAM"***

    Some Information that has been very useful
    https://randomnerdtutorials.com/esp32-cam-take-photo-save-microsd-card/
    https://www.olimex.com/Products/IoT/ESP32/ESP32-CAM/
    https://marksbench.com/electronics/esp32-cam-low-power-trail-camera/
    https://hackaday.com/2020/05/18/esp32-trail-camera-goes-the-distance-on-aa-batteries/
    https://randomnerdtutorials.com/esp32-cam-ai-thinker-pinout/
    https://dronebotworkshop.com/esp32-cam-intro/

    This new code uploads to firebase. Following this tutotorial:
    https://randomnerdtutorials.com/esp32-cam-save-picture-firebase-storage/

    Must include:
    Firebase Arduino Client Library for ESP8266 and ESP32 by Mobitz
    https://github.com/mobizt/Firebase-ESP-Client


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
    Need to change to use SD_MMC for 1-bit writing to SD card

    To do:
    Need error feedback - flash 1 for OK, 2 for internet not OK, 3 for SD error, 5 for camera sync error
    Add configuration via WifiManager (?)
    Add voltage measurement to check battery is OK - ADC? - Not easy with so few IO pins
    Shut down everything in sleep mode - at present using 5.8mA in Sleep!!!

    Sleep issues:
    Takes around 5mA (actually 4.6mA)
    Looks like LDO is issue:
    https://diyi0t.com/reduce-the-esp32-power-consumption/
    https://www.hackster.io/dontsovcmc/esp32-cam-current-measure-87c18f
    I dont need LDO on my board, as I already have one!
    Removed LDO - down to 2.6mA
    Removed camera - down to 0.47mA // Can I set GPIO to switch this off?

    Added this line:
    pinMode(OUTPUT_OPEN_DRAIN, GPIO_NUM_12);pinMode(OUTPUT_OPEN_DRAIN, GPIO_NUM_15);
    Now down to about 1.9mA 2.4mA (maybe 2.4mA after a while)

    Need to shut down the camera - uses about 1.9mA all the time...
    digitalWrite(PWDN_GPIO_NUM, HIGH);
    Does not do anything
    https://issueexplorer.com/issue/espressif/esp32-camera/247

    From this:
    https://github.com/espressif/esp32-camera/issues/33
    camera_disable_out_clock();
    and in camera config
    extern "C" { esp_err_t camera_enable_out_clock(camera_config_t *config); void camera_disable_out_clock(); }
    This does not seem to do much!

*/

#include <esp_camera.h>
#include <FS.h>
#include <SPI.h>
#include "SD_MMC.h"
#include <Preferences.h>
#include <Arduino.h>
#include <SPIFFS.h>
#include <WiFi.h>

#include <Firebase_ESP_Client.h>
//Provide the token generation process info.
#include <addons/TokenHelper.h>

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

#include "soc/soc.h"           // Disable brownout problems
#include "soc/rtc_cntl_reg.h"  // Disable brownout problems
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

//Define Firebase Data objects
FirebaseData fbdo;
FirebaseAuth auth;
FirebaseConfig configF;

// For NTP time server
const char* ntpServer = "pool.ntp.org";
const long  gmtOffset_sec = 0;
const int   daylightOffset_sec = 0;


void setup()
{
  WRITE_PERI_REG(RTC_CNTL_BROWN_OUT_REG, 0);  //disable brownout detector
  Serial.begin(115200);
  //Print the wakeup reason for ESP32
  print_wakeup_reason();
  DEBUGLN(settings_config.DEBUG_FLAG, "Starting");
  switch_off_flash_LED(); // Ensure LED is OFF to start.

  bool rtc_flag = true;

  initSPIFFS();
  clearSPIFFS();  // If files in SPIFFS then delete them!
  
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
  delay(10);

  if (!SD_MMC.begin("/sdcard", true))
  {
    // If we're here, there's a problem with the SD card.
    DEBUGLN(settings_config.DEBUG_FLAG, "SD Card Mount Fail");
    // We flash the LED to show an SD card error
    flash_error(3); // Flash 3 times for an SD card mount error
    // This checks the mode the unit is in and then goes to sleep accordingly
    check_mode_then_sleep();
  }


  // Query the card to make sure it's OK
  uint8_t SD_CARD = SD_MMC.cardType();
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
  readSettings(SD_MMC, SETTINGS_FILENAME, settings_config);


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

    fs::FS &fs = SD_MMC;


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
      checkRTC();
      flash_error(1); // Show that we have sent the email OK
    }
  }

  // Switch off wifi:
  WiFi.setSleep(true);
  // as the PIR is triggering due to the wifi activity, need to have a decent delay here after switching off wifi
  delay(20000);  //20 s delay before retrigger.
  // This checks the mode the unit is in and then goes to sleep accordingly
  check_mode_then_sleep();
}

void switch_off_gpio()
{
  // switch off all GPIO to stop consuming power
  pinMode(OUTPUT_OPEN_DRAIN, GPIO_NUM_12);
  pinMode(OUTPUT_OPEN_DRAIN, GPIO_NUM_15);

//  pinMode(OUTPUT_OPEN_DRAIN, CAM_PIN_XCLK);
//  digitalWrite(CAM_PIN_XCLK, LOW);
 
  //digitalWrite(CAM_PIN_PWDN, HIGH);
  gpio_set_level(GPIO_NUM_32,1);
  gpio_set_level(GPIO_NUM_0,0);
  gpio_deep_sleep_hold_en();
  
//  pinMode(OUTPUT_OPEN_DRAIN, CAM_PIN_SIOD);
//  pinMode(OUTPUT_OPEN_DRAIN, CAM_PIN_SIOC);
//  pinMode(OUTPUT_OPEN_DRAIN, CAM_PIN_D7);
//  pinMode(OUTPUT_OPEN_DRAIN, CAM_PIN_D6);
//  pinMode(OUTPUT_OPEN_DRAIN, CAM_PIN_D5);
//  pinMode(OUTPUT_OPEN_DRAIN, CAM_PIN_D4);
//  pinMode(OUTPUT_OPEN_DRAIN, CAM_PIN_D3);
//  pinMode(OUTPUT_OPEN_DRAIN, CAM_PIN_D2);
//  pinMode(OUTPUT_OPEN_DRAIN, CAM_PIN_D1);
//  pinMode(OUTPUT_OPEN_DRAIN, CAM_PIN_D0);
//  pinMode(OUTPUT_OPEN_DRAIN, CAM_PIN_VSYNC);
//  pinMode(OUTPUT_OPEN_DRAIN, CAM_PIN_HREF);
//  pinMode(OUTPUT_OPEN_DRAIN, CAM_PIN_PCLK);

}

void enable_sleep()
{
  switch_off_flash_LED();

  delay(10);
  //   Now go to sleep:
  esp_sleep_enable_timer_wakeup(settings_config.TIME_TO_SLEEP * uS_TO_S_FACTOR);
  switch_off_gpio();
  
  Serial.println("Setup ESP32 to sleep for " + String(settings_config.TIME_TO_SLEEP) + " Seconds");
  Serial.println("ZZZZzzzzz....");
  Serial.flush();
  esp_deep_sleep_start();
  Serial.println("This will never be printed");
}

void enable_trigger()
{
  switch_off_flash_LED();
  delay(10);
  
  //   Now go to sleep:
  esp_sleep_enable_ext0_wakeup(GPIO_PIN_WAKEUP, 0);
  switch_off_gpio();
  
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
  //Firebase
  char API_KEY[settings_config.API_KEY.length() + 2];
  settings_config.API_KEY.toCharArray(API_KEY, settings_config.API_KEY.length() + 1);
  char USER_EMAIL[settings_config.USER_EMAIL.length() + 2];
  settings_config.USER_EMAIL.toCharArray(USER_EMAIL, settings_config.USER_EMAIL.length() + 1);
  char USER_PASSWORD[settings_config.USER_PASSWORD.length() + 2];
  settings_config.USER_PASSWORD.toCharArray(USER_PASSWORD, settings_config.USER_PASSWORD.length() + 1);

  // Assign the api key
  configF.api_key = API_KEY;
  //Assign the user sign in credentials
  auth.user.email = USER_EMAIL;
  auth.user.password = USER_PASSWORD;

  //Assign the callback function for the long running token generation task
  configF.token_status_callback = tokenStatusCallback; //see addons/TokenHelper.h

  //Optional, set the size of HTTP response buffer
  //Prevent out of memory for large payload but data may be truncated and can't determine its type.
  fbdo.setResponseSize(1024); //minimum size is 1024 bytes

  Firebase.begin(&configF, &auth);
  Firebase.reconnectWiFi(true);

  // Move char strings into correct locations:
  char STORAGE_BUCKET_ID[settings_config.STORAGE_BUCKET_ID.length() + 2];
  settings_config.STORAGE_BUCKET_ID.toCharArray(STORAGE_BUCKET_ID, settings_config.STORAGE_BUCKET_ID.length() + 1);
  // Want to upload for each of the photos in the PHOTO_ARRAY
  for (int i = 1; i <= settings_config.NUMBER_PHOTOS; i++)
  {
    if (SD_MMC.begin("/sdcard", true))
    {
      Serial.print("Putting Image to SPIFFS... ");
      // move file from SD to SPIFFS
      File sourceFile = SD_MMC.open(PHOTO_NAME[i].c_str());
      File destFile = SPIFFS.open("/sendfile.jpg", FILE_WRITE);
      static uint8_t buf[512];
      while ( sourceFile.read( buf, 512) ) {
        destFile.write( buf, 512 );
      }
      destFile.close();
      sourceFile.close();
      Serial.println("Done");

      // Need to open this file from SPIFFS for it to send correctly?
      File file = SPIFFS.open("/sendfile.jpg", FILE_READ);

      if (Firebase.ready())
      {
        Serial.print("Uploading:");
        Serial.println(PHOTO_NAME[i].c_str());
        //MIME type should be valid to avoid the download problem.
        //The file systems for flash and SD/SDMMC can be changed in FirebaseFS.h.
        if (Firebase.Storage.upload(&fbdo, STORAGE_BUCKET_ID /* Firebase Storage bucket id */, "/sendfile.jpg" /* path to local file */, mem_storage_type_flash /* memory storage type, mem_storage_type_flash and mem_storage_type_sd */, PHOTO_NAME[i].c_str() /* path of remote file stored in the bucket */, "image/jpeg" /* mime type */)) {
          Serial.printf("\nDownload URL: %s\n", fbdo.downloadURL().c_str());
        }
        else
        {
          Serial.println(fbdo.errorReason());
        }
      }
      file.close();
      deleteFile(SPIFFS, "/sendfile.jpg");  // remove the file for next time
    }
    else
    {
      Serial.print("Upload Fail. SD MMC Card Issue");
      check_mode_then_sleep();
    }
  }
}

void checkRTC()
{
  // Here we want to check the RTC is in line with an NTP server
  //init and get the time
  configTime(gmtOffset_sec, daylightOffset_sec, ntpServer);
  struct tm timeinfo;
  if (!getLocalTime(&timeinfo)) {
    Serial.println("Failed to obtain time");
    return;
  }
  Serial.print("NTP: ");
  Serial.println(&timeinfo, "%A, %B %d %Y %H:%M:%S");

  // From the RTC:
  DateTime now = rtc.now();
  String timeStr = now.timestamp();
  Serial.print("RTC: ");
  Serial.println(timeStr);
  // ntp time is years since 1900
  // ntp time is month from 0-11
  // So we need to adjust those for use in RTC functions
  // Check they are in sync:
  if (now.year() != ( timeinfo.tm_year + 1900) || now.month() != (timeinfo.tm_mon + 1) || now.day() != (timeinfo.tm_mday) ||
      now.hour() != (timeinfo.tm_hour) || now.minute() != (timeinfo.tm_min) ||
      (now.second() - (timeinfo.tm_sec)) > 3 || ((timeinfo.tm_sec) - now.second()) > 3 )
  {
    // Need to adjust the RTC with the new time information:
    rtc.adjust(DateTime(timeinfo.tm_year + 1900, timeinfo.tm_mon + 1, timeinfo.tm_mday, timeinfo.tm_hour, timeinfo.tm_min, timeinfo.tm_sec));
    now = rtc.now();
    timeStr = now.timestamp();
    Serial.println("Adjusted the clock!");
    Serial.print("NEW RTC: ");
    Serial.println(timeStr);
  }
  else
  {
    Serial.println("Clock is OK");
  }
}


void initSPIFFS() {
  if (!SPIFFS.begin(true)) {
    Serial.println("An Error has occurred while mounting SPIFFS");
    ESP.restart();
  }
  else {
    Serial.println("SPIFFS mounted successfully");
  }
}

void deleteFile(fs::FS &fs, const char * path) {
  Serial.printf("Deleting file: %s\r\n", path);
  if (fs.remove(path)) {
    Serial.println("− file deleted");
  } else {
    Serial.println("− delete failed");
  }
}

void clearSPIFFS(){
 
  File root = SPIFFS.open("/");
  File file = root.openNextFile();
 
  while(file){
 
      Serial.print("FILE: ");
      Serial.println(file.name());
      deleteFile(SPIFFS, file.name());  // remove the file for next time (if it exists)
      file = root.openNextFile();
  }
 
}
