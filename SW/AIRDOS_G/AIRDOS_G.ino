#define DEBUG // Please comment it if you are not debugging
String githash = "d2d1e0d";
String FWversion = "G3";

/*
  AIRDOS02A (RTC, GPS)
 
3 month endurance with LS 33600 = 7.6 mA

ISP
---
PD0     RX
PD1     TX
RESET#  through 50M capacitor to RST#

SDcard
------
DAT3   SS   4 B4
CMD    MOSI 5 B5
DAT0   MISO 6 B6
CLK    SCK  7 B7

ANALOG
------
+      A0  PA0
-      A1  PA1
RESET  0   PB0

LED
---
LED_red  23  PC7         // LED for Dasa


                     Mighty 1284p    
                      +---\/---+
           (D 0) PB0 1|        |40 PA0 (AI 0 / D24)
           (D 1) PB1 2|        |39 PA1 (AI 1 / D25)
      INT2 (D 2) PB2 3|        |38 PA2 (AI 2 / D26)
       PWM (D 3) PB3 4|        |37 PA3 (AI 3 / D27)
    PWM/SS (D 4) PB4 5|        |36 PA4 (AI 4 / D28)
      MOSI (D 5) PB5 6|        |35 PA5 (AI 5 / D29)
  PWM/MISO (D 6) PB6 7|        |34 PA6 (AI 6 / D30)
   PWM/SCK (D 7) PB7 8|        |33 PA7 (AI 7 / D31)
                 RST 9|        |32 AREF
                VCC 10|        |31 GND
                GND 11|        |30 AVCC
              XTAL2 12|        |29 PC7 (D 23)
              XTAL1 13|        |28 PC6 (D 22)
      RX0 (D 8) PD0 14|        |27 PC5 (D 21) TDI
      TX0 (D 9) PD1 15|        |26 PC4 (D 20) TDO
RX1/INT0 (D 10) PD2 16|        |25 PC3 (D 19) TMS
TX1/INT1 (D 11) PD3 17|        |24 PC2 (D 18) TCK
     PWM (D 12) PD4 18|        |23 PC1 (D 17) SDA
     PWM (D 13) PD5 19|        |22 PC0 (D 16) SCL
     PWM (D 14) PD6 20|        |21 PD7 (D 15) PWM
                      +--------+
*/

/*
// Compiled with: Arduino 1.8.9
// MightyCore 2.0.2 https://mcudude.github.io/MightyCore/package_MCUdude_MightyCore_index.json
Fix old bug in Mighty SD library
~/.arduino15/packages/MightyCore/hardware/avr/2.0.2/libraries/SD/src/SD.cpp:
boolean SDClass::begin(uint32_t clock, uint8_t csPin) {
  if(root.isOpen()) root.close();
*/

#include <SD.h>             // Revised version from MightyCore
#include "wiring_private.h"
#include <Wire.h>           
#include "src/RTCx/RTCx.h"  // Modified version icluded

#define LED_red   23   // PC7
#define RESET     0    // PB0
#define GPSpower  26   // PA2
#define SDpower1  1    // PB1
#define SDpower2  2    // PB2
#define SDpower3  3    // PB3
#define SS        4    // PB4
#define MOSI      5    // PB5
#define MISO      6    // PB6
#define SCK       7    // PB7
#define INT       20   // PC4

#define CHANNELS 512   // number of channels in buffer for histogram, including negative numbers
#define GPSerror 70000 // number of cycles for waitig for GPS in case of GPS error 
#define GPSdelay 5    // number of measurements between obtaining GPS position
#define GPSthreshold 3*GPSdelay  // ionising radiation flux threshold for obtaining GPS position

uint16_t count = 0;
uint32_t serialhash = 0;
uint16_t offset, base_offset;
uint8_t lo, hi;
uint16_t u_sensor, maximum;
struct RTCx::tm tm;

