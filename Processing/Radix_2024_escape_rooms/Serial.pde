/* Serial communication with Arduino */

// Serial initialization
void serialInit() {
  serialEstablishConnection();
  serialWaitFirstContact();
}

// Serial port establish the connection with Arduino
void serialEstablishConnection() {
  println("Serial port connection...");
  printArray(Serial.list());
  String portName = Serial.list()[serial_port_index];
  SerialPort = new Serial(this, portName, serial_baudrate);
  SerialPort.bufferUntil('\n');
}

// wait for first contact with the Arduino
void serialWaitFirstContact() {
  while(!serial_first_contact) {
    delay(500);
  }
}

// establish connection with Arduino via USB serial
void serialEvent(Serial Port) {
  String val = Port.readStringUntil('\n');
  
  if(val != null) {
    val = trim(val);  // clean from extra characters
        
    if(!serial_first_contact) {
      if(val.equals("A")) {
        Port.clear();
        Port.write("A\n");  // handshake return to Arduino
        println("Arduino is connected");
        delay(4000);  // slowing down for the Arduino
        serial_first_contact = true;
      }
    }
    else serialReceived(val);
    
  }
  
}


// send command with status via serial
void serialSend(String command, int state) {
  
  println("serialSend: " + command + "," + state);
  
  SerialPort.write(command + "," + state);
  SerialPort.write("\n");
  
}


// received serial data
void serialReceived(String val) {
  println("serialReceived: " + val);
}
