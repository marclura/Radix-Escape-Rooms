/* Password management */

boolean checkPassword() {
  boolean correct_password = false;
  
  if(keyPressed && key_released) {
    key_released = false;  // prevent events skipping
    if(key == ENTER) {
      if(input_password.equals(scene_2_password)) {
        println("Password is correct");
        input_password = message_correct_password;
        correct_password = true;
      }
      else {
        input_password = "";
        correct_password = false;
        println("Password is wrong");
        input_password = message_wrong_password;
      }
    }
    else {
      if(key == '1' || key == '2' || key == '3' || key == '4' || key == '5' || key == '6' || key == '7' || key == '8' || key == '9' || key == '0') {
        if(input_password.equals(message_wrong_password)) input_password = "";
        input_password += key;
      }
    }
  }
 
  return correct_password;
}

void displayPassword() {
  textFont(fontPassword);
  textAlign(CENTER);
  
  fill(255);
  rect(screen_x, 0, width/2, height);
  
  fill(0);
  text("PASSWORD", screen_x + width/4, height/2 - size_font_password/3);
  text(input_password, screen_x + width/4, height/2 + size_font_password);
  
}
