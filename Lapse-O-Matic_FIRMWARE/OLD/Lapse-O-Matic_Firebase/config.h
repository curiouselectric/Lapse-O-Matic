#pragma once

#include "utilitiesDL.h"
#include <Arduino.h>

// ***TO PROGRAM: Set Board to "AI Thinker ESP32-CAM"***
// Select camera model
//#define CAMERA_MODEL_WROVER_KIT
//#define CAMERA_MODEL_ESP_EYE
//#define CAMERA_MODEL_M5STACK_PSRAM
//#define CAMERA_MODEL_M5STACK_WIDE
#define   CAMERA_MODEL_AI_THINKER

//#define   IMAGE_QUALITY       10    // Set via SD card
#define   IMAGE_SIZE          FRAMESIZE_UXGA
// The following resolutions are available:
// 96x96 (96x96)
// QQVGA (160x120)
// QQVGA2 (128x160)
// QCIF (176x144)
// HQVGA (240x176)
// 240x240 (240x240)
// QVGA (320x240)
// CIF (400x296)
// VGA (640x480)
// SVGA (800x600)
// XGA (1024x768)
// SXGA (1280x1024)
// UXGA (1600x1200) **Full-resolution for OV2640

// ******** DEFAULT SETTINGS ARE ADDED HERE ********//

#define   SETTINGS_FILENAME   "/settings.txt"
#define   ERROR_FILENAME      "/error.txt"

#define   LED_FLASH_PIN       GPIO_NUM_4           // GPIO pin for the flash LED
#define   LED_ONBOARD         GPIO_NUM_33          // GPIO pin for the on-board LED
#define   GPIO_PIN_WAKEUP     GPIO_NUM_13
#define   I2C_SDA             GPIO_NUM_14
#define   I2C_SCL             GPIO_NUM_15

#define   uS_TO_S_FACTOR      1000000ULL  /* Conversion factor for micro seconds to seconds */

static const char *name_array[] = { "FLASH_FLAG", "FLASH_START_DELAY", "FLASH_STOP_DELAY", "DEBUG_FLAG",
                                    "DEBUG_PHOTO", "NUMBER_PHOTOS", "TIME_TO_SLEEP", "MODE", "PHOTO_DELAY",
                                    "WIFI_SSID", "WIFI_PASS", "USER_EMAIL", "USER_PASSWORD", "API_KEY",
                                    "STORAGE_BUCKET_ID", "IMAGE_QUALITY", "PIR_FLAG"
                                  };

class settings {
  public:
    bool          FLASH_FLAG = 1;         // 0 for off, 1 for on
    int           FLASH_START_DELAY = 10; // mS to switch on light before taking photo - adjust for best quality
    int           FLASH_STOP_DELAY = 10;  // mS to switch on light before taking photo - adjust for best quality
    bool          DEBUG_FLAG = 1;
    bool          DEBUG_PHOTO = 1;
    unsigned int  NUMBER_PHOTOS = 1;
    unsigned int  TIME_TO_SLEEP = 10;
    String        MODE = "TRIGGER";       // "LAPSE" is for sleep mode, with info below
    // "TRIGGER" is for PIR/external trigger mode
    unsigned int  PHOTO_DELAY = 500;      // mS between photos (approx, due to photo time)
    String        WIFI_SSID;
    String        WIFI_PASS;
    // Data for Firebase
    String        USER_EMAIL;
    String        USER_PASSWORD;
    String        API_KEY;
    String        STORAGE_BUCKET_ID;
    int           IMAGE_QUALITY = 10;
    // Valid: 0-63, with 0 being highest quality and largest file size.
    // Anything lower than 8 creates large file sizes that take a long time
    // to save to the SD card.
    // The camera and lens aren't the best quality, so huge files
    // won't get you a better picture beyond a certain point.
    bool          PIR_ENABLE = 0;   // Set true if PIR is used (need to delay retrigger


};
