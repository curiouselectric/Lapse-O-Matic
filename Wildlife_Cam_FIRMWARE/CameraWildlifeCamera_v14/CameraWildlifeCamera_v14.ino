
/* Some Information that might be useful

    https://randomnerdtutorials.com/esp32-cam-take-photo-save-microsd-card/
    https://www.olimex.com/Products/IoT/ESP32/ESP32-CAM/
    https://marksbench.com/electronics/esp32-cam-low-power-trail-camera/
    https://hackaday.com/2020/05/18/esp32-trail-camera-goes-the-distance-on-aa-batteries/
    https://randomnerdtutorials.com/esp32-cam-ai-thinker-pinout/
    https://dronebotworkshop.com/esp32-cam-intro/

    Idea for this code:

    Unit is solar powered with a lithium ion battery bank 18650 cell
    Unit wakes up with a PIR sensors (?) or with external interrupt (via switched contacts) or via sleep mode.

    Reads each time the config file from the SD card - this tells it what mode to run in and other parameters.

    Need a "settings.config.txt" file on the SD card.

    At that point the unit takes a clip of X seconds (adjustable) at a frame rate of Y (adjustable)

    PIR sensor information:
    Found some 3.3V PIR sensors - use those!
    Trigger neds to go through an NPN transistor.

    Solar Recharge info:
    I used the 18650 1-cell breakout board I'd made
    This has an 18650 cell available, but will need a ncie regulated 3.3V for the ESP32-Cam?

    To do:
    Sort out the LED on (at low glow level)? - This is solved.
    Sort out flash LED - only works on first reprogram

    Sort out interrupt via PIR unit
    Sort out running all at 3.3V?

    Sort out reprogramming with FTDI/USB



 *  ***TO PROGRAM: Set Board to "AI Thinker ESP32-CAM"***
 *  */
/* ESP32-CAM Low Power Trail Camera v1
   Mark's Bench (http://marksbench.com)
   Uses ESP32-Cam AI-Thinker with OV2640 camera to take pictures and save to SD card when triggered by PIR
   ESP32 is connected to power rail via MOSFET. MOSFET is initially turned on by PIR trigger and kept on by setting pin D13
   on the ESP32 high as soon as ESP starts up.

   ESP then takes 5 pictures and saves them to the SD card, after which it sets D13 low, which turns the MOSFET off,
   cutting the ESP off from the GND rail.

   If the PIR trigger remains high or goes high again during when the ESP32 would shut down, then take another five
   pictures and try shutting down again.

   Advantage to this scheme is a power savings - power draw is less than 20uA when the MOSFET
   is off and the ESP32 is shut down. Power draw is around 130-140mA when pictures are being taken and saved.

   Disadvantage is that when using both the camera and the SD card, there are no easily usable GPIO pins available.
   To get around this, use 1-bit SD card access instead of the usual 4-bit.
   It slows things down but you can still get an image with ok quality about once a second
   at full resolution (1600x1200) on the OV2640.

   Information on and code examples for using the ESP32-CAM library:
   https://github.com/yoursunny/esp32cam
   https://github.com/espressif/esp32-camera
   https://github.com/espressif/arduino-esp32/tree/master/libraries/ESP32/examples/Camera/CameraWebServer

   Information on and code examples for using the ESP32 SD_MMC library:
   https://github.com/espressif/arduino-esp32/tree/master/libraries/SD_MMC

   Information on using the ESP32 EEPROM (the Preferences library):
   https://github.com/espressif/arduino-esp32/tree/master/libraries/Preferences

   VERY useful ESP32 documentation:
   https://www.espressif.com/en/support/download/documents
   In particular, the "ESP32-WROOM-32 Datasheet", "ESP32 Datasheet", and "ESP32 Hardware Design Guidelines".
   Also, the schematic at:
   https://github.com/SeeedDocument/forum_doc/raw/master/reg/ESP32_CAM_V1.6.pdf
   And the specification page (which has some errors) at:
   https://github.com/raphaelbs/esp32-cam-ai-thinker/blob/master/assets/ESP32-CAM_Product_Specification.pdf

  // https://techtutorialsx.com/2020/06/27/esp32-connecting-to-sd-card/
  // In short, the SD library operates over SPI and the SD_MMC uses the SDMMC hardware bus
  // of the ESP32 [1]. So, depending on your hardware setup, you should choose the correct
  // library. For the board I’m using, I need to use the SC_MMC one.


*/

