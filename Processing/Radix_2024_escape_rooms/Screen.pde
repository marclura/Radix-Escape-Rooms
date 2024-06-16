/* Screen on the table */

void screenUpdate(String content) {
  
  if(content.equals("logo")) set(screen_x, 0, logo);
  else if(content.equals("fake_news_1")) set(screen_x, 0, fake_news_1);
  else if(content.equals("fake_news_2")) set(screen_x, 0, fake_news_2);
  else if(content.equals("fake_news_3")) set(screen_x, 0, fake_news_3);
  else if(content.equals("fake_news_4")) set(screen_x, 0, fake_news_4);
  else if(content.equals("fake_news_5")) set(screen_x, 0, fake_news_5);
  else if(content.equals("badges")) set(screen_x, 0, badges);
  
  
}
