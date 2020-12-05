#include "utilitiesDL.h"


// This is a debug routine:
void DEBUG(bool DBG_ENABLE, String info)
{
  if (DBG_ENABLE == HIGH)
  {
    Serial.print(info);
  }
}

void DEBUGLN(bool DBG_ENABLE, String info)
{
  if (DBG_ENABLE == HIGH)
  {
    Serial.println(info);
  }
}
