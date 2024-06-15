/* Escape rooms - Radix 2024
 *
 * Marco Lurati
 * contact@marcolurati.ch
 *
 *
 */
 
// Video library
import processing.video.*;

// Sound library
import processing.sound.*;


// Video data
Movie video_intro;

// Scenes
int current_scene = 0;
boolean scene_active = false;

// PImage
PImage galaxi_dream_logo;

// Fonts
PFont fontTimer;
int sizefontTimer = 400;

// Timer
int countdown_duration = 20;  // minutes
int timer_start_at_video_intro = 5740 / 30; // seconds (5740 frames)


void settings() {
  size(1920, 1080, P2D);
  smooth(10);
}

void setup() {
  // video loading
  video_intro = new Movie(this, "EM_VIDEO_INIZIALE.mp4");  // EM_VIDEO_INIZIALE_S
  
  // font loading
  fontTimer = createFont("TheFuture-Black.otf", sizefontTimer);
  
  // image loading
  galaxi_dream_logo = loadImage("galactic_dream.png");
  image(galaxi_dream_logo, 0, 0);
  
  // Background image
  
  

}

void draw() {
   
  updateScene();
  
  if(timer_active) {
    if(!scene_active && current_scene == 0) background(0);
    timer();
  }
  
}

void movieEvent(Movie m) {  // read new available frames
  m.read();
}


void keyPressed() {
  if (keyCode == RIGHT && !scene_active) {
    scenePlay();
  }
}
