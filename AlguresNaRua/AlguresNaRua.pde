import processing.serial.*;
import cc.arduino.*;
import controlP5.*;
import ddf.minim.*; // Minim, AudioInput
import ddf.minim.analysis.*; // BeatDetect

Minim minim;  
AudioInput in;
FFT fftLin;
BeatDetect beat;

ControlP5 cp5;
Knob[] knob = new Knob[3];
Slider[] sliderMode = new Slider[3];

LED[] led = new LED[3];

String stringPorta = "";

Arduino arduino;
final int[] led_pin = {
  9, 10, 11
};

final int MANUAL = 0, FADE = 1, NOISE = 2, RANDOM = 3, BEAT = 4, LOW = 5, MED = 6; 

void setup() {
  size(700, 400);
  background(50);
  smooth();
  noStroke();

  for (int i = 0; i < 3; i++) {
    led[i] = new LED(led_pin[i]);
    led[i].pwm = 0;
  }

  cp5 = new ControlP5(this);
  gui_config();

  textSize(10);
  text("0: manual\n1: fade\n2: noise\n3: random\n4: beat\n5: low\n6: med", 10, height - 120);

  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 2*1024); // (tipo, buffer)
  beat = new BeatDetect(in.bufferSize(), in.sampleRate()); // (buffer, sample)
  beat.detectMode(BeatDetect.SOUND_ENERGY); // isOnset exige SOUND_ENERGY
  fftLin = new FFT( in.bufferSize(), in.sampleRate() );
  fftLin.linAverages( led_pin.length );
}
void draw() {
  if (stringPorta.isEmpty()) return;

  updateStatus();

  fftLin.forward( in.mix );
  beat.detect( in.mix );

  for (int i = 0; i < 3; i++) {
    //println(i, led[i].mode, led[i].pwm);

    if (led[i].mode == MANUAL) {
      led[i].pwmUpdate();
    } else if (led[i].mode == FADE) {
      led[i].fadeUpdate(i);
    } else if (led[i].mode == NOISE) {
      led[i].noiseUpdate(i);
    } else if (led[i].mode == RANDOM) {
      led[i].randomUpdate(i);
    } else if (led[i].mode == BEAT) {
      if ( beat.isOnset() ) {
        led[i].pwm = 255 + (int) (255*0.90);
      }
      led[i].pwmUpdate();
      led[i].pwm *= 0.90;
    } else if (led[i].mode == LOW) {
      led[i].pwm = (int) map(fftLin.getAvg(0) * 10, 150, 250, 0, 255);
      led[i].pwmUpdate();
    } else if (led[i].mode == MED) {
      led[i].pwm = (int) (fftLin.getAvg(1) * 50);
      led[i].pwmUpdate();
    }
  }
}

void updateStatus() {
  for (int i = 0; i < 3; i++) {
    led[i].mode = (int) sliderMode[i].getValue();
    if (led[i].mode == MANUAL) {
      led[i].pwm = (int) knob[i].getValue();
    } else {
      knob[i].setValue(led[i].pwm);
    }
  }
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isAssignableFrom(Textfield.class)) {
    if (theEvent.getName().equals("ARDUINO SERIAL PORT") && stringPorta.equals("")) {
      stringPorta = theEvent.getStringValue();
      println("\nPorta selecionada: ", stringPorta);
      arduino = new Arduino(this, stringPorta, 57600);
    }
  } else if (theEvent.isAssignableFrom(Slider.class)) {
    if (theEvent.getName().equals("a")) {
      led[0].pwm = 255;
    }
    if (theEvent.getName().equals("b")) {
      led[1].pwm = 255;
    }
    if (theEvent.getName().equals("c")) {
      led[2].pwm = 255;
    }
  }
}

