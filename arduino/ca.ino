#include <Adafruit_MAX31865.h>

#define RREF      4300.0
#define RNOMINAL  1000.0


Adafruit_MAX31865 panneau = Adafruit_MAX31865(10,11,12,13);
Adafruit_MAX31865 ballon = Adafruit_MAX31865(2, 3, 4, 5);

int  Tpanneau = 0;            
int Tballon = 0;
 
int Rmin = 20; 
int Rmax = 255 ;
int R = 0;
int Revo=20 ;
int mot = 9;           // the PWM pin
int incomingByte =0;

void setup() {

  pinMode(mot, OUTPUT);
 
  
  ballon.begin(MAX31865_2WIRE);    
  panneau.begin(MAX31865_2WIRE);   


    Serial.begin(9600);

    

}

void loop() {

  
  Tpanneau = panneau.temperature(RNOMINAL, RREF); 
  Tballon = ballon.temperature(RNOMINAL, RREF);
  
  Serial.print(Tpanneau);

  Serial.print("    ");   

  Serial.println(Tballon);   



 if (Serial.available() > 0) {
  incomingByte = Serial.read();
        

  if (incomingByte == 49) {
  analogWrite(mot,0);
                          }

  if (incomingByte == 50) {
  analogWrite(mot,Rmax);
  delay(10000);
  analogWrite(mot,Rmin);
  delay(60000);
                          }

  if (incomingByte == 51) {
  while (Revo < 255) {
  Revo = Revo + (10*Revo)/100 ;
   Serial.println(Revo);   
  analogWrite(mot,Revo);
  delay(60000);
                    }
                    Revo=20; 
                         }
                          }

delay(2000);
  
 
}
  
 
