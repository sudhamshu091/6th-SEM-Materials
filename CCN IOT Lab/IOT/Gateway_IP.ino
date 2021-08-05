#ifndef __CC3200R1M1RGC__
// Do not include SPI for CC3200 LaunchPad
#include <SPI.h>
#endif
#include <WiFi.h>

char ssid[]="Cliston";
char password[]="12345678";

void setup()
{
  Serial.begin(115200);
  
  Serial.print("Starting Access-Point...");
  WiFi.beginNetwork(ssid,password);
  
}

void loop()
{
  // put your main code here, to run repeatedly:
}
