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
      movie_scene_2.jump(movie_scene_2.duration() - 2);
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
     Alarm captain distruction, timer loop alarm, password
  */
  else if(scene == 3) {
    
    if(scene != old_scene) {  // setup new scene
      println("SCENE 3");
      
      old_scene = scene;
      
      delay(4000);
      
      screenUpdate("fake_news_1");
      
      
      
      
    }
    else {
      
    }
    
  }
  
}
