/* Password management */

String msg_password = "password";
String msg_wrong = "accesso negato";
String msg_correct = "accesso consentito";
String scene_2_password = "123456";
String input_password = msg_password;

boolean checkPassword() {
  boolean correct_password = false;
  
  if(keyPressed && key_released) {
    key_released = false;  // prevent events skipping
    if(key == ENTER) {
      if(input_password.equals(scene_2_password)) {
        println(msg_correct);
        input_password = msg_correct;
        correct_password = true;
      }
      else {
        input_password = "";
        correct_password = false;
        println(msg_wrong);
        input_password = msg_wrong;
      }
    }
    else {
      if(key == '1' || key == '2' || key == '3' || key == '4' || key == '5' || key == '6' || key == '7' || key == '8' || key == '9' || key == '0') {
        if(input_password.equals(msg_wrong)) input_password = msg_password;
        if(input_password.equals(msg_password)) input_password = "";
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
  text(input_password, screen_x + width/4, height/2);
  
}
