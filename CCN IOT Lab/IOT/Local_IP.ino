#ifndef __CC3100R1M1RGC__
// Do not include SPI for CC3200 LaunchPad
#include <SPI.h>
#endif
#include <WiFi.h>

char ssid[]="FD-12";
char password[]="chotu123";

IPAddress ip;

void setup()
{
  Serial.begin(115200); //Initialize Serial Port
  //attempt to connect to wifi
  Serial.print("Attempting to connect to Network named: ");
  // print the network name (SSID);
  Serial.println(ssid);
  
  //Connect to WiFI
  WiFi.begin(ssid, password);
  
  //Wait untill wifi is connected
  while ( WiFi.status() != WL_CONNECTED) 
  {
    // print dots while we wait to connect
    Serial.print(".");
    delay(300);
  }
  
  //If you are connected print the IP Address
  Serial.println("\nYou're connected to the network");
  
  //wait untill you get an IP address
  while (WiFi.localIP() == INADDR_NONE) {
  // print dots while we wait for an ip addresss
  Serial.print(".");
  delay(300);
  }
  
  
  ip=WiFi.localIP();
  Serial.println(ip);
}

void loop()
{
  // put your main code here, to run repeatedly:
  
}
