/* Screen on the table */

void screenUpdate(String content) {
  
  if(content.equals("logo_stanby")) set(screen_x, 0, logo);
  else if(content.equals("black")) {
    fill(0);
    rect(0, 0, width, height);
  }
  else if(content.equals("fake_news_1")) image(fake_news_1, screen_x, 0, width/2, height);
  else if(content.equals("fake_news_2")) image(fake_news_2, screen_x, 0, width/2, height);
  else if(content.equals("fake_news_3")) image(fake_news_3, screen_x, 0, width/2, height);
  else if(content.equals("fake_news_4")) image(fake_news_4, screen_x, 0, width/2, height);
  else if(content.equals("badges")) set(screen_x, 0, badges);
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
