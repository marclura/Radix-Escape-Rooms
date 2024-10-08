/* Interface management */


// Relays Room
void relaysRoom(boolean status) {
  
  print("relaysRoom: ");
  
  if(status) {  // Relays Room ON
    println("ON");
    serialSend("RR", 1);
  }
  else {  // Relays Room OFF
    println("OFF");
    serialSend("RR", 0);
  }
}

// Relays Spots
void relaysSpots(boolean status) {
  
  print("relaysSpots: ");
  
  if(status) {  // Relays Spots ON
    println("ON");
    serialSend("RS", 1);
  }
  else {  // Relays Spots OFF
    println("OFF");
    serialSend("RS", 0);
  }
}

// Navigation buttons
void activateNavigationButtons(boolean status) {
 
  print("activateNavigationButtons: ");
  
  if(status) {
    println("ON");
    serialSend("NAV", 1);
  }
  else {
    println("OFF");
    serialSend("NAV", 0);
  }
  
}


// Key coded pressed check
boolean checkKeyCodedPressed(int k) {
  boolean pressed = false;
  //println(key);
  if(keyPressed && key_released) {
    key_released = false;  // prevent events skipping
    if(key == CODED) {
      if(keyCode == k) {
        pressed = true;
      }
    }
  }
  return pressed;
}

// Generic key pressed check
boolean checkKeyPressed(char k) {
  boolean pressed = false;
  //println(key);
  if(keyPressed && key_released) {
    key_released = false;  // prevent events skipping
    if(key == k) {
      pressed = true;
    }
  }
  return pressed;
}

// Event at key released
void keyReleased() {
  key_released = true;
}
