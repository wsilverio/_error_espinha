class LED { 
  int pin, mode, pwm, prev_pwm, step, delay, prev_time;
  float xoff;
  long time;

  LED (int _pin) {  
    pin = _pin;
    mode = 0;
    pwm = prev_pwm = 0;
    step = 3;
    time = millis();
    xoff = 0;
  }

  void pwmUpdate() {
    if (prev_pwm != pwm) {
      pwm = constrain(pwm, 0, 255);
      arduino.analogWrite(pin, prev_pwm = pwm);
    }
  }

  void fadeUpdate(int i) {

    pwm += step;

    if (pwm > 255 || pwm < 0) {
      //step = (-1) * (int) map((int) knob[i].getValue(), 0, knob[i].getMax(), 0, knob[i].getNumberOfTickMarks());
      step = -step;
    }

    pwm = constrain(pwm, 0, 255);
    pwmUpdate();
  }

  void noiseUpdate(int i) {
    pwm = (int) (255 * noise(xoff += 0.01));
    pwmUpdate();
  }

  void randomUpdate(int i) {
    if (millis() - prev_time >= delay) {
      if (pwm <= 0) {
        pwm = 255;
      } else {
        pwm = 0;
      }
      pwmUpdate();
      prev_time = millis();
      delay = (int) random(700);
    }
  }
}

