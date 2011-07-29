#define F_CPU 1000000UL
#include <avr/io.h>
#include <util/delay.h>

void initADC()
{
   ADCSRA |= (1 << ADPS2) | (1 << ADPS1) | (1 << ADPS0); // Set ADC prescalar to 128 - 125KHz sample rate @ 16MHz 

   ADMUX |= (1 << REFS0); // Set ADC reference to AVCC
   ADMUX |= (1 << ADLAR); // Left adjust ADC result to allow easy 8 bit reading 

   	// No MUX values needed to be changed to use ADC0 

	//   ADCSRA |= (1 << ADATE);  // Set ADC auto trigger enable
   ADCSRA |= (1 << ADEN);  // Enable ADC 

	/* The ADSC bit is 1 when the conversion is going on and
	cleared by harware when done */
   ADCSRA |= (1 << ADSC);  // Start A2D Conversions 

}



int main (void) 
{ 

   DDRD=0xFF;	//used as output pins
   DDRB=0x00;	//used as output pins
   unsigned int i=0;

   //uint8_t brightness=0;

	initADC();

   for(;;)  // Loop Forever 
   { 
       //PORTD = PINB&0b00000001; // Turn on LED2
//	   _delay_ms(1000);

// LOOP
	//start conversion...
	   ADCSRA |= (1 << ADSC);  // Start A2D Conversions 

	// This one waits until the conversion completes..	
	  while((ADCSRA&(1<<ADSC))==1);
	  //_delay_ms(8000);

	// Turns ON the relevant LED
	  if(ADCH < 165) 
      { 
		 i++;
		 if(i>1000)
		 {
	         PORTD = 0b00000000; // Turn OFF LED1 
			 i=0;
		 	
		 }
		 
      } 

	  
	  else
	  {
         PORTD = 0b00000001; // Turn ON LED1 
		 i=0;
	  	
	  }

   } 
}
