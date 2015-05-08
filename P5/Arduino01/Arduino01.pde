// bibliotecas comunicação serial
import processing.serial.*;
import cc.arduino.*; // firmata

Arduino arduino;

int led_pin[] = {
  9, 10, 11
};

void setup() {
  size(640, 360);

  arduino = new Arduino(this, "/dev/ttyUSB0", 57600); // (ponteiro, porta, baud)
}

void draw() {
}

