/* ********* ESP32_CAM Wildlife Camera Unit **************************

    by Matt Little
    The Curious Electric Company (www.curiouselectric.co.uk)
    hello@curiouselectric.co.uk
    1/7/2025
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

    Notes on PCB desing:
    When on Lapse-o-matic PCB then the 3V3 regulator feeds back so you get 2.8V on the 3V3 line
    This can be removed, but then cannot be re-programmed unless there is a surce of 3V3 power (need charged battery installed.  )


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
    Update unit for ReadyMail - Done 3/7/2025
    Why getting camera errors? - Sometimes get problem with camera. - Is this ue to GPIO12 which is high at start = 1.8V flash? Need to set to 3.3V flash. Use fuses? - NO it was putting unit into 1 bit mode clashing. - Done 7/7/2025
    Need error feedback - flash 1 for OK, 2 for internet not OK, 3 for SD error, 5 for camera sync error - Added 7/7/2025
    NOT NEEDED: Add configuration via WifiManager - This is all handled on the SD card. The settings file has all the info for setting up the unit.


    To do:
    Sort out RTC to UNIX timestamp for emails
    Test power consumption. What can be done to get this as low as possible?

    Some Information that has been very useful
    https://randomnerdtutorials.com/esp32-cam-take-photo-save-microsd-card/
    https://www.olimex.com/Products/IoT/ESP32/ESP32-CAM/
    https://marksbench.com/electronics/esp32-cam-low-power-trail-camera/
    https://hackaday.com/2020/05/18/esp32-trail-camera-goes-the-distance-on-aa-batteries/
    https://randomnerdtutorials.com/esp32-cam-ai-thinker-pinout/
    https://dronebotworkshop.com/esp32-cam-intro/
    https://stuartsprojects.github.io/2022/02/05/Long-Range-Wireless-Adapter-for-ESP32CAM.html
    https://github.com/StuartsProjects/Devices/tree/master/Long%20Range%20Wireless%20Adapter%20for%20ESP32CAM%20V2

    Need to include the following libraries:
    ReadyMail by Mobizt
    https://github.com/mobizt/ReadyMail

*/

#include "esp_camera.h"
#include "Arduino.h"
#include "FS.h"
#include "SD_MMC.h"
#include "soc/soc.h"
#include "soc/rtc_cntl_reg.h"
#include "driver/rtc_io.h"
#include <Wire.h>
#include "RTClib.h"
#include <WiFi.h>
#include <WiFiClientSecure.h>

#define ENABLE_SMTP
#define ENABLE_FS
#include <ReadyMail.h>

#include "config.h"
#include "lapseomatic.h"
#include "utilitiesDL.h"

RTC_DS3231 rtc;
settings settings_config;

bool rtc_flag = true;
String filename = "";
uint32_t unix_time_now = 0;

// Store paths of photos captured in this wake cycle (up to 10)
#define MAX_PHOTOS 10
String photo_paths[MAX_PHOTOS];
int photos_saved = 0;

WiFiClientSecure ssl_client;
SMTPClient smtp(ssl_client);

// Forward declarations
void sendPhoto();
void check_mode_then_sleep();
void enable_sleep();
void enable_trigger();

// Global File object required by ReadyMail
File myFile;

// ReadyMail filesystem callback for SD_MMC
void fileCb(File &file, const char *filename, readymail_file_operating_mode mode) {
  switch (mode) {
    case readymail_file_mode_open_read:
      myFile = SD_MMC.open(filename, FILE_READ);
      break;
    case readymail_file_mode_open_write:
      myFile = SD_MMC.open(filename, FILE_WRITE);
      break;
    case readymail_file_mode_open_append:
      myFile = SD_MMC.open(filename, FILE_APPEND);
      break;
    case readymail_file_mode_remove:
      SD_MMC.remove(filename);
      break;
    default:
      break;
  }
  file = myFile;
}

void smtpCb(SMTPStatus status) {
  if (settings_config.DEBUG_FLAG) {
    if (status.progress.available) {
      Serial.printf("Uploading %s: %d%%\n", status.progress.filename.c_str(), status.progress.value);
    } else {
      Serial.println(status.text);
    }
  }
}