#include "config.h"
#include "camera_pins.h"
#include "Esp.h"
#include "utilitiesDL.h"

#include <esp_camera.h>
#include <FS.h>
#include <SPI.h>
#include <SD_MMC.h>
#include <Preferences.h>

#include "soc/soc.h"           // Disable brownour problems
#include "soc/rtc_cntl_reg.h"  // Disable brownour problems
#include "driver/rtc_io.h"

// The ESP32 EEPROM library is deprecated. Use the Preferences library instead.
Preferences preferences;


// ******* Global Variables ********

bool flash_flag = FLASH_FLAG;
int flash_start_delay = FLASH_START_DELAY;
int flash_stop_delay = FLASH_STOP_DELAY;
bool debug_flag = DEBUG_FLAG;
bool debug_photo = DEBUG_PHOTO;
unsigned int number_photos = NUMBER_PHOTOS;
unsigned int  time_to_sleep = TIME_TO_SLEEP;
String mode_type = MODE;
unsigned int photo_delay = PHOTO_DELAY;

char *name_array[] = { "FLASH_FLAG", "FLASH_START_DELAY", "FLASH_STOP_DELAY",
                       "DEBUG_FLAG", "DEBUG_PHOTO", "NUMBER_PHOTOS", "TIME_TO_SLEEP"
                       , "MODE", "PHOTO_DELAY"
                     };

// Create a variable to hold the picture number. Since the SD card is formatted FAT32, the maximum number of files
// there can be is 65534, so a 16-bit unsigned number will be fine.
uint16_t PIC_COUNT = 0;

