/* SCENES */

void playScene() {
  
  /* ################  SCENE 0 #################
     Start, room on, spots off, logos on the screens
  */
  if(scene == 0) {
    
    if(scene != old_scene) {  // setup new scene
      println("SCENE 0");
      relaysRoom(true);
      relaysSpots(false);
      
      screenUpdate("logo");
      beamerUpdate("logo");
      
      old_scene = scene;
    }
    else {  // next scene trigger
      if(checkKeyCodedPressed(RIGHT)) scene++;
    }
    
  }
  
  /* ################  SCENE 1 #################
     Entrance, input by remote, video playback
  */
  else if(scene == 1) {
    
    if(scene != old_scene) {  // setup new scene
      println("SCENE 1");
      
      old_scene = scene;
      
      // video playback captain and worlds
      movie_scene_1.play();
      delay(5);
      
    }
    else {
      if(movieDonePlaying(movie_scene_1)) {
        if(checkKeyCodedPressed(RIGHT)) scene++;
      }
    }
    
  }
  
  /* ################  SCENE 2 #################
     Alarm captain distruction, timer loop alarm, password
  */
  else if(scene == 2) {
    
    if(scene != old_scene) {  // setup new scene
      println("SCENE 2");
      
      old_scene = scene;
      
      // video playback captain
      movie_scene_2.play();
      if(dev) movie_scene_2.jump(movie_scene_2.duration() - 2);
      delay(5);
      
      // then, countdown beamer and password input on keypad

    }
    else {
      if(movieDonePlaying(movie_scene_2)) {
        
        // autodistruction sound loop
        if(!auto_distruction_activated.isPlaying()) {
          auto_distruction_activated.loop();
        }
        
        // countdown on beamer
        if(!timer_active) startTimer();
        
        // password activate
        displayPassword();
        
        // check for correct password to move to the next scene
        if(checkPassword()) {
          displayPassword();
          scene++;
        }
        
      }
    }
    
  }
  
  /* ################  SCENE 3 #################
     Fake news scrolling, add badges, choice of the author
  */
  else if(scene == 3) {
    
    if(scene != old_scene) {  // setup new scene
      println("SCENE 3");
      
      old_scene = scene;
      
      delay(3000);
      
      activateNavigationButtons(true);  
      
      screenUpdate("fake_news_" + current_fake_news);
      
      check_next_scene = false;
      
    }
    else {
      
      // Navigation fake news
      String val = getIncomeSerialVal();
      
      if(val.equals("NEXT")) {
         if(current_fake_news < fake_news_count) {
           current_fake_news++;
           screenUpdate("fake_news_" + current_fake_news);
           
           serialSend("LED_BACK", 1);
           if(current_fake_news == fake_news_count) serialSend("LED_NEXT", 0);
           else serialSend("LED_NEXT", 1);
         }
      }
      else if(val.equals("BACK")) {
         if(current_fake_news > 1) {
           current_fake_news--;
           screenUpdate("fake_news_" + current_fake_news);
           
           serialSend("LED_NEXT", 1);
           if(current_fake_news == 1) serialSend("LED_BACK", 0);
           else serialSend("LED_BACK", 1);
         }
      }
      else if(val.equals("BADGES")) {
        activateNavigationButtons(false);
        screenUpdate("badges");
        check_next_scene = true;
      }
      else if(check_next_scene) {
        if(checkKeyCodedPressed(RIGHT)) scene++;
      }
    }
  }
  
  /* ################  SCENE 4 #################
     Fake news scrolling, add badges, choice of the author
  */
  else if(scene == 4) {
    
    if(scene != old_scene) {  // setup new scene
      println("SCENE 4");
      
      old_scene = scene;
      
      
    }
    else {

    }
  }
  
  
}