void setup() {
  WRITE_PERI_REG(RTC_CNTL_BROWN_OUT_REG, 0);  // Disable brownout detector

  Serial.begin(115200);
  delay(1000);
  Serial.println("\n--- BOOTING LAPSE-O-MATIC ---");

  print_wakeup_reason();
  switch_off_flash_LED();

  // Start I2C for DS3231 RTC on shared pins (GPIO 14 & 15)
  if (!Wire.begin(I2C_SDA, I2C_SCL) || !rtc.begin()) {
    Serial.println("Couldn't find RTC");
    rtc_flag = false;
  }

  if (rtc_flag) {
    if (rtc.lostPower()) {
      Serial.println("RTC lost power, setting compile time!");
      rtc.adjust(DateTime(F(__DATE__), F(__TIME__)));
    }
    DateTime now = rtc.now();
    filename = "D" + String(now.year()) + "_" + String(now.month()) + "_" + String(now.day()) + "_T" + String(now.hour()) + "_" + String(now.minute()) + "_" + String(now.second());
    unix_time_now = now.unixtime();
  } else {
    filename = "NO_RTC_" + String(millis());
  }

  // Release I2C pins before initializing SD_MMC on GPIO 14 & 15
  Wire.end();
  gpio_reset_pin(SD_CLK);
  gpio_reset_pin(SD_CMD);
  gpio_reset_pin(SD_DATA0);
  gpio_reset_pin(GPIO_PIN_WAKEUP);

  gpio_set_pull_mode(SD_CLK, GPIO_PULLUP_ONLY);
  gpio_set_pull_mode(SD_CMD, GPIO_PULLUP_ONLY);
  gpio_set_pull_mode(SD_DATA0, GPIO_PULLUP_ONLY);
  gpio_set_pull_mode(GPIO_PIN_WAKEUP, GPIO_PULLUP_ONLY);

  delay(100);

  // Mount SD card once in 1-bit mode
  if (!SD_MMC.begin("/sdcard", true)) {
    DEBUGLN(settings_config.DEBUG_FLAG, "SD Card Mount Fail");
    flash_error(3);
    check_mode_then_sleep();
  }

  if (SD_MMC.cardType() == CARD_NONE) {
    DEBUGLN(settings_config.DEBUG_FLAG, "No SD card attached");
    flash_error(3);
    check_mode_then_sleep();
  }

  DEBUGLN(settings_config.DEBUG_FLAG, "SD Card Mounted Successfully");

  // Load settings from /settings.txt on the SD card
  readSettings(SD_MMC, SETTINGS_FILENAME, settings_config);

  // Configure and initialize the OV2640 camera
  //camera_config_t config;
  camera_config_t config = {};

  configure_camera(config, settings_config);

  esp_err_t err = esp_camera_init(&config);

  if (err != ESP_OK) {
    Serial.printf("Camera init failed with error 0x%x\n", err);
    flash_error(4);
    SD_MMC.end();
    check_mode_then_sleep();
  }

  // Added to 'warm up' the camera:
  sensor_t *s = esp_camera_sensor_get();
  if (s != NULL) {
    s->set_quality(s, settings_config.IMAGE_QUALITY);

    // Enable Auto Exposure, Auto Gain, and Auto White Balance
    s->set_gain_ctrl(s, 1);                   // 1 = enable AGC
    s->set_exposure_ctrl(s, 1);               // 1 = enable AEC
    s->set_awb_gain(s, 1);                    // 1 = enable AWB gain
    s->set_aec2(s, 1);                        // 1 = enable night/low-light AEC DSP
    s->set_ae_level(s, 2);                    // Auto exposure bias: -2 to 2 (try 1 or 2 for brighter images)
    s->set_brightness(s, 1);                  // increase overall brightness
    s->set_gainceiling(s, (gainceiling_t)6);  // Max gain ceiling (0 to 6; 6 = 128x gain for dark scenes)
  }

  // if the flash is set then put the flash on first:
  switch_on_flash_LED();

  // Discard the first few frames so Auto Exposure (AEC) and White Balance (AWB) can settle
  for (int i = 0; i < 6; i++) {
    camera_fb_t *fb = esp_camera_fb_get();
    if (fb) {
      esp_camera_fb_return(fb);
    }
    delay(150);
  }

  switch_off_flash_LED();
}