void setup()
{
  WRITE_PERI_REG(RTC_CNTL_BROWN_OUT_REG, 0); //disable brownout detector
  Serial.begin(115200); // Uncomment for troubleshooting
  //Print the wakeup reason for ESP32
  print_wakeup_reason();

  DEBUGLN(debug_flag, "Starting");

  // *************** SORT OUT THE SD CARD ****************************** //
  // Start up the SD card, using 1-bit xfers instead of 4-bit (set the "true" option).
  // Frees up GPIO13.
  if (!SD_MMC.begin("/sdcard", true)) {
    // If we're here, there's a problem with the SD card.
    // Turn the ESP off and wait for the next trigger.
    //digitalWrite(13, LOW);
    DEBUGLN(debug_flag, "SD Card Mount Fail");
    // This checks the mode the unit is in and then goes to sleep accordingly
    check_mode();
  }

  // Query the card to make sure it's OK
  uint8_t SD_CARD = SD_MMC.cardType();
  DEBUG(debug_flag, "Card Type:");
  if (SD_CARD == CARD_NONE) {
    // If we're here, there's a problem with the SD card.
    // Turn the ESP off and wait for the next trigger.
    //digitalWrite(13, LOW);
    DEBUGLN(debug_flag, "No SD Card!");
    // This checks the mode the unit is in and then goes to sleep accordingly
    check_mode();
  } else if (SD_CARD == CARD_MMC) {

    DEBUGLN(debug_flag, "MMC");
  } else if (SD_CARD == CARD_SD) {
    DEBUGLN(debug_flag, "SDSC");
  } else if (SD_CARD == CARD_SDHC) {
    DEBUGLN(debug_flag, "SDHC");
  } else {
    DEBUGLN(debug_flag, "UNKNOWN");
  }
  // We are now done the setup and should be ready to take pictures
  // in the main loop() function.

  // Here we read the settings file from the SD card.
  // This will change any default settings defined
  readSettings(SD_MMC, SETTINGS_FILENAME);

  // ************** START UP THE CAMERA ********************** //
  preferences.begin("trailcam", false); // Open nonvolatile storage (EEPROM) on the ESP in RW mode
  PIC_COUNT = preferences.getUShort("PIC_COUNT", 0);  // Get the stored picture count from the EEPROM.

  // Return 0 if it doesn't exist.
  // getUShort() fetches a 16-bit unsigned value

  // Now, configure the camera with the pins defined above and recommended settings for xclk, led_c, and format.
  camera_config_t config;
  config.pin_d0     = CAM_PIN_D0;
  config.pin_d1     = CAM_PIN_D1;
  config.pin_d2     = CAM_PIN_D2;
  config.pin_d3     = CAM_PIN_D3;
  config.pin_d4     = CAM_PIN_D4;
  config.pin_d5     = CAM_PIN_D5;
  config.pin_d6     = CAM_PIN_D6;
  config.pin_d7     = CAM_PIN_D7;
  config.pin_xclk   = CAM_PIN_XCLK;
  config.pin_pclk   = CAM_PIN_PCLK;
  config.pin_vsync  = CAM_PIN_VSYNC;
  config.pin_href   = CAM_PIN_HREF;
  config.pin_sscb_sda = CAM_PIN_SIOD;
  config.pin_sscb_scl = CAM_PIN_SIOC;
  config.pin_pwdn   = CAM_PIN_PWDN;
  config.pin_reset  = CAM_PIN_RESET;
  config.xclk_freq_hz = 20000000;
  config.ledc_timer   = LEDC_TIMER_0;
  config.ledc_channel = LEDC_CHANNEL_0;
  config.pixel_format = PIXFORMAT_JPEG;

  // Make sure there is PSRAM available (the AI-Thinker module has PSRAM). Otherwise, don't go any further.
  if (psramFound())
  {
    config.frame_size = IMAGE_SIZE;  // If there's PSRAM then there's enough memory to capture up to 1600x1200
    config.jpeg_quality = IMAGE_QUALITY; // Valid: 0-63, with 0 being highest quality and largest file size.
    config.fb_count = 2;  // With the PSRAM, there's enough memory for two framebuffers, which speeds captures.
  }
  else {
    // The AI-Thinker module has PSRAM, so should never arrive here.
    DEBUGLN(debug_flag, "NO PSRAM FOUND");
    config.frame_size = FRAMESIZE_SVGA;
    config.jpeg_quality = 12;
    config.fb_count = 1;
  }

  // Start up the camera with the configuration settings made earlier in the "config." statements.
  esp_err_t err = esp_camera_init(&config);

  if (err != ESP_OK) {
    // If we're here, there's a problem communicating with the camera.
    // Turn the ESP off and wait for the next trigger.
    //digitalWrite(13, LOW);
    if (debug_flag == 1)
    {
      Serial.printf("Camera init failed with error 0x%x", err);
    }
    // This checks the mode the unit is in and then goes to sleep accordingly
    check_mode();
    return;
  }
}
void loop()
{
  uint8_t COUNTUP = 1;  // Create variable to take multiple pictures.
  DEBUG(debug_photo, "Photo");
  while (COUNTUP <= number_photos)
  {
    // Take number_photos pictures before shutting down.
    DEBUG(debug_photo, ":");
    DEBUG(debug_photo, (String)COUNTUP);

    if (flash_flag == true)
    {
      switch_on_flash_LED();
      digitalWrite(LED_FLASH_PIN, HIGH);
      delay(flash_start_delay);
    }
    // Take picture and read the frame buffer
    camera_fb_t * fb = esp_camera_fb_get();

    if (flash_flag == true)
    {
      delay(flash_stop_delay);
      digitalWrite(LED_FLASH_PIN, LOW);
    }
    if (!fb)
    {
      // This checks the mode the unit is in and then goes to sleep accordingly
      check_mode();
    }

    // Image captured: Save it here:
    // Want to use the date for the file name
    String path = "/pic" + String(PIC_COUNT) + "_" + String(COUNTUP) + "_of_" + String(number_photos) + ".jpg";

    fs::FS &fs = SD_MMC;

    // Now, create a new file using the path and name set above.
    File file = fs.open(path.c_str(), FILE_WRITE);
    if (!file) {
      // If we're here, there's a problem creating a new file on the SD card.
      // Turn off the ESP and wait for the next trigger.
      //digitalWrite(13, LOW);
      while (true) {
        // Need this loop to wait in case the PIR is keeping the power on.
        if (debug_flag == 1)
        {
          Serial.println("Error wth creating file on SD");
        }
        // This checks the mode the unit is in and then goes to sleep accordingly
        check_mode();
      }
    }
    else
    {
      // If we're here, the file was created. Now write the captured image to the file.
      file.write(fb->buf, fb->len);
      PIC_COUNT = PIC_COUNT + 1;  // Increment the picture count number each time there's a successful write.
      if (PIC_COUNT >= 65500) {
        PIC_COUNT = 0;  // FAT32 has a limit of 65534 files in a folder
      }
    }
    file.close(); // Done writing the file so close it.

    // Free the memory used by the framebuffer so it's available for another picture
    esp_camera_fb_return(fb);

    delay(photo_delay); // Wait between photos - adjustable

    COUNTUP = COUNTUP + 1;  // We are done an image capture cycle. Increment the count.
  }
  DEBUGLN(debug_photo, ":END");

  // If we're here then we've taken the pictures and we are ready to shut down. Write the current file number to
  // the EEPROM, then set D13 low.
  preferences.putUShort("PIC_COUNT", PIC_COUNT);  // Store the picture count number in the EEPROM


  // This checks the mode the unit is in and then goes to sleep accordingly
  check_mode();
}

