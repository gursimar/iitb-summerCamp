/*
  modified Blink
 Turns on an LED on for one second, then off for one second, repeatedly.
 
 This example code is in the public domain.
 */

#define PULSE_TIME 100
#define DELAY_TIME 100

char msg[] = "simar";
int flag_startcomm=1;
char msg_bit = 'a';
char msg_char ='a';


void setup() {                
  // initialize the digital pin as an output.
  // Pin 13 has an LED connected on most Arduino boards:
  Serial.begin(9600);
  pinMode(13, OUTPUT);     
}

void loop() {
  
  for (int ch = 0; msg_char !='\0'  ;ch++)
  {
    // To extract the character from the string
    msg_char = msg[ch];

  // here starts the protocol
    Serial.flush();
    Serial.print("Preparing to send the characteer to computer\n");
    Serial.print(msg_char);
    Serial.print("\n\n");
    // Delay for 2s
    delay(2000);

    // Send start bit
    digitalWrite(13,HIGH);
    delay(DELAY_TIME);
    digitalWrite(13,LOW);

    Serial.print("Data is being sent now\n");
    for (int n=7; n>=0;n--)
    {
      // To extract the bits from the character
      msg_bit = msg_char & (1<<n);
      msg_bit = msg_bit >>n;
      digitalWrite(13,msg_bit);
      
      Serial.println(msg_bit,DEC);
      Serial.print("\n");
      
      delay(PULSE_TIME);
    }
    // one char data has been sent..
    digitalWrite(13,0);
    Serial.print("The specified char has been sent\n\n\n");
  }
}

