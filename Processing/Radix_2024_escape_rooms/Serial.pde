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
  
  // reset the arduino by opening the port @baudrate=1200
  SerialPort = new Serial(this, portName, 1200);
  SerialPort.stop();
  
  // wait for it to be reset
  delay(10000);
  
  println("Opening a new connection to the correct baudrate ...");
  SerialPort = new Serial(this, portName, serial_baudrate);
  SerialPort.bufferUntil('\n');
  serial_event_listening = true;  // start listenting to the serial port
}

// wait for first contact with the Arduino
void serialWaitFirstContact() {
  while(!serial_first_contact) {
    delay(500);
  }
}


// establish connection with Arduino via USB serial
void serialEvent(Serial Port) {
  if(serial_event_listening) {
    String val = Port.readStringUntil('\n');
    
    if(val != null) {
      val = trim(val);  // clean from extra characters
          
      if(!serial_first_contact) {
        if(val.equals("A")) {
          Port.clear();
          Port.write("A");  // handshake return to Arduino
          println("Arduino is connected");
          delay(1000);  // slowing down for the Arduino
          serial_first_contact = true;
        }
      }
      else serialReceived(val);
      
    }
  }
}



// send command with status via serial
void serialSend(String command, int state) {
  
  // println("serialSend: " + command + "," + state);
  
  SerialPort.write(command + "," + state);
  SerialPort.write("\n");
  
}


// received serial data
void serialReceived(String val) {
  // println("serialReceived: " + val);
  income_serial_val = val;
}

// get incoming serial value
String getIncomeSerialVal() {
  String val = income_serial_val;
  income_serial_val = "";
  return val;
}
