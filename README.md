# Wildlife_ESP_Cam
This is code, PCB and enclosure design for an ESP32_CAM based, solar powered wildlife camera

This unit is based on the ESP32_CAM.

Code has been written to upload onto the ESP32.

Control of the unit is through a "settings.txt" file on the SD card.

The unit can either be in "SLEEP" mode (where it wakes up every set period and takes a photo/number of photos) or it can be in "TRIGGER" mode where it will take a number of photos when the unit is triggered. It will then go back to sleep.

Triggering can either be done with a PIR, or with an external switch.

This unit has an input for a small solar panel to recharge an 18650 Li Ion cell, so it can be left for remote monitoring.

A flash can be implemented, with a start and stop delay to adjust shadow effects.

## ESP32 Code

## Settings file

## Solar Power

## PCB design


## Nice to have features (NOT implemented):

* Photo timestamp (needs RTC?)
* Wifi upload (if in range)



