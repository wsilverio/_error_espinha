/*
  https://github.com/wsilverio/_error_espinha
  
  Arquivo "From Hell do Céu.mp3" dentro da pasta "data"
 */

// bibliotecas Minim
import ddf.minim.*; // Minim
import ddf.minim.analysis.*; // BeatDetect

Minim minim;
AudioPlayer song;
BeatDetect beat;

int lado;
int lado_min;
int lado_max;
float angulo;

void setup() {
  size(640, 360);
  rectMode(RADIUS);

  // parâmetros do retângulo
  lado_min = 20;
  lado_max = height/2 - 50; // borda = 50/2 = 25
  lado = lado_min;
  angulo = 0;

  minim = new Minim(this);
  song = minim.loadFile("From Hell do Céu.mp3", 1024); // (arquivo, buffer)

  beat = new BeatDetect();

  song.loop();
}

void draw() {
  background(255);

  beat.detect(song.mix); // detecta um beat, se houver

  if ( beat.isOnset() ) { // se detectar um beat
    lado = lado_max;
  }

  translate(width/2, height/2); // ogirem no centro da janela
  rotate(angulo); // sentido horário

  fill(#E8C70C); // amarelo
  rect(0, 0, lado, lado);

  rotate(-2*angulo); // anti-horário
  noFill(); // somente arestas
  rect(0, 0, lado, lado);

  angulo += radians(5); 
  lado *= 0.95; // lado = lado * 0.95; // diminui o lado em 5%

  if ( lado < lado_min ) { // não deixa o lado ser < 20
    lado = lado_min;
  }
}

void exit() {
  song.close(); // fecha a player
  minim.stop(); // fecha o minim
  super.stop();
}

