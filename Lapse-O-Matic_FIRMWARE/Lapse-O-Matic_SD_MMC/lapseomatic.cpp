#include "lapseomatic.h"
#include "config.h"
#include "soc/soc.h"           // Disable brownout problems
#include "soc/rtc_cntl_reg.h"  // Disable brownout problems
#include "driver/rtc_io.h"
#include "camera_pins.h"

void switch_off_flash_LED()
{
  // Turns off the ESP32-CAM white on-board LED (flash) connected to GPIO 4
  pinMode(LED_FLASH_PIN, OUTPUT);
  digitalWrite(LED_FLASH_PIN, LOW);
  rtc_gpio_hold_en(GPIO_NUM_4);
}

void switch_on_flash_LED()
{
  // Turns on the ESP32-CAM white on-board LED (flash) connected to GPIO 4
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

  // Here when we wake up we reslease the GPIO pin that might have been previously held (LED Pin):
  rtc_gpio_hold_dis(GPIO_NUM_4);    // Other wise this causes SD card reading issues...
  

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
    if (inChar != '=') // Dont worry about equals
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
              _settings_config.AUTHOR_EMAIL  = outputString;
              Serial.println(_settings_config.AUTHOR_EMAIL);
              break;
            case 12:
              _settings_config.AUTHOR_PASSWORD  = outputString;
              Serial.println(_settings_config.AUTHOR_PASSWORD);
              break;
            case 13:
              _settings_config.SMTP_HOST = outputString;
              Serial.println(_settings_config.SMTP_HOST);
              break;
            case 14:
              _settings_config.SMTP_PORT = outputString.toInt();
              Serial.println(_settings_config.SMTP_PORT);
              break;
            case 15:
              _settings_config.RECIPIENT_EMAIL = outputString;
              Serial.println(_settings_config.RECIPIENT_EMAIL);
              break;
            case 16:
              _settings_config.EMAIL_SUBJECT = outputString;
              Serial.println(_settings_config.EMAIL_SUBJECT);
              break;
            case 17:
              _settings_config.IMAGE_QUALITY = outputString.toInt();
              Serial.println(_settings_config.IMAGE_QUALITY);
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
        for (int j = 0; j < 18; j++)
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
  file.close();
}

void configure_camera(camera_config_t &_config, settings &_settings_config)
{
  // This configures all the info for the camera set up
  _config.pin_d0     = CAM_PIN_D0;
  _config.pin_d1     = CAM_PIN_D1;
  _config.pin_d2     = CAM_PIN_D2;
  _config.pin_d3     = CAM_PIN_D3;
  _config.pin_d4     = CAM_PIN_D4;
  _config.pin_d5     = CAM_PIN_D5;
  _config.pin_d6     = CAM_PIN_D6;
  _config.pin_d7     = CAM_PIN_D7;
  _config.pin_xclk   = CAM_PIN_XCLK;
  _config.pin_pclk   = CAM_PIN_PCLK;
  _config.pin_vsync  = CAM_PIN_VSYNC;
  _config.pin_href   = CAM_PIN_HREF;
  _config.pin_sscb_sda = CAM_PIN_SIOD;
  _config.pin_sscb_scl = CAM_PIN_SIOC;
  _config.pin_pwdn   = CAM_PIN_PWDN;
  _config.pin_reset  = CAM_PIN_RESET;
  _config.xclk_freq_hz = 20000000;
  _config.ledc_timer   = LEDC_TIMER_0;
  _config.ledc_channel = LEDC_CHANNEL_0;
  _config.pixel_format = PIXFORMAT_JPEG;

  // Make sure there is PSRAM available (the AI-Thinker module has PSRAM). Otherwise, don't go any further.
  if (psramFound())
  {
    _config.frame_size = IMAGE_SIZE;  // If there's PSRAM then there's enough memory to capture up to 1600x1200
    _config.jpeg_quality = _settings_config.IMAGE_QUALITY; // Valid: 0-63, with 0 being highest quality and largest file size.
    _config.fb_count = 2;  // With the PSRAM, there's enough memory for two framebuffers, which speeds captures.
  }
  else {
    // The AI-Thinker module has PSRAM, so should never arrive here.
    //DEBUGLN(settings_config.DEBUG_FLAG, "NO PSRAM FOUND");
    _config.frame_size = FRAMESIZE_SVGA;
    _config.jpeg_quality = 12;
    _config.fb_count = 1;
  }
}
