/*

Escape rooms - Radix 2024

Author:
Marco Lurati
contact@marcolurati.ch

Interface I/Os:
# Arduino
  Inputs:
  - Buttons for navigation (D1 - D5)
  - Sensors for the cards (A0 - A5)
  Outputs:
  - Relays Room  RR (D7)
  - Relays Sports RS (D0)
  - LEDs for the buttons (D8 - D12)

Serial protocol

The serial protocol is always composed by a 2byte (string)command followed by a "," and the (int)state. Example: "RR,1"

*/

struct Interface {
  String command; // 2 characters max
  int state;
  int pin;
  char type;  // 'i': input, 'o': output
};

Interface interface[] = {
  {"RR", 0, 7, 'o'},
  {"RS", 0, 0, 'o'},
  {"B12", 0, 12, 'o'}
};

int interface_size = 0;

void setup() {
  Serial.begin(921600);

  interface_size = sizeof(interface) / (sizeof(interface[0]));  // data init

  initPins();

  establishContact(); // wait for the connection with Processing

  pinMode(13, OUTPUT);

}

void loop() {

  delay(100);

  if(Serial.available() > 0) {
    readSerial();
  }

}


void decodeSerial(String val) {

  int command_separator_index = val.indexOf(','); // check if the structure is "command,state"

  if(command_separator_index != -1) { // found a command
    String command = val.substring(0, command_separator_index);
    int state = val.substring(command_separator_index + 1).toInt();

    updateInterface(command, state);
  }
  else {
    // any other commands
  }

}

void updateInterface(String command, int state) {

  int id = getInterfaceIDFromCommand(command);

  if(id != -1) {  // command exists
    interface[id].state = state;  // update the state
    
    if(interface[id].type == 'o') { // output
      digitalWrite(interface[id].pin, interface[id].state);
    }
  }

}


int getInterfaceIDFromCommand(String command) {
  int id = -1;

  for(int i=0; i<interface_size; i++) {
    if(interface[i].command == command) {
      id = i;
      break;
    }
  }

  return id;
}


// read incoming Serial messages
void readSerial() {
  String val = Serial.readStringUntil('\n');
  val.trim();

  // Serial.println(val);

  decodeSerial(val);
}


// setup the pins
void initPins() {
  for(int i=0; i<interface_size; i++) {
    if(interface[i].type == 'o') {  // Output
      pinMode(interface[i].pin, OUTPUT);
      digitalWrite(interface[i].pin, interface[i].state);
    }
    else {  // Input
      pinMode(interface[i].pin, INPUT);
    }
    
  }
}

// wait for the connection with Processing
void establishContact() {
  while (Serial.available() <= 0) { // no data received form Processing, keep sending 'A'
    Serial.println("A");
    delay(300);
  }

  delay(500);

  String msg = Serial.readStringUntil("\n"); // clean the buffer
}