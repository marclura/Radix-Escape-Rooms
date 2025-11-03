/* SCENES */

void playScene() {
  
  /* ################  SCENE 0 #################
     Start, room on, spots off, logos on the screens
  */
  if(scene == 0) {
    
    if(scene != old_scene) {  // setup new scene
    
      // 3.
      println("SCENE 0");
      relaysRoom(true);
      relaysSpots(false);
      
      screenUpdate("logo");
      beamerUpdate("logo");
      
      old_scene = scene;
    }
    
    // 4.
    else {  // next scene trigger
      if(checkKeyCodedPressed(RIGHT)) scene++;
    }
    
  }
  
  /* ################  SCENE 1 #################
     Entrance, input by remote, video playback, worlds choice
  */
  else if(scene == 1) {
    
    if(scene != old_scene) {  // setup new scene
      println("SCENE 1");
      
      old_scene = scene;
      
      // 5. 6.
      // video playback captain and worlds
      movie_scene_1.play();
      if(dev) movie_scene_1.jump(movie_scene_1.duration() - 15);
      
      // screen instructions
      screenUpdate("instructions_world_3");
      
      delay(5);
      
    }
    else {
      if(movieDonePlaying(movie_scene_1)) {
        // 7.
        beamerUpdate("instructions_world_1");
        screenUpdate("instructions_world_1");
        // 8.
        if(checkKeyCodedPressed(RIGHT)) scene++;
      }
    }
    
  }
  
  /* ################  SCENE 2 #################
     Products display, both screens
  */
     
  else if(scene == 2) {
     
    if(scene != old_scene) {  // setup new scene
      println("SCENE 2");
      
      old_scene = scene;
      
      // 9.
      beamerUpdate("instructions_world_2");
      screenUpdate("instructions_world_2");
      
      delay(5);
      
    }
    // 10.
    else {  // next scene trigger
      if(checkKeyCodedPressed(RIGHT)) scene++;
    }
    
  }
    
  
  
  /* ################  SCENE 3 #################
     Alarm captain death, timer loop alarm, password
  */
  else if(scene == 3) {
    
    if(scene != old_scene) {  // setup new scene
      println("SCENE 3");
      
      old_scene = scene;
      
      // 11.
      // video playback captain death
      movie_scene_2.play();
      if(dev) movie_scene_2.jump(movie_scene_2.duration() - 10);
      delay(5);
      
      // screen
      screenUpdate("black");
      
      // then, countdown beamer and password input on keypad

    }
    else {
      
      // 12.
      if(movieDonePlaying(movie_scene_2)) {
                
        // countdown on beamer
        if(!main_timer) {
          main_timer = true;
          startTimer();
          playback_autodestruction = true;
          
          println("Play loop_background_sound audio");
          loop_background_sound = true;
          background_spaceship.loop();
          background_spaceship.amp(0.8);
        }
        
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
  
  /* ################  SCENE 4 #################
     Fake news scrolling, add badges, choice of the author
  */
  else if(scene == 4) {
    
    if(scene != old_scene) {  // setup new scene
      println("SCENE 4");
      
      old_scene = scene;
      
      //delay(3000);
      
      activateNavigationButtons(true);  
      
      screenUpdate(fake_news_list[current_fake_news]);
      
      check_next_scene = false;
      
    }
    else {
      
      // 14.
      // Navigation fake news
      String val = getIncomeSerialVal();
      
      if(val.equals("NEXT")) {
         if(current_fake_news < fake_news_count - 1) {
           current_fake_news++;
           println("current_fake_news: " + current_fake_news);
           screenUpdate(fake_news_list[current_fake_news]);
           serialSend("LED_BACK", 1);
           
           if(current_fake_news == fake_news_count - 1) serialSend("LED_NEXT", 0);
           else serialSend("LED_NEXT", 1);
         }
      }
      else if(val.equals("BACK")) {
         if(current_fake_news > 0) {
           current_fake_news--;
           println("current_fake_news: " + current_fake_news);
           screenUpdate(fake_news_list[current_fake_news]);
           
           serialSend("LED_NEXT", 1);
           if(current_fake_news == 0) serialSend("LED_BACK", 0);
           else serialSend("LED_BACK", 1);
         }
      }
      
      // 15.
      else if(val.equals("BADGES")) {
        activateNavigationButtons(false);
        screenUpdate("badges");
        delay(1000);
        bages_choice_activated = true;
      }
      else if(check_next_scene) {
        
        // 16.
        if(checkKeyCodedPressed(RIGHT)) {
          scene++;
          // main_timer = false;  // stop the main timer
        }
      }
    }
  }
  
    /* ################  SCENE 5 #################
     Back to Fake news scrolling, but this time with the badges final page
  */
  
  else if(scene == 5) {
    
    if(scene != old_scene) {  // setup new scene
      println("SCENE 5");
      
      old_scene = scene;
      
      //delay(3000);
      
      activateNavigationButtons(true);  
      
      current_fake_news = 0;
      
      screenUpdate(fake_news_list_after_choice[current_fake_news]);
      
    }
    
    else {
      // 17.
      // Navigation fake news after choice
      String val = getIncomeSerialVal();
      
      if(val.equals("NEXT")) {
         if(current_fake_news < fake_news_count - 1) {
           current_fake_news++;
           println("current_fake_news: " + current_fake_news);
           screenUpdate(fake_news_list_after_choice[current_fake_news]);
           serialSend("LED_BACK", 1);
           
           if(current_fake_news == fake_news_count - 1) serialSend("LED_NEXT", 0);
           else serialSend("LED_NEXT", 1);
         }
      }
      else if(val.equals("BACK")) {
         if(current_fake_news > 0) {
           current_fake_news--;
           println("current_fake_news: " + current_fake_news);
           screenUpdate(fake_news_list_after_choice[current_fake_news]);
           
           serialSend("LED_NEXT", 1);
           if(current_fake_news == 0) serialSend("LED_BACK", 0);
           else serialSend("LED_BACK", 1);
         }
      }
      
      
      // next scene trigger
      if(checkKeyCodedPressed(RIGHT)) {
        activateNavigationButtons(false);
        scene++;
      }
      
    }
  }
  
  /* ################  SCENE 6 #################
     Choice of the colpevole, using keyboard
  */
  
  else if(scene == 6) {
    
    if(scene != old_scene) {  // setup new scene
      println("SCENE 6");
      
      old_scene = scene;
      
      //delay(3000);
      
      // 18.
      // screenUpdate("final_choice_keypad");  // managed with displayChoice();
      
      delay(1000);
      
      bages_choice_activated = true;
      
    }
    else {
      
      displayChoice();    // password tab
      
      if(choiceColpevole()) {
        displayChoice();
        scene++;
      }
    }
  }
  
  /* ################  SCENE 7 #################
     Choice done
  */
  
  else if(scene == 7) {
    
    if(scene != old_scene) {  // setup new scene
      println("SCENE 7");
      
      old_scene = scene;
      
      // 20.
      screenUpdate("final_choice_done");
      
      delay(1000);
    }
    else {
      // 21.
      // next scene trigger
      if(checkKeyCodedPressed(RIGHT)) {
        scene++;
      }
      
    }
  }
  
  /* ################  SCENE 8 #################
     Leave the ship, autodistruction
  */
  else if(scene == 8) {
    
    if(scene != old_scene) {  // setup new scene
      println("SCENE 8");
      
      old_scene = scene;
      
      relaysRoom(false);
      
      relaysSpots(true);
      
      main_timer = false;
     
      
      beamerUpdate("instructions_leave");
      screenUpdate("instructions_leave");
      
      startOneMinuteCountdown();
      next_autodestruction_minute = 2;
      
      escape_timer = true;
      startTimer();
      
      startSoundPlaying(auto_distruction_3min, null);
      
    }
    else {
      if(oneMinuteCountdown()) {
 
        switch(next_autodestruction_minute) {
          case 2:
            startOneMinuteCountdown();
            startSoundPlaying(auto_distruction_2min, null);
            next_autodestruction_minute = 1;
            break;
          case 1:
            startOneMinuteCountdown();
            startSoundPlaying(auto_distruction_1min, null);
            next_autodestruction_minute = 0;
            break;     
        }
      }

    }
    
  }
  /* ################  SCENE 9 #################
     Explosion
  */
  else if(scene == 9) {
    if(scene != old_scene) {  // setup new scene
      println("SCENE 9");
      old_scene = scene;
      
      // stop the spaceship background sounds
      background_spaceship.jump(0);
      background_spaceship.pause();
      
      // 23.
      relaysSpots(true);
      relaysRoom(true);
      
      startSoundPlaying(explosion, "explosion");
      
      fill(255);
      rect(0, 0, width, height);
      
      println("EXPLOSION");
      relaysSpots(true);
      relaysRoom(true);
      
      scene++;
    }
     
  }
  
  /* ################  SCENE 10 #################
     End of the game
  */
  else if(scene == 10) {
    if(scene != old_scene) {  // setup new scene
      println("SCENE 10");
      old_scene = scene;
      
      // 24.
      // Message
      fill(255);
      rect(0, 0, width, height);
      textFont(fontTimer);
      textSize(130);
      textAlign(CENTER);
      fill(0);
      text("Prosegui questo viaggio,\nl'avventura continua....", width/4, height/2);
      text("Prosegui questo viaggio,\nl'avventura continua...", width/4*3, height/2);
    }
    
    if(checkKeyCodedPressed(RIGHT)) {
      println("Game resetted");
      resetGame();
    }

  }
  
}
