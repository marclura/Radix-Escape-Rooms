/* Sounds management */

void startSoundPlaying(SoundFile sound, String callback) {
  if(current_playing != null && current_playing != sound) {
    current_playing.stop();
  }
  sound.amp(1.0);
  sound.play();
  current_playing = sound;
  
  soundCallbackAtion = callback;
}

void runAutosdistruction() {
  if(millis() - old_millis_autodistruction > autodistruction_interval * 1000) {
    println("Play autodistruction audio");
    if(playback_autodestruction) startSoundPlaying(auto_distruction_activated, null);
    old_millis_autodistruction =  millis();  
  }
  
}

void runBadgeChoiceAudio() {
  playback_autodestruction = false;
  startSoundPlaying(choice_moment, "playback_autodestruction");
  bages_choice_activated = false;
  check_next_scene = true; 
}
