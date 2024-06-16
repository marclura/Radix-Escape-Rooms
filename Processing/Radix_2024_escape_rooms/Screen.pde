/* Screen on the table */

void screenUpdate(String content) {
  
  if(content.equals("logo")) {  // station logo
    set(screen_x, 0, logo);    
  }
  else if(content.equals("fake_news_1")) {
    set(screen_x, 0, fake_news_1);
  }
  
  
}
