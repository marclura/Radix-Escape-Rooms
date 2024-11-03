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
     Entrance, input by remote, video playback, worlds choice
  */
  else if(scene == 1) {
    
    if(scene != old_scene) {  // setup new scene
      println("SCENE 1");
      
      old_scene = scene;
      
      // video playback captain and worlds
      movie_scene_1.play();
      if(dev) movie_scene_1.jump(movie_scene_1.duration() - 15);
      
      // screen instructions
      screenUpdate("instructions_world_3");
      
      delay(5);
      
    }
    else {
      if(movieDonePlaying(movie_scene_1)) {
        beamerUpdate("instructions_world_1");
        screenUpdate("instructions_world_2");
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
      
      // video playback captain death
      movie_scene_2.play();
      if(dev) movie_scene_2.jump(movie_scene_2.duration() - 10);
      delay(5);
      
      // screen
      screenUpdate("black");
      
      // then, countdown beamer and password input on keypad

    }
    else {
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
  
  /* ################  SCENE 3 #################
     Fake news scrolling, add badges, choice of the author
  */
  else if(scene == 3) {
    
    if(scene != old_scene) {  // setup new scene
      println("SCENE 3");
      
      old_scene = scene;
      
      //delay(3000);
      
      activateNavigationButtons(true);  
      
      screenUpdate(fake_news_list[current_fake_news]);
      
      check_next_scene = false;
      
    }
    else {
      
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
      else if(val.equals("BADGES")) {
        activateNavigationButtons(false);
        screenUpdate("badges");
        delay(1000);
        bages_choice_activated = true;
      }
      else if(check_next_scene) {
        if(checkKeyCodedPressed(RIGHT)) {
          scene++;
          main_timer = false;  // stop the main timer
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
  /* ################  SCENE 5 #################
     Explosion
  */
  else if(scene == 5) {
    if(scene != old_scene) {  // setup new scene
      println("SCENE 5");
      old_scene = scene;
      
      // stop the spaceship background sounds
      background_spaceship.jump(0);
      background_spaceship.pause();
      
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
  
  /* ################  SCENE 6 #################
     End of the game
  */
  else if(scene == 6) {
    if(scene != old_scene) {  // setup new scene
      println("SCENE 6");
      old_scene = scene;
    
      // Message
      fill(255);
      rect(0, 0, width, height);
      textFont(fontTimer);
      textSize(75);
      textAlign(CENTER);
      fill(0);
      text("Fine del gioco. Grazie per la partecipazione.", width/4, height/2);
      text("Fine del gioco. Grazie per la partecipazione.", width/4*3, height/2);
    }
    
    if(checkKeyCodedPressed(RIGHT)) {
      println("Game resetted");
      resetGame();
    }

  }
  
}