// Read Analog Differential without gain (read datashet of ATMega1280 and ATMega2560 for refference)
// Use analogReadDiff(NUM)
//   NUM  | POS PIN             | NEG PIN           |   GAIN
//  0 | A0      | A1      | 1x
//  1 | A1      | A1      | 1x
//  2 | A2      | A1      | 1x
//  3 | A3      | A1      | 1x
//  4 | A4      | A1      | 1x
//  5 | A5      | A1      | 1x
//  6 | A6      | A1      | 1x
//  7 | A7      | A1      | 1x
//  8 | A8      | A9      | 1x
//  9 | A9      | A9      | 1x
//  10  | A10     | A9      | 1x
//  11  | A11     | A9      | 1x
//  12  | A12     | A9      | 1x
//  13  | A13     | A9      | 1x
//  14  | A14     | A9      | 1x
//  15  | A15     | A9      | 1x
#define PIN 0
uint8_t analog_reference = INTERNAL2V56; // DEFAULT, INTERNAL, INTERNAL1V1, INTERNAL2V56, or EXTERNAL

void setup()
{

  // Open serial communications
  Serial.begin(9600);
  Serial1.begin(9600);

  Serial.println("#Cvak...");
  
  ADMUX = (analog_reference << 6) | ((PIN | 0x10) & 0x1F);
  
  ADCSRB = 0;               // Switching ADC to Free Running mode
  sbi(ADCSRA, ADATE);       // ADC autotrigger enable (mandatory for free running mode)
  sbi(ADCSRA, ADSC);        // ADC start the first conversions
  sbi(ADCSRA, 2);           // 0x100 = clock divided by 16, 62.5 kHz, 208 us for 13 cycles of one AD conversion, 24 us fo 1.5 cycle for sample-hold
  cbi(ADCSRA, 1);        
  cbi(ADCSRA, 0);        

  pinMode(RESET, OUTPUT);   // reset for peak detetor

  //pinMode(SDpower1, OUTPUT);  // SDcard interface
  //pinMode(SDpower2, OUTPUT);     
  //pinMode(SDpower3, OUTPUT);     
  //pinMode(SS, OUTPUT);     
  //pinMode(MOSI, INPUT);     
  //pinMode(MISO, INPUT);     
  //pinMode(SCK, OUTPUT);  

  DDRB = 0b10011110;
  PORTB = 0b00000000;  // SDcard Power OFF

  DDRA = 0b11111100;
  PORTA = 0b00000000;  // SDcard Power OFF
  DDRC = 0b11101100;
  PORTC = 0b00000000;  // SDcard Power OFF
  DDRD = 0b11111100;
  PORTD = 0b00000000;  // SDcard Power OFF

  pinMode(LED_red, OUTPUT);
  digitalWrite(LED_red, LOW);  
  digitalWrite(RESET, LOW);  
  
  //!!! Wire.setClock(100000);

  for(int i=0; i<5; i++)  
  {
    delay(50);
    digitalWrite(LED_red, HIGH);  // Blink for Dasa 
    delay(50);
    digitalWrite(LED_red, LOW);  
  }

  Serial.println("#Hmmm...");

  // make a string for device identification output
  String dataString = "$AIRDOS," + FWversion + "," + githash + ","; // FW version and Git hash
  
  Wire.beginTransmission(0x58);                   // request SN from EEPROM
  Wire.write((int)0x08); // MSB
  Wire.write((int)0x00); // LSB
  Wire.endTransmission();
  Wire.requestFrom((uint8_t)0x58, (uint8_t)16);    
  for (int8_t reg=0; reg<16; reg++)
  { 
    uint8_t serialbyte = Wire.read(); // receive a byte
    if (serialbyte<0x10) dataString += "0";
    dataString += String(serialbyte,HEX);    
    serialhash += serialbyte;
  }

  {
    DDRB = 0b10111110;
    PORTB = 0b00001111;  // SDcard Power ON
  
    // make sure that the default chip select pin is set to output
    // see if the card is present and can be initialized:
    if (!SD.begin(SS)) 
    {
      Serial.println("#Card failed, or not present");
      // don't do anything more:
      return;
    }
  
    // open the file. note that only one file can be open at a time,
    // so you have to close this one before opening another.
    File dataFile = SD.open("datalog.txt", FILE_WRITE);
  
    // if the file is available, write to it:
    if (dataFile) 
    {
      dataFile.println(dataString);  // write to SDcard (800 ms)     
      dataFile.close();
  
      digitalWrite(LED_red, HIGH);  // Blink for Dasa
      Serial.println(dataString);  // print SN to terminal 
      digitalWrite(LED_red, LOW);          
    }  
    // if the file isn't open, pop up an error:
    else 
    {
      Serial.println("#error opening datalog.txt");
    }
    
    DDRB = 0b10011110;
    PORTB = 0b00000001;  // SDcard Power OFF          
  }    

  // measurement of ADC offset
  ADMUX = (analog_reference << 6) | 0b10001; // Select +A1,-A1 for offset correction
  delay(200);
  ADCSRB = 0;               // Switching ADC to Free Running mode
  sbi(ADCSRA, ADATE);       // ADC autotrigger enable (mandatory for free running mode)
  sbi(ADCSRA, ADSC);        // ADC start the first conversions
  sbi(ADCSRA, 2);           // 0x100 = clock divided by 16, 62.5 kHz, 208 us for 13 cycles of one AD conversion, 24 us fo 1.5 cycle for sample-hold
  cbi(ADCSRA, 1);
  cbi(ADCSRA, 0);
  sbi(ADCSRA, ADIF);                  // reset interrupt flag from ADC
  while (bit_is_clear(ADCSRA, ADIF)); // wait for the first conversion
  sbi(ADCSRA, ADIF);                  // reset interrupt flag from ADC
  lo = ADCL;
  hi = ADCH;
  ADMUX = (analog_reference << 6) | 0b10000; // Select +A0,-A1 for measurement
  ADCSRB = 0;               // Switching ADC to Free Running mode
  sbi(ADCSRA, ADATE);       // ADC autotrigger enable (mandatory for free running mode)
  sbi(ADCSRA, ADSC);        // ADC start the first conversions
  sbi(ADCSRA, 2);           // 0x100 = clock divided by 16, 62.5 kHz, 208 us for 13 cycles of one AD conversion, 24 us fo 1.5 cycle for sample-hold
  cbi(ADCSRA, 1);
  cbi(ADCSRA, 0);
  // combine the two bytes
  u_sensor = (hi << 7) | (lo >> 1);
  // manage negative values
  if (u_sensor <= (CHANNELS / 2) - 1 ) {
    u_sensor += (CHANNELS / 2);
  } else {
    u_sensor -= (CHANNELS / 2);
  }
  base_offset = 256; //u_sensor;

  // Initiates RTC
  rtc.autoprobe();
  rtc.resetClock();
}


