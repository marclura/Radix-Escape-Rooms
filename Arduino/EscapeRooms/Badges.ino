/* Badges sensors management */

void readBadgesSensors() {

  if(navigation_active) {

    byte id = 0;
    bool badges_activated = true;

    for(int i=0; i<6; i++) {
      /*
      id = getInterfaceIDFromCommand("S" + i);
      interface[id].state = analogRead(interface[id].pin);
      if(interface[id].state < bage_sensors_threshold) {
        badges_activated = false;
        break;
      }
      */
      if (analogRead(i) < bage_sensors_threshold) {
        badges_activated = false;
      }
    }

    if(badges_activated) {
      Serial.println("BADGES");
    }
  }
}