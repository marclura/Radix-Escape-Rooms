int sensors_threshold = 600;

void setup() {
  Serial.begin(115200);

  for(int i=1; i<=5; i++) {
    pinMode(i, INPUT);
    pinMode(i+7, OUTPUT);
  }

  pinMode(0, OUTPUT);
  pinMode(7, OUTPUT);
}

void loop() {

  readSensors();

  readButtons();

  Serial.println(" ");

  delay(100);

}

void readButtons() {
  Serial.println("Read Buttons");

  for(int i=1; i<=5; i++) {
    if(digitalRead(i)) {
      Serial.println("ON - " + String(i));
      digitalWrite(i+7, HIGH);
      digitalWrite(0, HIGH);
      digitalWrite(7, HIGH);
    }
    else {
      Serial.println("OFF - " + String(i));
      digitalWrite(i+7, LOW);
      digitalWrite(0, LOW);
      digitalWrite(7, LOW);
    }
  }

}

void readSensors() {

  Serial.println("Analog Sensors");

  for(int i=0; i<=5; i++) {
    int val = analogRead(i);
    if(val > sensors_threshold) {
      Serial.print("ON");
    }
    else {
      Serial.print("OFF");
    }

    Serial.println(" - " + String(val));
    
  }
}