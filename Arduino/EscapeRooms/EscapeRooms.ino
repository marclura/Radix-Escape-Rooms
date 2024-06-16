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

  // read the messages from the serial
  if(Serial.available() > 0) {
    readSerial();
  }

  // if the navigation is active
  updateNavigation();
  readBadgesSensors();


  delay(100);

}
