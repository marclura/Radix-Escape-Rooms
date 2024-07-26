/* Content management */

void loadImages() {
  logo = loadImage("logo.png");
  
  // random first image
  int random_img_1 = int(random(1, 4));
  String image_1 = "EM_fake_news1.jpg";
  switch(random_img_1) {
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
  
  fake_news_1 = loadImage(image_1);
  fake_news_2 = loadImage("EM_fake_news2.jpg");
  fake_news_3 = loadImage("EM_fake_news3.jpg");
  fake_news_4 = loadImage("EM_fake_news4.jpg");
  badges = loadImage("EM_badge.jpg");
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
