/*

Escape rooms - Radix 2024

Author:
Marco Lurati
contact@marcolurati.ch

Interface I/Os:
# Arduino
  Inputs:
  - Buttons for navigation (D1 - D5)
  - Sensors for the cards (A0 - A5)
  Outputs:
  - Relays Room  RR (D7)
  - Relays Sports RS (D0)
  - LEDs for the buttons (D8 - D12)
# Remote Logitech
  - LEFT
  - RIGHT
# Numpad keys
  - Numbers
  - Enter key
# Beamer
# Screen
# Audio output

 */
 
// Video library
import processing.video.*;

// Sound library
import processing.sound.*;

// Serial library
import processing.serial.*; 

// Scene management
int scene = 3;
int old_scene = -1;

// Contents

// PImage
PImage logo;
PImage fake_news_1;
PImage fake_news_2;
PImage fake_news_3;
PImage fake_news_4;
PImage fake_news_5;
PImage badges;

// Videos
Movie movie_scene_1;
Movie movie_scene_2;

// Sounds
SoundFile auto_distruction_activated;


// Fonts
PFont fontTimer, fontPassword;
int size_font_timer = 400;
int size_font_password = 100;

// Settings
int screen_x = 0;  // screen x position in fullscreen(SPAN) mode
int beamer_x = 1920;  // beamer x position in fullscreen(SPAN) mode

// Serial
int serial_baudrate = 921600;
boolean serial_first_contact = false;  // communication initialization
Serial SerialPort;  // create a object for the serial class
byte serial_port_index = 1;  // current serial port index
boolean serial_reset = false;  // execute arduino reset
String income_serial_val = "";

// Timer
int countdown_duration = 20;  // minutes
int timer_start_at_video_intro = 5740 / 30; // seconds (5740 frames)

// Keys management
boolean key_released = true;  // proper events triggering

// Scenes settings
String scene_2_password = "123456";
String input_password = "";
String message_wrong_password = "incorrect, try again";
String message_correct_password = "access granted";
byte current_fake_news = 3;
byte fake_news_count = 5;
boolean check_next_scene = false;

// development
boolean dev = true;


void settings() {
  if(dev) {
    size(1920*2, 1080);
  }
  else {
    fullScreen(SPAN);
  }
  smooth(10);
}

void setup() {
  
  // Serial init
  serialInit();
  
  // hide cursor
  noCursor();
  
  // font loading
  fontTimer = createFont("TheFuture-Black.otf", size_font_timer);
  fontPassword = createFont("TheFuture-Black.otf", size_font_password);
    
  // Load images
  loadImages();
  
  // Load videos
  loadVideos();
  
  // Load Sounds
  loadSounds();
  

}

void draw() {
  
  playScene();
  
  if(timer_active) runTimer();

}

void movieEvent(Movie m) {
  m.read();
}
