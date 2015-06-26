int pwm_led_a, pwm_led_b, pwm_led_c;
int a, b, c;
final int A = 0, B = 1, C = 2;

void gui_config() { 
  int posX, posY;

  cp5.addTextfield("ARDUINO SERIAL PORT")
    .setText("/dev/ttyACM0")
      .setPosition(20, 60)
        .setSize(125, 30)
          .setFont(createFont("arial", 14))
            .setAutoClear(false)
              ;

  knob[0] = cp5.addKnob("pwm_led_a")
    .setRange(0, 255)
      .setValue(0)
        .setPosition(200, 30)
          .setRadius(50)
            .setNumberOfTickMarks(15)
              .setTickMarkLength(4)
                .snapToTickMarks(true)
                  .setDragDirection(Knob.VERTICAL)
                    ;

  knob[1] = cp5.addKnob("pwm_led_b")
    .setRange(0, 255)
      .setValue(0)
        .setPosition(350, 30)
          .setRadius(50)
            .setNumberOfTickMarks(15)
              .setTickMarkLength(4)
                .snapToTickMarks(true)
                  .setDragDirection(Knob.VERTICAL)
                    ;

  knob[2] = cp5.addKnob("pwm_led_c")
    .setRange(0, 255)
      .setValue(0)
        .setPosition(500, 30)
          .setRadius(50)
            .setNumberOfTickMarks(15)
              .setTickMarkLength(4)
                .snapToTickMarks(true)
                  .setDragDirection(Knob.VERTICAL)
                    ;

  sliderMode[0] = cp5.addSlider("a")
    .setPosition(200, 170)
      .setWidth(100)
        .setRange(0, 6)
          .setValue(0)
            .setNumberOfTickMarks(7)
              .setSliderMode(Slider.FLEXIBLE)
                ;

  sliderMode[1] = cp5.addSlider("b")
    .setPosition(350, 170)
      .setWidth(100)
        .setRange(0, 6)
          .setValue(0)
            .setNumberOfTickMarks(7)
              .setSliderMode(Slider.FLEXIBLE)
                ;

  sliderMode[2] = cp5.addSlider("c")
    .setPosition(500, 170)
      .setWidth(100)
        .setRange(0, 6)
          .setValue(0)
            .setNumberOfTickMarks(7)
              .setSliderMode(Slider.FLEXIBLE)
                ;
}

