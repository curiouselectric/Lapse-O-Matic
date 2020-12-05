#include "wildlife_cam.h"
#include "config.h"
#include "soc/soc.h"           // Disable brownour problems
#include "soc/rtc_cntl_reg.h"  // Disable brownour problems
#include "driver/rtc_io.h"

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

void flash_error(int _flash_number)
{
  // This shows errors when they occure
  switch_on_flash_LED();
  for (int z = 0; z < _flash_number; z++)
  {
    digitalWrite(LED_FLASH_PIN, HIGH);
    delay(50);
    digitalWrite(LED_FLASH_PIN, LOW);
    delay(200);
  }
}

void print_wakeup_reason()
{

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
void readSettings(fs::FS &fs, const char * path, settings &_settings_config) {

  //  This reads in the settings file and updates the various global parameters as required.
  Serial.printf("Reading file: %s\n", path);
  File file = fs.open(path);
  if (!file) {
    Serial.println("Failed to open settings");
    flash_error(2);
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
              _settings_config.FLASH_FLAG = bool(outputString.toInt());
              Serial.println(_settings_config.FLASH_FLAG);
              break;
            case 1:
              _settings_config.FLASH_START_DELAY = outputString.toInt();
              Serial.println(_settings_config.FLASH_START_DELAY);
              break;
            case 2:
              _settings_config.FLASH_STOP_DELAY = outputString.toInt();
              Serial.println(_settings_config.FLASH_STOP_DELAY);
              break;
            case 3:
              _settings_config.DEBUG_FLAG = bool(outputString.toInt());
              Serial.println(_settings_config.DEBUG_FLAG);
              break;
            case 4:
              _settings_config.DEBUG_PHOTO = bool(outputString.toInt());
              Serial.println(_settings_config.DEBUG_PHOTO);
              break;
            case 5:
              _settings_config.NUMBER_PHOTOS = outputString.toInt();
              Serial.println(_settings_config.NUMBER_PHOTOS);
              break;
            case 6:
              _settings_config.TIME_TO_SLEEP = outputString.toInt();
              Serial.println(_settings_config.TIME_TO_SLEEP);
              break;
            case 7:
              _settings_config.MODE = outputString;
              Serial.println(_settings_config.MODE );
              break;
            case 8:
              _settings_config.PHOTO_DELAY  = outputString.toInt();
              Serial.println(_settings_config.PHOTO_DELAY);
              break;
            case 9:
              _settings_config.WIFI_SSID  = outputString;
              Serial.println(_settings_config.WIFI_SSID);
              break;
            case 10:
              _settings_config.WIFI_PASS  = outputString;
              Serial.println(_settings_config.WIFI_PASS);
              break;
            case 11:
              _settings_config.WIFI_EMAIL  = outputString;
              Serial.println(_settings_config.WIFI_EMAIL);
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
        for (int j = 0; j < 12; j++)
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
