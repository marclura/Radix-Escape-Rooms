/* Serial management */

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

// read incoming Serial messages
void readSerial() {
  String val = Serial.readStringUntil('\n');
  val.trim();

  // Serial.println(val);

  decodeSerial(val);
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