void loop() {
  fs::FS &fs = SD_MMC;
  unsigned int countup = 1;
  photos_saved = 0;

  while (countup <= settings_config.NUMBER_PHOTOS) {

    // if the flash is set then put the flash on first:
    switch_on_flash_LED();

    camera_fb_t *fb = esp_camera_fb_get();
    if (!fb) {
      DEBUGLN(settings_config.DEBUG_FLAG, "Camera capture failed");
      switch_off_flash_LED();
      flash_error(5);
      break;
    }

    switch_off_flash_LED();

    // Build clean single-slash file path
    String path = "/" + filename + "_" + String(countup) + ".jpg";
    DEBUG(settings_config.DEBUG_FLAG, "Saving file: ");
    DEBUGLN(settings_config.DEBUG_FLAG, path);

    File file = fs.open(path.c_str(), FILE_WRITE);
    if (!file) {
      DEBUGLN(settings_config.DEBUG_FLAG, "Failed to open file for writing");
      flash_error(3);
    } else {
      size_t written = file.write(fb->buf, fb->len);
      if (written == fb->len) {
        DEBUGLN(settings_config.DEBUG_FLAG, "Saved photo successfully");
        if (photos_saved < MAX_PHOTOS) {
          photo_paths[photos_saved] = path;
          photos_saved++;
        }
      } else {
        DEBUGLN(settings_config.DEBUG_FLAG, "Partial write error on SD card");
        flash_error(3);
      }
      file.close();
    }

    esp_camera_fb_return(fb);

    if (countup < settings_config.NUMBER_PHOTOS) {
      delay(settings_config.PHOTO_DELAY);
    }
    countup++;
  }

  // Send photos via email if WIFI_SSID is set and at least 1 photo was saved
  settings_config.WIFI_SSID.trim();
  if (settings_config.WIFI_SSID.length() > 0 && photos_saved > 0) {
    sendPhoto();
  }

  // Unmount SD card cleanly before sleeping
  SD_MMC.end();
  check_mode_then_sleep();
}

