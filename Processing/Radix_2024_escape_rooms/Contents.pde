/* Content management */

void loadImages() {
  logo = loadImage("logo.png");
  fake_news_1 = loadImage("EM_fake_news1.jpg");
  fake_news_2 = loadImage("EM_fake_news2.jpg");
  fake_news_3 = loadImage("EM_fake_news3.jpg");
  fake_news_4 = loadImage("EM_fake_news4.jpg");
  fake_news_5 = loadImage("EM_fake_news5.jpg");
  badges = loadImage("EM_badge.jpg");
}

void loadVideos() {
  movie_scene_1 = new Movie(this, "EM_AUDIOVIDEO_01.mp4");
  movie_scene_2 = new Movie(this, "EM_AUDIOVIDEO_04.mp4");
}

void loadSounds() {
  auto_distruction_activated = new SoundFile(this, "EM_AUDIO_03.mp3");
}