void enable_sleep()
{
  switch_off_flash_LED();
  delay(500);
  //   Now go to sleep:
  esp_sleep_enable_timer_wakeup(time_to_sleep * uS_TO_S_FACTOR);
  Serial.println("Setup ESP32 to sleep for " + String(time_to_sleep) + " Seconds");
  Serial.println("ZZZZzzzzz....");
  Serial.flush();
  esp_deep_sleep_start();
  Serial.println("This will never be printed");
}

void enable_trigger()
{
  switch_off_flash_LED();
  delay(500);
  //   Now go to sleep:
  esp_sleep_enable_ext0_wakeup(GPIO_PIN_WAKEUP, 0);

  Serial.println("Setup ESP32 to sleep Until Trigger on GPIO 13");
  Serial.println("ZZZZzzzzz....");
  Serial.flush();
  esp_deep_sleep_start();
  Serial.println("This will never be printed");
}

void switch_off_flash_LED()
{
  // Turns off the ESP32-CAM white on-board LED (flash) connected to GPIO 4
  pinMode(LED_FLASH_PIN, OUTPUT);
  digitalWrite(LED_FLASH_PIN, LOW);
  rtc_gpio_hold_en(GPIO_NUM_4);
}

void switch_on_flash_LED()
{
  // Turns off the ESP32-CAM white on-board LED (flash) connected to GPIO 4
  pinMode(LED_FLASH_PIN, OUTPUT);
  digitalWrite(LED_FLASH_PIN, LOW);
  rtc_gpio_hold_dis(GPIO_NUM_4);
}

//Read a file in SD card
void readFile(fs::FS &fs, const char * path) {
  Serial.printf("Reading file: %s\n", path);
  File file = fs.open(path);
  if (!file) {
    Serial.println("Failed to open file for reading");
    return;
  }
  Serial.print("Read from file: ");
  while (file.available()) {
    Serial.write(file.read());
  }
}