void sendPhoto() {
  settings_config.WIFI_PASS.trim();
  settings_config.AUTHOR_EMAIL.trim();
  settings_config.AUTHOR_PASSWORD.trim();
  settings_config.SMTP_HOST.trim();
  settings_config.RECIPIENT_EMAIL.trim();
  settings_config.EMAIL_SUBJECT.trim();

  DEBUG(settings_config.DEBUG_FLAG, "Connecting to Wi-Fi: ");
  DEBUGLN(settings_config.DEBUG_FLAG, settings_config.WIFI_SSID);

  WiFi.mode(WIFI_STA);
  WiFi.begin(settings_config.WIFI_SSID.c_str(), settings_config.WIFI_PASS.c_str());

  unsigned long startAttempt = millis();
  while (WiFi.status() != WL_CONNECTED && millis() - startAttempt < 15000) {
    delay(250);
    DEBUG(settings_config.DEBUG_FLAG, ".");
  }
  DEBUGLN(settings_config.DEBUG_FLAG, "");

  if (WiFi.status() != WL_CONNECTED) {
    DEBUGLN(settings_config.DEBUG_FLAG, "Wi-Fi connection timed out. Skipping email.");
    WiFi.disconnect(true);
    return;
  }

  DEBUGLN(settings_config.DEBUG_FLAG, "Wi-Fi connected. Preparing email...");

  // Sync NTP time for TLS certificate validation
  configTime(0, 0, "pool.ntp.org", "time.nist.gov");
  time_t now = time(nullptr);
  unsigned long ntpStart = millis();
  while (now < 100000 && millis() - ntpStart < 5000) {
    delay(100);
    now = time(nullptr);
  }

  ssl_client.setInsecure();

  bool ssl = (settings_config.SMTP_PORT == 465);
  smtp.connect(settings_config.SMTP_HOST.c_str(), settings_config.SMTP_PORT, smtpCb, ssl);
  if (!smtp.isConnected()) {
    DEBUGLN(settings_config.DEBUG_FLAG, "SMTP connection failed.");
    WiFi.disconnect(true);
    return;
  }

  smtp.authenticate(settings_config.AUTHOR_EMAIL.c_str(),
                    settings_config.AUTHOR_PASSWORD.c_str(),
                    readymail_auth_password);
  if (!smtp.isAuthenticated()) {
    DEBUGLN(settings_config.DEBUG_FLAG, "SMTP authentication failed.");
    smtp.stop();
    WiFi.disconnect(true);
    return;
  }

  SMTPMessage msg;
  String sender = "Lapse-O-Matic <" + settings_config.AUTHOR_EMAIL + ">";
  msg.headers.add(rfc822_from, sender.c_str());
  msg.headers.add(rfc822_to, settings_config.RECIPIENT_EMAIL.c_str());
  msg.headers.add(rfc822_subject, settings_config.EMAIL_SUBJECT.c_str());
  msg.text.body("Captured " + String(photos_saved) + " photo(s) from Lapse-O-Matic.");

  // Attach all saved photos from this cycle using single-slash paths
  for (int i = 0; i < photos_saved; i++) {
    Attachment att;
    String cleanName = photo_paths[i].substring(1);  // Remove leading '/' for attachment filename
    att.filename = cleanName;
    att.name = cleanName;
    att.mime = "image/jpeg";
    att.attach_file.path = photo_paths[i];
    att.attach_file.callback = fileCb;
    msg.attachments.add(att, attach_type_attachment);
  }

  if (smtp.send(msg)) {
    DEBUGLN(settings_config.DEBUG_FLAG, "Email sent successfully!");
  } else {
    DEBUGLN(settings_config.DEBUG_FLAG, "Failed to send email.");
  }

  smtp.stop();
  WiFi.disconnect(true);
  WiFi.mode(WIFI_OFF);
}

void check_mode_then_sleep() {
  settings_config.MODE.trim();
  DEBUG(settings_config.DEBUG_FLAG, "Mode is: ");
  DEBUGLN(settings_config.DEBUG_FLAG, settings_config.MODE);

  if (settings_config.MODE == "LAPSE") {
    enable_sleep();
  } else {
    enable_trigger();
  }
}

void enable_sleep() {
  DEBUGLN(settings_config.DEBUG_FLAG, "Lapse mode. ZZzz..");
  switch_off_flash_LED();
  gpio_pullup_dis(SD_DATA0);
  esp_sleep_enable_timer_wakeup((uint64_t)settings_config.TIME_TO_SLEEP * uS_TO_S_FACTOR);
  Serial.flush();
  esp_deep_sleep_start();
}

void enable_trigger() {
  DEBUGLN(settings_config.DEBUG_FLAG, "Trigger mode. Waiting for trigger pin to go LOW...");
  switch_off_flash_LED();
  gpio_pullup_dis(SD_DATA0);

  // Configure GPIO 13 with floating input so can be pulled high externally.
  gpio_set_pull_mode(GPIO_PIN_WAKEUP, GPIO_PULLUP_ONLY);
  rtc_gpio_init(GPIO_PIN_WAKEUP);
  rtc_gpio_set_direction(GPIO_PIN_WAKEUP, RTC_GPIO_MODE_INPUT_ONLY);

  // Wait until GPIO 13 returns to LOW (0V) before sleeping
  unsigned long waitStart = millis();
  while (rtc_gpio_get_level(GPIO_PIN_WAKEUP) == 0) {
    delay(100);
    // Print a reminder every 2 seconds if the pin is stuck HIGH
    if (millis() - waitStart > 2000) {
      Serial.println("Waiting: GPIO 13 is still LOW...");
      waitStart = millis();
    }
  }
  DEBUGLN(settings_config.DEBUG_FLAG, "GPIO 13 is LOW. Entering deep sleep until next trigger. ZZzz..");
  esp_sleep_enable_ext0_wakeup(GPIO_PIN_WAKEUP, 0);  // Wake when GPIO 13 goes HIGH
  Serial.flush();
  esp_deep_sleep_start();
}
