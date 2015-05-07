#define echoPin1 12
#define trigPin1 13

#define maxDist 255
#define minDist 10

unsigned long duracao, distancia;

void setup() {
  Serial.begin (9600);
  pinMode(trigPin1, OUTPUT);
  pinMode(echoPin1, INPUT);
}

void loop() {

  digitalWrite(trigPin1, LOW); 
  delayMicroseconds(2); 

  digitalWrite(trigPin1, HIGH);
  delayMicroseconds(10); 

  digitalWrite(trigPin1, LOW);

  duracao = pulseIn(echoPin1, HIGH);

  distancia = duracao / 58.2;

  if (distancia >= maxDist || distancia <= minDist){

  }
  else {
    Serial.write(distancia);
  }
  delay(50);
}

