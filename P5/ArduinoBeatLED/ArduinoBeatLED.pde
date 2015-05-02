/*
  https://github.com/wsilverio/_error_espinha
 
 ArduinoBeatLED:
 - Arduino:
 - gravar: Arduino IDE -> examples -> StandardFirmata -> StandardFirmata.ino
 - LED conectado ao pino 11 (led_pin)
 
 */

// bibliotecas Minim
import ddf.minim.*; // Minim, AudioInput
import ddf.minim.analysis.*; // BeatDetect

// bibliotecas comunicação serial
import processing.serial.*;
import cc.arduino.*; // firmata

Minim minim;
AudioInput in;
BeatDetect beat;

Arduino arduino;

int led_pin = 11;

int raio;
int raio_min;
int raio_max;

void setup() {
  size(640, 360);

  ellipseMode(RADIUS);
  noStroke();
  fill(#0B0EAF); // azul

  // parâmetros do círculo
  raio_min = 20;
  raio_max = height/2 - 50; // borda = 50/2 = 25
  raio = raio_min;

  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 512); // (tipo, buffer)
  beat = new BeatDetect(in.bufferSize(), in.sampleRate()); // (buffer, sample)
  beat.detectMode(BeatDetect.SOUND_ENERGY); // isOnset exige SOUND_ENERGY

    arduino = new Arduino(this, "/dev/ttyUSB0", 57600); // (ponteiro, porta, baud)
  // arduino.pinMode(led_pin, Arduino.OUTPUT);
}

void draw() {
  background(240);

  beat.detect(in.mix); // detecta um beat, se houver

  if ( beat.isOnset() ) { // se detectar um beat
    raio = raio_max;
  }

  ellipse(width/2, height/2, raio, raio);

  raio *= 0.95; // raio = raio * 0.95; // diminui o raio em 5%

  if ( raio < raio_min ) { // não deixa o raio ser < 20
    raio = raio_min;
  }

  int pwm = int( map(raio, raio_min, raio_max, 0, 255) ); // mapeia a intensidade (pwm) no intervalo do raio
  arduino.analogWrite(led_pin, pwm);
}

void exit() {
  in.close(); // fecha a entrada de áudio
  minim.stop(); // fecha o minim
  super.stop();
}

