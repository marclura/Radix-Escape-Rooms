/* Navigation management */

void updateNavigation() {

  byte id_led_next = getInterfaceIDFromCommand("LED_NEXT");
  byte id_led_back = getInterfaceIDFromCommand("LED_BACK");
  byte id_btn_next = getInterfaceIDFromCommand("BTN_NEXT");
  byte id_btn_back = getInterfaceIDFromCommand("BTN_BACK");

  // Navigation inactive to active
  if(navigation_active && !old_navigation_active) {
    
    interface[id_led_next].state = 1;
    digitalWrite(interface[id_led_next].pin, interface[id_led_next].state);

    interface[id_led_back].state = 0;
    digitalWrite(interface[id_led_back].pin, interface[id_led_back].state);

    old_navigation_active = true;
  }

  // Navigation active
  else if(navigation_active && old_navigation_active) {

    /* NEXT */
    // pressed
    if(digitalRead(interface[id_btn_next].pin) == 1 && interface[id_btn_next].state == 0) {
      interface[id_btn_next].state = 1;
      Serial.println("NEXT");
    }
    // released
    if(digitalRead(interface[id_btn_next].pin) == 0 && interface[id_btn_next].state == 1) {
      interface[id_btn_next].state = 0;
    }

    /* BACK */
    // pressed
    if(digitalRead(interface[id_btn_back].pin) == 1 && interface[id_btn_back].state == 0) {
      interface[id_btn_back].state = 1;
      Serial.println("BACK");
    }
    // released
    if(digitalRead(interface[id_btn_back].pin) == 0 && interface[id_btn_back].state == 1) {
      interface[id_btn_back].state = 0;
    }


  }

  // Navigation active to inactive
  else if(!navigation_active && old_navigation_active) {

    interface[id_led_next].state = 0;
    digitalWrite(interface[id_led_next].pin, interface[id_led_next].state);

    interface[id_led_back].state = 0;
    digitalWrite(interface[id_led_back].pin, interface[id_led_back].state);

    old_navigation_active = false;
  }

}