//Read a file in SD card
void readSettings(fs::FS &fs, const char * path) {

  //  This reads in the settings file and updates the various global parameters as required.
  Serial.printf("Reading file: %s\n", path);
  File file = fs.open(path);
  if (!file) {
    Serial.println("Failed to open settings");
    return;
  }
  Serial.println("Updated:");

  // This is where the settings are read and parsed and stored in correct global settings.
  int setting_number = 0;
  String testString = "";   // Holds the input to check against parameter list
  String outputString = ""; // Returns the data
  bool data_flag = false;   // This is true when the names match
  bool data_valid = false;  // Set this high if we actually get some data...

  while (file.available())
  {
    char inChar = file.read();
    //Serial.print(inChar);

    if (inChar != ' ' && inChar != '=') // Dont worry about blanks or equals
    {
      if (inChar == '\n')
      {
        // This is the end of line, so output the values then reset everything
        // ready to start again
        if (data_valid == true)
        {
          // Only print if it is valid data:
          Serial.print(testString);
          Serial.print(" : ");
          switch (setting_number)
          {
            case 0:
              flash_flag = (bool)outputString;
              Serial.println(flash_flag);
              break;
            case 1:
              flash_start_delay = outputString.toInt();
              Serial.println(flash_start_delay);
              break;
            case 2:
              flash_stop_delay = outputString.toInt();
              Serial.println(flash_stop_delay);
              break;
            case 3:
              debug_flag = bool(outputString);
              Serial.println(debug_flag);
              break;
            case 4:
              debug_photo = bool(outputString);
              Serial.println(debug_photo);
              break;
            case 5:
              number_photos = outputString.toInt();
              Serial.println(number_photos);
              break;
            case 6:
              time_to_sleep = outputString.toInt();
              Serial.println(time_to_sleep);
              break;
            case 7:
              mode_type = outputString;
              Serial.println(mode_type);
              break;
            case 8:
              photo_delay = outputString.toInt();
              Serial.println(photo_delay);
              break;
          }
        }
        setting_number = 0; // reset
        testString = "";
        outputString = "";
        data_flag = false;
        data_valid = false;
      }
      else
      {
        if (data_flag == false)
        {
          testString += inChar;
        }
        else
        {
          outputString += inChar;
          data_valid = true; //We got some data so it is valid - need to do more checks here
        }

        // Here we want to check the testString against the list:
        for (int j = 0; j < 9; j++)
        {
          if (testString == name_array[j])
          {
            data_flag = true;
            setting_number = j; // We know which setting to update
          }
        }
      }
    }
  }
}

void print_wakeup_reason() {
  esp_sleep_wakeup_cause_t wakeup_reason;

  wakeup_reason = esp_sleep_get_wakeup_cause();

  switch (wakeup_reason) {
    case ESP_SLEEP_WAKEUP_EXT0 : Serial.println("Wakeup caused by external signal using RTC_IO"); break;
    case ESP_SLEEP_WAKEUP_EXT1 : Serial.println("Wakeup caused by external signal using RTC_CNTL"); break;
    case ESP_SLEEP_WAKEUP_TIMER : Serial.println("Wakeup caused by timer"); break;
    case ESP_SLEEP_WAKEUP_TOUCHPAD : Serial.println("Wakeup caused by touchpad"); break;
    case ESP_SLEEP_WAKEUP_ULP : Serial.println("Wakeup caused by ULP program"); break;
    default : Serial.printf("Wakeup was not caused by deep sleep: %d\n", wakeup_reason); break;
  }
}

void check_mode()
{
  // Here we either enable sleep or attach an interrupt....
  // depends upon mode_type
  // What mode are we in?
  Serial.print("Mode is: ");
  Serial.println(mode_type);

  if (mode_type.indexOf(String("SLEEP")) >= 0)
  {
    Serial.println("ZZZZzzzzz....");
    enable_sleep();
  }
  else if (mode_type.indexOf(String("TRIGGER")) >= 0)
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
