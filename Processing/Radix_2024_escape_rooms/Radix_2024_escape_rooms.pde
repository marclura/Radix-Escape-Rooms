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


!!!!!!!!!!!!!!!!!!!!!!!
CHANGES

Arduino port! serial_port_index

 */
 
// Video library
import processing.video.*;

// Sound library
import processing.sound.*;

// Serial library
import processing.serial.*;

// development
boolean dev = false;

// Current station
int station_number = 2;  // 1 RED, 2 GREEN, 3 BLUE

// Scene management
int scene = 4;  // starts form 0
int old_scene = -1;

// Contents

// PImage
PImage logo;
PImage fake_news_1;
PImage fake_news_2;
PImage fake_news_3;
PImage fake_news_4;
PImage badges;
PImage instructions_badges;
PImage instructions_leave;
PImage instructions_world_1;
PImage instructions_world_2;
PImage instructions_world_3;

String[] fake_news_list = new String[5];

// Videos
Movie movie_scene_1;
Movie movie_scene_2;

// Sounds
SoundFile auto_distruction_activated;
SoundFile choice_moment;
SoundFile auto_distruction_3min;
SoundFile auto_distruction_2min;
SoundFile auto_distruction_1min;
SoundFile current_playing;
SoundFile background_spaceship;
SoundFile explosion;


// Fonts
PFont fontTimer, fontPassword;
int size_font_timer = 400;
int size_font_password = 100;

// Setup
boolean get_focus = false;  // windows focus flag
boolean first_draw = false;  // run the draw first before playing anything to define the canvas size 

// Settings
int screen_x = 1920;  // screen x position in fullscreen(SPAN) mode
int beamer_x = 0;  // beamer x position in fullscreen(SPAN) mode
int screen_width = 1920;  // px
int screen_height = 1080;  // px

// Serial
int serial_baudrate = 921600;
boolean serial_first_contact = false;  // communication initialization
Serial SerialPort;  // create a object for the serial class
byte serial_port_index = 0;  // current serial port index
boolean serial_reset = false;  // execute arduino reset
String income_serial_val = "";
boolean serial_event_listening = false;  // stop the serialEvent to work when Arduino is resetting

// Timer
int main_timer_duration = 20;  // minutes, default: 20
int old_millis = 0;  // ms
int millis_delay = 0;  // seconds
int start_one_minute_millis = 0;  // ms
int one_minute_duration = 60; // seconds, default: 60
int escape_timer_duration = 3; // minutes, default: 3


// Keys management
boolean key_released = true;  // proper events triggering

// Scenes settings
byte current_fake_news = 0;
byte fake_news_count = 5;
int fake_news_version = 1;  // every playback, will show a different fake news, so groups won't share informations
boolean check_next_scene = false;
String next_playing = "";
int next_autodestruction_minute = 3;

// Autodistruction
int autodistruction_interval = 60;  // seconds, default: 60
int old_millis_autodistruction = 0;

// Game status
boolean playback_autodestruction = false;
boolean loop_background_sound = false;
boolean main_timer = false;
boolean escape_timer = false;
boolean bages_choice_activated = false;  // used to update the screen in the draw with the bades and play the audio
String soundCallbackAtion = null;

// Check reset game
int reset_click_counter = 0;
int last_click_millis = 0;


void settings() {
  fullScreen(SPAN);
  smooth(10);
}

void setup() {  
  
  frameRate(30);
  
  background(0);
  
  // hide cursor
  if(!dev) noCursor();
  
  if(dev) {
    autodistruction_interval = 20;  // seconds
    main_timer_duration = 3;  // minutes
    one_minute_duration = 5;  // seconds
    escape_timer_duration = 1;  // minutes
  }
  
  // font loading
  println("Font loading...");
  fontTimer = createFont("TheFuture-Bold.otf", size_font_timer);
  fontPassword = createFont("TheFuture-Bold.otf", size_font_password);
  
  // Load fake news version
  loadFakeNewsVersion();
  
  // loading screen
  screenUpdate("loading");
    
  // Serial init
  serialInit();
  
  // Load images
  loadImages();
  
  // Load videos
  loadVideos();
  
  // Load Sounds
  Sound.list();  
  loadSounds();
  
  
}

void draw() {
  
  if(!first_draw) first_draw = true;
  else {
  
    if(!get_focus) {
      ((java.awt.Canvas) surface.getNative()).requestFocus();  // focus the window on Processing to make keys work
      get_focus = true;
      delay(1000);  // add delay to prevent errors on the canvas size not loaded
    }
    
    checkCallbackActions();
    
    //checkIfResetGame();
    
      
    if(main_timer) {
      if(runMainTimer(main_timer_duration)) {  // main timer not over
        runAutosdistruction();
      }
      else {  // main timer over
        println("MAIN TIMER OVER -> ESCAPE");
        main_timer = false;
        scene = 4;
      }
    }
    
    if(escape_timer) {
      if(!runMainTimer(escape_timer_duration) || checkKeyCodedPressed(RIGHT)) {  // escape timer is over or button pressed
        println("ESCAPE TIMER OVER -> GAME END");
        escape_timer = false;
        scene = 5;
      }
    }
    
    if(bages_choice_activated) runBadgeChoiceAudio();  // sounds tab
    
    // play a the end to update the screens
    playScene();
  
  }
  

}

void movieEvent(Movie m) {
  m.read();
}

void checkCallbackActions() {
  if(soundCallbackAtion != null && soundCallbackAtion.equals("playback_autodestruction")) {  // restart the playback of the autodestruction audio
    if(!choice_moment.isPlaying()) {
      playback_autodestruction = true;
      soundCallbackAtion = null;
    }
  }
  else if (soundCallbackAtion != null && soundCallbackAtion.equals("explosion")) {
    delay(round(explosion.duration()*1000));
    relaysSpots(false);
    soundCallbackAtion = null;
  }
}

void resetGame() {
  old_millis = 0;
  millis_delay = 0;
  start_one_minute_millis = 0;
  input_password = msg_password;
  current_fake_news = 0;
  scene = 0;
  check_next_scene = false;
  next_playing = "";
  next_autodestruction_minute = 3;
  old_millis_autodistruction = 0;
  playback_autodestruction = false;
  main_timer = false;
  bages_choice_activated = false;
  soundCallbackAtion = null;
  escape_timer = false;
  loop_background_sound = false;
}

void checkIfResetGame() {
  if(checkKeyCodedPressed(LEFT)) {
    reset_click_counter++;
    last_click_millis = millis();
  }
  
  if(millis() - last_click_millis > 5000) {
    reset_click_counter = 0;  // reset
  }
  
  if(reset_click_counter >= 5) {
    reset_click_counter = 0;
    resetGame();
  }
  
}
