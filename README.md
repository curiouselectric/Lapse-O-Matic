# Wildlife_ESP_Cam
This is code, PCB and enclosure design for an ESP32_CAM based, solar powered wildlife camera

This unit is based on the ESP32_CAM.

Code has been written to upload onto the ESP32.

Control of the unit is through a "settings.txt" file on the SD card.

The unit can either be in "SLEEP" mode (where it wakes up every set period and takes a photo/number of photos) or it can be in "TRIGGER" mode where it will take a number of photos when the unit is triggered. It will then go back to sleep.

Triggering can either be done with a PIR, or with an external switch.

This unit has an input for a small solar panel to recharge an 18650 Li Ion cell, so it can be left for remote monitoring.

A flash can be implemented, with a start and stop delay to adjust shadow effects.

This code relies heaviliy on the following tutorials and information:



## ESP32 Code

Please follow these instructions for setting up your arduino IDE to upload code to the ESP32_CAM.

There is no USB connection to the ESP32_CAM, so I used this nice programmer from Tindie (around £10 UK):
https://www.tindie.com/products/bitluni/cam-prog/

The code starts by reading the settings.txt file on the root directoy of the SD card. If the SD card fails to mount, then the unit will go to default settings, which will mean sleeping for 10 seconds then trying the SD card again.
If there is no settings.txt file then the unit will use the default values (stored in the config.h page of the firmware).


## Settings file

Here is an example settings.txt file:


    // Adjust these settings as required: //
    
    FLASH_FLAG = 0

    NUMBER_PHOTOS = 4
    
    TIME_TO_SLEEP = 8
    
    MODE = TRIGGER
    
    PHOTO_DELAY = 250
    
    FLASH_START_DELAY = 100
    
    FLASH_STOP_DELAY = 100
     
    DEBUG_FLAG = 1
    
    DEBUG_PHOTO = 1
    
    
    // END OF SETTINGS - LEAVE THIS LINE  //

* FLASH_FLAG - Use a flash with the photo? (0 (OFF) or 1 (ON))
* NUMBER_PHOTOS - How many photos to take when waking up?
* TIME_TO_SLEEP - How long (in seconds) between wake-ups (when in SLEEP mode)
* MODE - The mode to use is either SLEEP (wake up every TOME_TO_SLEEP seconds) or TRIGGER (either wkae up on PIR trigger or external trigger)
* PHOTO_DELAY - delay (in milli Seconds) between taking the photos.
* FLASH_START_DELAY - Flash will switch on then wait this time before taking photo (in milli Seconds)
* FLASH_STOP_DELAY - Flash will be on and wait this time after taking photo (in milli Seconds)
* DEBUG_FLAG - See debug info on serial port (0 (OFF) or 1 (ON))
* DEBUG_PHOTO - See debug info on serial port (0 (OFF) or 1 (ON))

*Note: Spaces and equals signs are ignored in the parser, so does not matter how many spaces there are.*

## Solar Power

## PCB design


## Nice to have features (NOT implemented):

* Photo timestamp (needs RTC?)
* Wifi upload (if in range)



