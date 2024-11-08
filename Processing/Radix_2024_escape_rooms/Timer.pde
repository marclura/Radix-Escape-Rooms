/* Timer */

long timer = 0;
int minutes = 0;
int seconds = 0;
String current_countdown = " ";
String seconds_str = " ";
String minutes_str = " ";
long countdown_start_time = 0;


void startTimer() {
  countdown_start_time = millis() + 1000;
}

boolean runMainTimer(int duration) {
  
  boolean main_timer_not_over = true;
  
  textFont(fontTimer);
  textAlign(CENTER);
  noStroke();
  
  timer = duration * 60 * 1000 - (millis() - countdown_start_time);
  if(timer >= 0) {
    minutes = int(floor(timer / 1000 / 60));
    seconds = int(floor((timer / 1000) % 60));
    
    if(seconds < 10) seconds_str = "0" + str(seconds);
    else seconds_str = str(seconds);
    
    if(minutes < 10) minutes_str = "0" + str(minutes);
    else minutes_str = str(minutes);
    
    if(timer <= 0) {
      minutes_str = "00";
      seconds_str = "00";
    }
    
    
    // alternate color flashing based on the station color number
    if(seconds % 2 == 0) { 
      if(station_number == 1) {
        fill(RED);
      }
      else if(station_number == 2) {
        fill(GREEN);
      }
      else {
        fill(BLUE);
      }
    }
    else {
      fill(255);
    }
    
    
    rect(beamer_x, 0, width/2, height);
    
    fill(0);
    text(minutes_str + ":" + seconds_str, width/4 + beamer_x, height/2 + size_font_timer/3);
  }
  else main_timer_not_over = false;
  
  return main_timer_not_over;
}


void startOneMinuteCountdown() {
  println("Start one minute countdown");
  start_one_minute_millis = millis();
}

boolean oneMinuteCountdown() {
  boolean elasped = false;
  if(millis() - start_one_minute_millis > one_minute_duration * 1000) {
    elasped = true;
  }
  return elasped;
}
