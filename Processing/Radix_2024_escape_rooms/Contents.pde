/* Content management */

void loadImages() {
  if(station_number == 1) logo = loadImage("EM_schermate_monitor_logo_blu.jpg");
  else if(station_number == 2) logo = loadImage("EM_schermate_monitor_logo_rosso.jpg");
  if(station_number == 3) logo = loadImage("EM_schermate_monitor_logo_verde.jpg");
  
  // random first image
  String image_1 = "EM_fake_news1_A.jpg";
  switch(fake_news_version) {
    case 1:
      image_1 = "EM_fake_news1A.jpg";
      break;
    case 2:
      image_1 = "EM_fake_news1B.jpg";
      break;
  }
  
  fake_news_1 = loadImage(image_1);
  fake_news_2 = loadImage("EM_fake_news2.jpg");
  fake_news_3 = loadImage("EM_fake_news3.jpg");
  fake_news_4 = loadImage("EM_fake_news4.jpg");
  badges = loadImage("EM_badge.jpg");
  instructions_badges = loadImage("EM_schermate_monitor_badge.jpg");
  instructions_leave = loadImage("EM_schermate_monitor_allarme.jpg");;
  instructions_world_1 = loadImage("EM_schermate_monitor_scegliere_mondo_00.jpg");;
  instructions_world_2 = loadImage("EM_schermate_monitor_scegliere_mondo_01.jpg");;
  instructions_world_3 = loadImage("EM_schermate_monitor_scegliere_mondo_02.jpg");;
  println("loadImages() done");
}

void loadVideos() {
  movie_scene_1 = new Movie(this, "EM_AUDIOVIDEO_01.mp4");
  movie_scene_2 = new Movie(this, "EM_AUDIOVIDEO_04.mp4");
  println("loadVideos() done");
}

void loadSounds() {
  auto_distruction_activated = new SoundFile(this, "EM_AUDIO_03.mp3");
  choice_moment = new SoundFile(this, "EM_AUDIO_05.mp3");
  auto_distruction_3min = new SoundFile(this, "EM_AUDIO_06.mp3");
  auto_distruction_2min = new SoundFile(this, "EM_AUDIO_07.mp3");
  auto_distruction_1min = new SoundFile(this, "EM_AUDIO_08.mp3");
  println("loadSounds() done");
}

void loadFakeNewsVersion() {
  println("loadFakeNewsVersion()");
  
  String file_name = "fake_news_version.txt";
  String br[] = loadStrings(file_name);
  
  // Print each value, from 0 to 255 
  for (int i = 0; i < br.length; i++) { 
    println("old fake_news_version: " + br[i]);
    fake_news_version = int(br[i]);
  }
  
  if(fake_news_version == 1) {
    fake_news_version = 2;
  }
  else fake_news_version = 1;
  
  println("new fake_news_version: " + fake_news_version);

  
  String bw[] = {str(fake_news_version)};
  println("read fake_news_version: " + bw[0]); 
  saveStrings(file_name, bw);
  
}
