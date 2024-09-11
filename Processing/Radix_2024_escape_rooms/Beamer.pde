/* Beamer */

void beamerUpdate(String content) {
  
  if(content.equals("logo")) {
    set(beamer_x, 0, logo);
  }
  else if(content.equals("white")) {
    fill(255);
    rect(beamer_x, 0, screen_width, screen_height);
  }
  else if(content.equals("instructions_world_1")) {
    set(beamer_x, 0, instructions_world_1);
  }
  
}
