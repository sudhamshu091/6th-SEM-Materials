#ifndef __CC3200R1M1RGC__
// Do not include SPI for CC3200 LaunchPad
#include <SPI.h>
#endif
#include <WiFi.h>
char ssid[]= "IOTLAB";
char password[]= "abcdef123";

int status=WL_IDLE_STATUS;

uint16_t port =9999;     // port number of the server
IPAddress server(192,168,1,122);   // IP Address of the server
WiFiClient client;



void setup()
{
  Serial.begin(115200);
  WiFi.begin(ssid, password);
  
  while(WiFi.status()!=WL_CONNECTED)
  {
    Serial.println("Waiting for Wi-Fi Connection");
     Serial.print(".");
    delay(300);
  }
  
  Serial.println("WiFi Connected");
  Serial.println("Attempting to connect to Server");
  
  while(!client.connect(server,port));
  //{
    Serial.println("Connected to Server");
 // }
  
  
  
}

void loop()
{
  if(client.available())
  {
    char c=client.read();
    Serial.print(c);
  }
  
}
