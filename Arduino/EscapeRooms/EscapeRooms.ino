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
  {"LED_NEXT", 0, 12, 'o'},
  {"LED_BACK", 0, 11, 'o'},
  {"BTN_NEXT", 0, 5, 'i'},
  {"BTN_BACK", 0, 4, 'i'},
  {"S0", 0, A0, 's'},
  {"S1", 0, A1, 's'},
  {"S2", 0, A2, 's'},
  {"S3", 0, A3, 's'},
  {"S4", 0, A4, 's'},
  {"S5", 0, A5, 's'}
};

int interface_size = 0;

// Status
bool navigation_active = false;
bool old_navigation_active = false;

// Sensor badges threshold
int bage_sensors_threshold = 400;


void setup() {
  Serial.begin(921600);

  interface_size = sizeof(interface) / (sizeof(interface[0]));  // data init

  initPins();

  // serial connection indicator
  pinMode(13, OUTPUT);
  digitalWrite(13, LOW);

  establishContact(); // wait for the connection with Processing



}

void loop() {

  delay(100);

  if(Serial.available() > 0) {
    readSerial();
  }

  updateNavigation();

  readBadgesSensors();

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
  else {
    
    if(command == "NAV") {
      navigation_active = state;
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
    if(interface[i].type == 'o') {  // Digital Output
      pinMode(interface[i].pin, OUTPUT);
      digitalWrite(interface[i].pin, interface[i].state);
    }
    else if(interface[i].type == 'i') {  // Digital Input
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

  digitalWrite(13, HIGH);

}