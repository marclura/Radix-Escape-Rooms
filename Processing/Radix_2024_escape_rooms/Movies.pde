/* Movies management */

boolean movieDonePlaying(Movie m) {
  
  boolean movie_done = false;
  
  if(m.time() < m.duration() - 0.1 && m.isPlaying()) {
    set(beamer_x, 0, m);
  }
  else {
    if(movie_scene_1.time() != 0) {
      // rewind the movie
      movie_scene_1.pause();
      movie_scene_1.jump(0);
    }
    movie_done = true;
  }
  
  return movie_done;
}
