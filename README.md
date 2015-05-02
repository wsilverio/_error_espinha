## [_ERROR Espinha {Arduino + P5}](https://github.com/wsilverio/_error_espinha)

Repositório da oficina de Arduino + Processing do [Algures X](https://www.facebook.com/AlguresUTFPR), UTFPR, de 5 a 8 de maio de 2015  
- - -  
###_ERROR Espinha {[Arduino](http://www.arduino.cc/) + [P5](https://processing.org/)}

####arduino::objetivos
- princípios {funcionamento, lógica e comandos básicos}
- atuação com LEDs {controle, temporização, intensidade}
- interação com sensor {potenciômetro}

####processing::objetivos

- princípios {funcionamento, lógica e comandos básicos}
- firmata {controlando o Arduino através do Processing}
- minim {P5 + áudio}  
  
- - -  
  
###lista de material
- Laptop
- Arduino com cabo USB
- Protoboard (> 500 furos)
- 3 LEDs de alto-brilho (5mm) (qualquer cor)
- 1 LED RGB de 4 terminais
- 3 Potenciômetros 10k ohms (linear) (mini)
- 10 resistores de 330 ohms (5%) (1/4 W) (amarelo, violeta, marrom, dourado)
- Mini alicates de bico e de corte

###softwares
Caso não consiga instalar os softwares, chegue 15 min antes que a gente ajuda :ok_hand:
- [Arduino](http://arduino.cc/en/Main/Software)
	- [GNU/Linux](http://www.arduino.cc/playground/Learning/Linux)
    - [Windows](http://arduino.cc/en/Guide/Windows)
    - [Mac OS X](http://arduino.cc/en/Guide/MacOSX)
- [Processing](https://processing.org/download/)
- [Fritzing](http://fritzing.org/) (opcional)  
  
- - -  
  
###arduino::tópicos
- [breve histórico](https://vimeo.com/31389230)
- [tensão, corrente e resistência](https://raw.githubusercontent.com/wsilverio/arduino-wakeupcolab-diciembre-2014/master/martes/img/Ohm_s_Law.jpg)
	- primeira lei de Ohm
- resistor
	- [símbolos](https://raw.githubusercontent.com/wsilverio/arduino-wakeupcolab-diciembre-2014/master/martes/img/res_schem.png)
	- [código de cores](http://2.bp.blogspot.com/-HHIWXf9KpJQ/Ufxn0VcAfvI/AAAAAAAAA6s/_qGAACMnTX0/s1600/codigo_de_cores_resistores.png)
- LED
	- [símbolos](https://raw.githubusercontent.com/wsilverio/arduino-wakeupcolab-diciembre-2014/master/martes/img/led.png)
	- polaridade
	- queda de tensão
	- cálculo de resistor
- esquemático
	- nós
- protoboard
	- [linhas e nós](https://raw.githubusercontent.com/wsilverio/arduino-wakeupcolab-diciembre-2014/master/martes/img/breadboard2.png)
	- [ligando LED na protoboard](https://raw.githubusercontent.com/wsilverio/arduino-wakeupcolab-diciembre-2014/master/martes/img/martes1_bb.png)
- [funções principais](http://www.arduino.cc/en/Reference/HomePage)
	- setup, loop
- configurando placa e porta
- ligando LED com Arduino
	- pinmode, digitalwrite, define
	- pino 13
- delay
	- variáveis
	- operações + - * /
- sequencial de LEDs
- [LED RGB](https://raw.githubusercontent.com/wsilverio/arduino-wakeupcolab-diciembre-2014/master/jueves/jueves2/jueves2_schem.png)
	- terminais
- potenciômetro
	- [pinos](https://raw.githubusercontent.com/wsilverio/arduino-wakeupcolab-diciembre-2014/master/miercoles/img/pot.png)
	- analogread
- [PWM](https://raw.githubusercontent.com/wsilverio/arduino-wakeupcolab-diciembre-2014/master/jueves/img/pwm.gif)
	- pinos
	- analogwrite
- LED strip e [MOSFET](http://www.vishay.com/docs/91070/91070.pdf) *

###processing::tópicos
- [breve histórico](http://www.7luas.com.br/todos/pesquisa/artigo/hello-world-processing/)
- [exemplos](https://processing.org/examples/)
- [funções e comandos principais](https://processing.org/reference/)
	- void, draw, background, formas, fill, stroke
- interação com mouse
- interação com teclado
- arduino::[firmata](http://playground.arduino.cc/Interfacing/Processing)
- [minim](http://code.compartmental.net/tools/minim/)
- minim::player
- minim::BeatDetect
- minim::AudioInput
- minim::FFT *
