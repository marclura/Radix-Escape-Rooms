/* Scenes */

void scenePlay() {
    if(current_scene == 0) {
      println("Scene 1");
      scene_active = true;
      video_intro.play();
      video_intro.jump(221);  // !!! ONLY FOR DEVV
    }
}


void updateScene() {
 
  if(scene_active) {
    if(current_scene == 0) scene0();
    else if (current_scene == 1) scene1();
  }
  
}


// video intro
void scene0() {

  set(0, 0, video_intro);  // display next video frame
  
  if(!timer_active && video_intro.time() >= timer_start_at_video_intro) {  // start the timer
    startTimer();
  }
  
  if(video_intro.time() >= video_intro.duration() - 0.1) {  // video over
    scene_active = false;
  }
  
}


// 
void scene1() {
  
}
