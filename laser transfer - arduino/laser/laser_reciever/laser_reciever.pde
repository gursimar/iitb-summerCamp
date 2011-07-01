/*
Laser reciever
 */

#define PULSE_TIME 100
#define DELAY_TIME 100

char msg[15] = "";
char msg_char ='a';
int status_pin;
int n=5;  // msg size


void setup() {                
  // initialize the digital pin as an output.
  // Pin 13 has an LED connected on most Arduino boards:
  Serial.begin(9600);
  pinMode(13, INPUT);     
}

void loop() {
  
  // Listen to the start bit
  Serial.flush();
  
  Serial.print("Listening for incommming connections\n");
  
  if (digitalRead(13) != 0)
  {
      Serial.print("Request for connection is recieved and reciever is in listening mode\n");
      delay(40);
      
      // Sense the data 8 times..
      for (int i=7;i>=0;i--)
      {
        delay(98);  // 98 to compensate the extra programming delay time wasted
        status_pin = digitalRead(13);
        Serial.println(status_pin,DEC);

        if(status_pin)
        {
          // set the corresponding pin
          msg_char |= 1<<n;
        }
        else
        {
            //clear the bit
            msg_char &= ~(1<<n);
        }
      }
      Serial.print(msg_char);
      Serial.print(" is recieved");
      Serial.print("\n\n");
      msg[n] = msg_char;
      n--;  
  }
  Serial.print(msg);
  Serial.print(" has been recieved successfully");
}

