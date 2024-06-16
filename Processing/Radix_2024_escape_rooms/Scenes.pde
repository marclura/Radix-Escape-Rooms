/* SCENES */

void playScene() {
  
  /* SCENE 0:
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
  
  /* SCENE 1:
     Entrance, input by remote, video playback
  */
  else if(scene == 1) {
    
    if(scene != old_scene) {  // setup new scene
      println("SCENE 1");
      relaysRoom(false);
      
      old_scene = scene;
    }
    else {  // next scene trigger
      if(checkKeyCodedPressed(RIGHT)) scene++;
    }
    
  }
  
  /* SCENE 2:
     Entrance, input by remote, video playback
  */
  else if(scene == 2) {
    
    if(scene != old_scene) {  // setup new scene
      println("SCENE 2");

      old_scene = scene;
    }
    else {  // next scene trigger

  }
    
  }
  
}
