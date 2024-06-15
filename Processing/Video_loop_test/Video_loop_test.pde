/**
 * Loop. 
 * 
 * Shows how to load and play a QuickTime movie file.  
 *
 */

import processing.video.*;

Movie movie;

void settings() {
  fullScreen(SPAN);
}

void setup() {
  //size(1920, 1080);
  background(0);
  // Load and play the video in a loop
  movie = new Movie(this, "Em Saturlandiaon_h265.mp4");
  movie.loop();
}

void movieEvent(Movie m) {
  m.read();
}

void draw() {
  //if (movie.available() == true) {
  //  movie.read(); 
  //}
  //image(movie, 0, 0, width, height);
  set(1920, 0, movie);
  set(0, 0, movie);
}
