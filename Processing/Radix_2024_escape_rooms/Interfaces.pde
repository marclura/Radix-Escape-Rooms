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
