/* SCENES */

void playScene() {
  
  /* Scene 0:
     Start, room on, spots off, logos on the screens
  */
  if(scene == 0) {
    
    if(scene != old_scene) {  // setup new scene
      println("SCENE 0 active");
      relaysRoom(true);
      relaysSpots(true);
      
      screenUpdate("logo");
      beamerUpdate("logo");
      
      old_scene = scene;
    }
    
  }
  
  /* Scene 1:
     Entrance, input 
  */
  else if(scene == 1) {
    
  }
  
}
