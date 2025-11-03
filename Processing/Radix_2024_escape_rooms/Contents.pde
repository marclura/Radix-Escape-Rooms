/* Content management */

// colors of the different rooms (ROSSO, VERDE, BLU)

color BLUE = color(0, 126, 187);
color RED = color(223, 51, 20);
color GREEN = color(0, 169, 41);

void loadFakeNewsImage() {
  
  String image_1 = "EM_fake_news1.jpg";
  
  switch(fake_news_version) {
    case 1:
      image_1 = "EM_fake_news1.jpg";
      break;
    case 2:
      image_1 = "EM_fake_news1A.jpg";
      break;
    case 3:
      image_1 = "EM_fake_news1B.jpg";
      break;
  }
  
  println("Load fake news version: " + image_1);
  
  fake_news_1 = loadImage(image_1);
  
}

void loadImages() {
  if(station_number == 1) logo = loadImage("EM_schermate_monitor_RED.jpg");
  else if(station_number == 2) logo = loadImage("EM_schermate_monitor_GREEN.jpg");
  if(station_number == 3) logo = loadImage("EM_schermate_monitor_BLUE.jpg");
  
  // load variable fake news
  loadFakeNewsImage();
  
  fake_news_2 = loadImage("EM_fake_news2.jpg");
  fake_news_3 = loadImage("EM_fake_news3.jpg");
  fake_news_4 = loadImage("EM_fake_news4.jpg");
  instructions_badges = loadImage("EM_schermate_monitor_badge.jpg");
  badges = loadImage("EM_badge.jpg"); 
  
  // load the array list for the fake news scene
  fake_news_list[0] = "fake_news_1";
  fake_news_list[1] = "fake_news_2";
  fake_news_list[2] = "fake_news_3";
  fake_news_list[3] = "fake_news_4";
  fake_news_list[4] = "instructions_badges";
  
  // load the array list of the fake news scene after the choice (last slide is the badges)
  fake_news_list_after_choice[0] = "fake_news_1";
  fake_news_list_after_choice[1] = "fake_news_2";
  fake_news_list_after_choice[2] = "fake_news_3";
  fake_news_list_after_choice[3] = "fake_news_4";
  fake_news_list_after_choice[4] = "fake_news_badges";
   
  instructions_leave = loadImage("EM_schermate_monitor_allarme.jpg");
  instructions_world_1 = loadImage("EM_schermate_monitor_scegliere_mondo_00.jpg");
  instructions_world_2 = loadImage("EM_schermate_monitor_scegliere_mondo_01.jpg");
  instructions_world_3 = loadImage("EM_schermate_monitor_scegliere_mondo_02.jpg");
  
  // final choice
  final_choice_keypad = loadImage("EM_schermate_monitor_colpevole_tastiera.jpg");
  final_choice_done = loadImage("EM_schermate_monitor_assassino.jpg");
  
  println("loadImages() done");
}

void loadVideos() {
  
  if(station_number == 1) movie_scene_1 = new Movie(this, "ROSSO.mp4");
  else if(station_number == 2) movie_scene_1 = new Movie(this, "VERDE.mp4");
  else if(station_number == 3) movie_scene_1 = new Movie(this, "BLU.mp4");
  else movie_scene_1 = new Movie(this, "ROSSO.mp4");
  
  movie_scene_2 = new Movie(this, "EM_AUDIOVIDEO_04.mp4");
  println("loadVideos() done");
}

void loadSounds() {
  auto_distruction_activated = new SoundFile(this, "EM_AUDIO_03_AutodistruzioneAttivata.mp3");
  choice_moment = new SoundFile(this, "EM_AUDIO_05_SceglieteIlColpevole.mp3");
  auto_distruction_3min = new SoundFile(this, "EM_AUDIO_06_Autodistruzione3min.mp3");
  auto_distruction_2min = new SoundFile(this, "EM_AUDIO_07_Autodistruzione2min.mp3");
  auto_distruction_1min = new SoundFile(this, "EM_AUDIO_08_Autodistruzione60sec.mp3");
  background_spaceship = new SoundFile(this, "EM_sottofondoAstronave.mp3");
  explosion = new SoundFile(this, "EM_Esplosione_mod.mp3");
  println("loadSounds() done");
}

void loadFakeNewsVersion() {
  println("loadFakeNewsVersion()");
  
  String file_name = "fake_news_version.txt";
  
  if(fake_news_version != 0) { // don't read the file when game just start (1st run)
    String br[] = loadStrings(file_name);
    
    // Print each value, from 0 to 255 
    for (int i = 0; i < br.length; i++) { 
      println("old fake_news_version: " + br[i]);
      fake_news_version = int(br[i]);
    }
  }
  
  if(fake_news_version == 1) {
    fake_news_version = 2;
  }
  else if (fake_news_version == 2) {
    fake_news_version = 3;
  }
  else fake_news_version = 1;
  
  println("new fake_news_version: " + fake_news_version);
  
  String bw[] = {str(fake_news_version)};
  saveStrings(file_name, bw);
  
}
