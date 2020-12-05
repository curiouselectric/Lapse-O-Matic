#pragma once

#include <FS.h>
#include "config.h"

// This holds the various subroutines for the wifie camera to use
// This makes main code easier to read.



void switch_off_flash_LED();
void switch_on_flash_LED();
void flash_error(int my_flash_number);
void print_wakeup_reason();

void readFile(fs::FS &fs, const char * path,settings &my_settings_config);
void readSettings(fs::FS &fs, const char * path, settings &my_settings_config);
