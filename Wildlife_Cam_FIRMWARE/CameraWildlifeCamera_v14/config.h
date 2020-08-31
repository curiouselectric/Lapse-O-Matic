#pragma once

#include <Arduino.h>
#include "utilitiesDL.h"

//
// WARNING!!! Make sure that you have either selected ESP32 Wrover Module,
//            or another board which has PSRAM enabled
//

// ***TO PROGRAM: Set Board to "AI Thinker ESP32-CAM"***
// Select camera model
//#define CAMERA_MODEL_WROVER_KIT
//#define CAMERA_MODEL_ESP_EYE
//#define CAMERA_MODEL_M5STACK_PSRAM
//#define CAMERA_MODEL_M5STACK_WIDE
#define   CAMERA_MODEL_AI_THINKER

#define   IMAGE_QUALITY   10
// Valid: 0-63, with 0 being highest quality and largest file size.
// Anything lower than 8 creates large file sizes that take a long time
// to save to the SD card.
// The camera and lens aren't the best quality, so huge files
// won't get you a better picture beyond a certain point.
#define   IMAGE_SIZE          FRAMESIZE_SXGA
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

#define   LED_FLASH_PIN       4           // GPIO pin for the flash LED
#define   LED_ONBOARD         33          // GPIO pin for the on-board LED
#define   GPIO_PIN_WAKEUP     GPIO_NUM_13

#define   MODE                "SLEEP"     // SLEEP is for sleep mode, with info below
// PIR is for PIR mode
#define   NUMBER_PHOTOS       3
#define   FLASH_FLAG          1           // 0 for off, 1 for on
#define   FLASH_START_DELAY   10          // mS to switch on light before taking photo - adjust for best quality
#define   FLASH_STOP_DELAY    5           // mS to switch on light before taking photo - adjust for best quality
#define   PHOTO_DELAY         500           // mS between photos (approx, due to photo time)

// SLEEP MODE
#define   TIME_TO_SLEEP       10          // Time (in sceonds) between wake ups
#define   uS_TO_S_FACTOR      1000000ULL  /* Conversion factor for micro seconds to seconds */

// PIR MODE
// No other info is needed, right?

#define   DEBUG_FLAG          1     // 0 for no debug 1 for debug on serial.
#define   DEBUG_PHOTO         1     // 0 for no debug 1 for debug on serial.
