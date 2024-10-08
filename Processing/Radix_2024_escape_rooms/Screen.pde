/* Screen on the table */

void screenUpdate(String content) {
  
  if(content.equals("logo_stanby")) set(screen_x, 0, logo);
  else if(content.equals("black")) {
    fill(0);
    rect(screen_x, 0, width, height);
  }
  else if(content.equals("white")) {
    fill(255);
    rect(screen_x, 0, width, height);
  }
  else if(content.equals("logo")) image(logo, screen_x, 0, width/2, height);
  else if(content.equals("instructions_world_2")) image(instructions_world_2, screen_x, 0, width/2, height);
  else if(content.equals("instructions_world_3")) image(instructions_world_3, screen_x, 0, width/2, height);
  else if(content.equals("fake_news_1")) image(fake_news_1, screen_x, 0, width/2, height);
  else if(content.equals("fake_news_2")) image(fake_news_2, screen_x, 0, width/2, height);
  else if(content.equals("fake_news_3")) image(fake_news_3, screen_x, 0, width/2, height);
  else if(content.equals("fake_news_4")) image(fake_news_4, screen_x, 0, width/2, height);
  else if(content.equals("instructions_badges")) image(instructions_badges, screen_x, 0, width/2, height);
  else if(content.equals("badges")) set(screen_x, 0, badges);
  else if(content.equals("instructions_leave")) set(screen_x, 0, instructions_leave);
  else if(content.equals("loading")) {
    println("Loading screen...");
    textFont(fontTimer);
    textSize(32);
    textAlign(CENTER);
    fill(255);
    text("Caricamento in corso ...", width/4, height/2);
    text("Caricamento in corso ...", width/4*3, height/2);
  }
  
}
