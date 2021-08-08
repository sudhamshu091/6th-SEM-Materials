

#include <SPI.h>
#include <WiFi.h>



char ssid[] = "kishan";
char password[] = "12345678";

long sensorValue = 0;
long CelciusValue = 0;


WiFiClient client;

WiFiServer server(80);

        void setup() 
        {
              Serial.begin(115200);      // initialize serial communication
              pinMode(RED_LED, OUTPUT);      // set the LED pin mode
              
              analogReference(INTERNAL1V5); // using the non-default
                                   // voltage reference of 1.5 Volts


              
              Serial.print("Attempting to connect to Network named: ");
              Serial.println(ssid);
              WiFi.begin(ssid, password);
              while ( WiFi.status() != WL_CONNECTED) 
              {
                // print dots while we wait to connect
                Serial.print(".");
                delay(300);
              }
            Serial.println("\nYou're connected to the network");
            Serial.println("Waiting for an ip address");
            
            while (WiFi.localIP() == INADDR_NONE) 
            {
               // print dots while we wait for an ip addresss
              Serial.print(".");
              delay(300);
            }

            PrintWifiStatus();
  
            Serial.println("Starting webserver on port 80");
            server.begin();                           // start the web server on port 80
            Serial.println("Webserver started!");
        }
      
void loop()
{
  client = server.available();
  if(client)
        {
    Serial.println("new client");
    boolean currentLineBlank=true;
    while(client.connected())
    {
      if(client.available())
      {
        char c=client.read();
        Serial.write(c);
        if(c='\n' && currentLineBlank)
        {
          SendResponseServer();
                      break;
        }
        if(c='\n')
        {
          currentLineBlank=true;
        }
        else if(c!='\r')
        {
          currentLineBlank=false;
        }
      }
    }
    delay(1);
    client.stop();
    Serial.println("client disconnected");  
  }
}

void SendResponseServer()
{
  // send a standard http response header
                      client.println("HTTP/1.1 200 OK");
                      client.println("Content-Type: text/html");
                      client.println("Connection: close");  // the connection will be closed after completion of the response
                      client.println("Refresh: 2");  // refresh the page automatically every 2 secs
                          client.println();
                      client.println("<!DOCTYPE HTML>");
                            client.println("<html>");
              
                      client.println("<head><title>WiFi Sensor Server</title></head><body align=center>");
                      client.println("<h1 align=center><font color=\"red\">Welcome to Sensor Server</font></h1>");
                      // output the value of each analog input pin
                      for (int analogChannel = 0; analogChannel <1 ; analogChannel++) //for multiple channels analogChanne<x; x=number of channels you want to sample
                      {
                          sensorValue = analogRead(A0);
                          CelciusValue=(sensorValue*1500)/40960;
                        client.print("Temperature Sensor Value is:");
                                           
                                            client.println("<html>");
                                            client.println( "<h1>");
                                            client.println("<mark>");
                                            client.println(CelciusValue);
                                            client.println("</marked>");
                                            client.print("</h1>");
                                            client.println("<br />");
                      } 
                      client.println("</html>");
  
}


void PrintWifiStatus() {
  // print the SSID of the network you're attached to:
  Serial.print("Network Name: ");
  Serial.println(WiFi.SSID());

  // print your WiFi shield's IP address:
  IPAddress ip = WiFi.localIP();
  Serial.print("IP Address: ");
  Serial.println(ip);
}
