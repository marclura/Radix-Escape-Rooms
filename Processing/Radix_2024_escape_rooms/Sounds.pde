/* Sounds management */

void checkSoundPlaying(SoundFile sound, String next) {
  
  if(sound.isPlaying() && sound.position() > sound.duration() - 0.1) {
    println("stoppedPlaying: " + current_playing);
    sound.jump(0);
    sound.pause();
    auto_distruction_activated.amp(1.0);
    current_playing = "";
    next_playing = next;
  }
}

void startSoundPlaying(SoundFile sound, String current) {
  println("startSoundPlaying: " + current);
  auto_distruction_activated.amp(0.2);
  sound.play();
  current_playing = current;
  setMillisTimer(20);
}
