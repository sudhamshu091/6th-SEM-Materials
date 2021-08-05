void setup() 
{
      Serial.begin(115200); // enable diagnostic data to be sent to
                        // the computer
      analogReference(INTERNAL1V5); // using the non-default
                                   // voltage reference of 1.5 Volts
}
void loop()
{
      
      
      long sensorValue = 0;
      long CelciusValue = 0;
      sensorValue = analogRead(A0); //LM35 sensor is connected to channel A0
      CelciusValue = (sensorValue *1500 ) / 40960; //formula to convert 12 bit values into deg c
      Serial.print(CelciusValue, DEC);
      Serial.print(" deg"); // Serial.write() can be used tosend a single
                        // character/byte
      Serial.println(" C");
      delay(500); // use this to delay new readings to once per second
}