void loop()
{
  uint16_t histogram[CHANNELS];
  uint32_t flux;

  uint32_t flux_long = 0;

  for(int i=0; i<(GPSdelay); i++)  // measurements between GPS aquisition
  {
    for(int n=0; n<CHANNELS; n++)
    {
      histogram[n]=0;
    }
  
    // measurement of ADC offset
    ADMUX = (analog_reference << 6) | 0b10001; // Select +A1,-A1 for offset correction
    delay(50);
    ADCSRB = 0;               // Switching ADC to Free Running mode
    sbi(ADCSRA, ADATE);       // ADC autotrigger enable (mandatory for free running mode)
    sbi(ADCSRA, ADSC);        // ADC start the first conversions
    sbi(ADCSRA, 2);           // 0x100 = clock divided by 16, 62.5 kHz, 208 us for 13 cycles of one AD conversion, 24 us fo 1.5 cycle for sample-hold
    cbi(ADCSRA, 1);        
    cbi(ADCSRA, 0);        
    sbi(ADCSRA, ADIF);                  // reset interrupt flag from ADC
    while (bit_is_clear(ADCSRA, ADIF)); // wait for the first conversion 
    sbi(ADCSRA, ADIF);                  // reset interrupt flag from ADC
    lo = ADCL;
    hi = ADCH;
    ADMUX = (analog_reference << 6) | 0b10000; // Select +A0,-A1 for measurement
    ADCSRB = 0;               // Switching ADC to Free Running mode
    sbi(ADCSRA, ADATE);       // ADC autotrigger enable (mandatory for free running mode)
    sbi(ADCSRA, ADSC);        // ADC start the first conversions
    sbi(ADCSRA, 2);           // 0x100 = clock divided by 16, 62.5 kHz, 208 us for 13 cycles of one AD conversion, 24 us fo 1.5 cycle for sample-hold
    cbi(ADCSRA, 1);        
    cbi(ADCSRA, 0);        
    // combine the two bytes
    u_sensor = (hi << 7) | (lo >> 1);
    // manage negative values
    if (u_sensor <= (CHANNELS/2)-1 ) {u_sensor += (CHANNELS/2);} else {u_sensor -= (CHANNELS/2);}
    offset = u_sensor;
    
    PORTB = 1;                          // Set reset output for peak detector to H
    sbi(ADCSRA, ADIF);                  // reset interrupt flag from ADC
    while (bit_is_clear(ADCSRA, ADIF)); // wait for the first dummy conversion 
    DDRB = 0b10011111;                  // Reset peak detector
    delayMicroseconds(100);             // guaranteed reset
    DDRB = 0b10011110;
  
    sbi(ADCSRA, ADIF);        // reset interrupt flag from ADC
  
    uint16_t suppress = 0;      
      
    while (bit_is_clear(ADCSRA, ADIF)); // wait for dummy conversion 
    DDRB = 0b10011111;                  // Reset peak detector
    asm("NOP");                         // cca 6 us for 2k2 resistor and 1k capacitor in peak detector
    asm("NOP");                         
    asm("NOP");                         
    asm("NOP");                         
    asm("NOP");                         
    DDRB = 0b10011110;
    sbi(ADCSRA, ADIF);                  // reset interrupt flag from ADC
    
    // dosimeter integration
    for (uint16_t i=0; i<46000; i++)    // cca 10 s
    {
      while (bit_is_clear(ADCSRA, ADIF)); // wait for end of conversion 
      //delayMicroseconds(24);            // 24 us wait for 1.5 cycle of 62.5 kHz ADC clock for sample/hold for next conversion
      asm("NOP");                         // cca 8 us after loop
      asm("NOP");                         
      asm("NOP");                         
      asm("NOP");                         
      asm("NOP");                         
      asm("NOP");                         
      
      DDRB = 0b10011111;                  // Reset peak detector
      asm("NOP");                         // cca 7 us for 2k2 resistor and 100n capacitor in peak detector
      asm("NOP");                         
      asm("NOP");                         
      asm("NOP");                         
      asm("NOP");                         
      DDRB = 0b10011110;
      sbi(ADCSRA, ADIF);                  // reset interrupt flag from ADC
  
      // we have to read ADCL first; doing so locks both ADCL
      // and ADCH until ADCH is read.  reading ADCL second would
      // cause the results of each conversion to be discarded,
      // as ADCL and ADCH would be locked when it completed.
      lo = ADCL;
      hi = ADCH;
  
      // combine the two bytes
      u_sensor = (hi << 7) | (lo >> 1);
  
      // manage negative values
      if (u_sensor <= (CHANNELS/2)-1 ) {u_sensor += (CHANNELS/2);} else {u_sensor -= (CHANNELS/2);}
                
      if (u_sensor > maximum) // filter double detection for pulses between two samples
      {
        maximum = u_sensor;
        suppress++;
      }
      else
      {
        histogram[maximum]++;
        maximum = 0;
      }
    }  
    
    // Data out
    flux = 0;
    {
      rtc.readClock(tm);
      RTCx::time_t t = RTCx::mktime(&tm);

      // make a string for assembling the data to log:
      String dataString = "";
  
      // make a string for assembling the data to log:
      dataString += "$CANDY,";
  
      dataString += String(count); 
      dataString += ",";
    
      dataString += String(t-946684800); 
      dataString += ",";
  
      uint16_t noise = base_offset+4; // first channel for flux calculation
      #define RANGE 252
      
      for(int n=base_offset; n<(base_offset+RANGE); n++)  
      {
        dataString += String(histogram[n]); 
        //dataString += "\t";
        dataString += ",";
        //if (n==NOISE) dataString += "*,";
      }
      
      for(int n=noise; n<(base_offset+RANGE); n++)  
      {
        flux += histogram[n]; 
      }
  
      dataString += String(suppress);
      dataString += ",";
      dataString += String(flux);
      dataString += ",";
      dataString += String(offset);
  
      count++;

      flux_long = flux_long + flux;
    
     //if (flux > GPSthreshold)
     {
        DDRB = 0b10111110;
        PORTB = 0b00001111;  // SDcard Power ON

        // make sure that the default chip select pin is set to output
        // see if the card is present and can be initialized:
        if (!SD.begin(SS)) 
        {
          Serial.println("#Card failed, or not present");
          // don't do anything more:
          return;
        }

        // open the file. note that only one file can be open at a time,
        // so you have to close this one before opening another.
        File dataFile = SD.open("datalog.txt", FILE_WRITE);
      
        // if the file is available, write to it:
        if (dataFile) 
        {
          //digitalWrite(LED_red, HIGH);  // Blink for Dasa
          dataFile.println(dataString);  // write to SDcard (800 ms)     
          //digitalWrite(LED_red, LOW);          
          dataFile.close();
        }  
        // if the file isn't open, pop up an error:
        else 
        {
          Serial.println("#error opening datalog.txt");
        }
  
        DDRB = 0b10011110;
        PORTB = 0b00000001;  // SDcard Power OFF  
      }          

#ifdef DEBUG
#else
      dataString.remove(75); 
#endif

      digitalWrite(LED_red, HIGH);  // Blink for Dasa
      Serial.println(dataString);   // print to terminal (additional 700 ms in DEBUG mode)
      digitalWrite(LED_red, LOW);                
    }    
  }
  
  // GPS **********************
  if (flux_long > GPSthreshold)
//  if (false)
  {
      // make a string for assembling the data to log:
      String dataString = "";

#define MSG_NO 10    // number of logged NMEA messages

    digitalWrite(GPSpower, HIGH); // GPS Power ON
    delay(100);
    {
      // Switch off Galileo and GLONASS; UBX-CFG-GNSS (6)+4+8*7+(2)=68 configuration bytes
      const char cmd[68]={0xB5, 0x62, 0x06, 0x3E, 0x3C, 0x00, 0x00, 0x20, 0x20, 0x07, 0x00, 0x08, 0x10, 0x00, 0x01, 0x00, 0x01, 0x01, 0x01, 0x01, 0x03, 0x00, 0x01, 0x00, 0x01, 0x01, 0x02, 0x04, 0x08, 0x00, 0x00, 0x00, 0x01, 0x01, 0x03, 0x08, 0x10, 0x00, 0x00, 0x00, 0x01, 0x01, 0x04, 0x00, 0x08, 0x00, 0x00, 0x00, 0x01, 0x03, 0x05, 0x00, 0x03, 0x00, 0x00, 0x00, 0x01, 0x05, 0x06, 0x08, 0x0E, 0x00, 0x00, 0x00, 0x01, 0x01, 0x53, 0x1F};
      for (int n=0;n<(68);n++) Serial1.write(cmd[n]); 
    }          
    {
      // airborne <2g; UBX-CFG-NAV5 (6)+36+(2)=44 configuration bytes
      const char cmd[44]={0xB5, 0x62 ,0x06 ,0x24 ,0x24 ,0x00 ,0xFF ,0xFF ,0x07 ,0x03 ,0x00 ,0x00 ,0x00 ,0x00 ,0x10 ,0x27 , 0x00 ,0x00 ,0x05 ,0x00 ,0xFA ,0x00 ,0xFA ,0x00 ,0x64 ,0x00 ,0x5E ,0x01 ,0x00 ,0x3C ,0x00 ,0x00 , 0x00 ,0x00 ,0x00 ,0x00 ,0x00 ,0x00 ,0x00 ,0x00 ,0x00 ,0x00 ,0x85 ,0x2A};
      for (int n=0;n<(44);n++) Serial1.write(cmd[n]); 
    }
    {
      // switch to UTC time; UBX-CFG-RATE (6)+6+(2)=14 configuration bytes
      const char cmd[14]={0xB5 ,0x62 ,0x06 ,0x08 ,0x06 ,0x00 ,0xE8 ,0x03 ,0x01 ,0x00 ,0x00 ,0x00 ,0x00 ,0x37};
      for (int n=0;n<(14);n++) Serial1.write(cmd[n]); 
    }
    // flush serial buffer
    while (Serial1.available()) Serial1.read();

    boolean flag = false;
    char incomingByte; 
    int messages = 0;
    uint32_t nomessages = 0;

    while(true)
    {
      if (Serial1.available()) 
      {
        // read the incoming byte:
        incomingByte = Serial1.read();
        nomessages = 0;
        
        if (incomingByte == '$') {messages++;}; // Prevent endless waiting
        if (messages > 300) break; // more than 26 s

        if (flag && (incomingByte == '*')) break;
        flag = false;

        if (incomingByte == 'A') flag = true;   // Waiting for FIX
      }
      else
      {
        nomessages++;  
        if (nomessages > GPSerror) break; // preventing of forever waiting
      }
    }
    
    // make a string for assembling the NMEA to log:
    dataString = "";

    flag = false;
    messages = 0;
    nomessages = 0;
    while(true)
    {
      if (Serial1.available()) 
      {
        // read the incoming byte:
        incomingByte = Serial1.read();
        nomessages = 0;
        
        if (incomingByte == '$') {flag = true; messages++;};
        if (messages > MSG_NO)
        {
          rtc.readClock(tm);
          RTCx::time_t t = RTCx::mktime(&tm);
        
          dataString += "$TIME,";
          dataString += String(t-946684800);  // RTC Time of the last GPS NMEA Message
          
          break;
        }
        
        // say what you got:
        if (flag && (messages<=MSG_NO)) dataString+=incomingByte;
      }
      else
      {
        nomessages++;  
        if (nomessages > GPSerror) break; // preventing of forever waiting
      }
    }
    digitalWrite(GPSpower, LOW); // GPS Power OFF

    {
        DDRB = 0b10111110;
        PORTB = 0b00001111;  // SDcard Power ON
        
        // make sure that the default chip select pin is set to output
        // see if the card is present and can be initialized:
        if (!SD.begin(SS)) 
        {
          Serial.println("#Card failed, or not present");
          // don't do anything more:
          return;
        }
        
        // open the file. note that only one file can be open at a time,
        // so you have to close this one before opening another.
        File dataFile = SD.open("datalog.txt", FILE_WRITE);
        
        // if the file is available, write to it:
        if (dataFile) 
        {
          digitalWrite(LED_red, HIGH);  // Blink for Dasa
          dataFile.println(dataString);  // write to SDcard (800 ms)     
          digitalWrite(LED_red, LOW);          
          dataFile.close();
        }  
        // if the file isn't open, pop up an error:
        else 
        {
          Serial.println("#error opening datalog.txt");
        }
        
        DDRB = 0b10011110;
        PORTB = 0b00000001;  // SDcard Power OFF
    }  
#ifdef DEBUG
    Serial.println(dataString);  // print to terminal (additional 700 ms)
#endif
  }
}
