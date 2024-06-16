/* Interface management */

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

// return the ID of the interface type struct of the provided command
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

// update the interface
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



