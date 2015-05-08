// bibliotecas comunicação serial
import processing.serial.*;
import cc.arduino.*; // firmata

Arduino arduino;

int led_pin = 11;

void setup() {
  size(640, 360);

  arduino = new Arduino(this, "/dev/ttyUSB0", 57600); // (ponteiro, porta, baud)
  
  arduino.pinMode(led_pin, Arduino.OUTPUT);
  arduino.digitalWrite(led_pin, Arduino.HIGH);
}

void draw() {
}

