/* Timer */

long timer = 0;
int minutes = 0;
int seconds = 0;
String current_countdown = " ";
String seconds_str = " ";
String minutes_str = " ";
long countdown_start_time = 0;
boolean timer_active = false;

void startTimer() {
  countdown_start_time = millis() + 1000;
  timer_active = true;
}

void runTimer() {
  textFont(fontTimer);
  textAlign(CENTER);
  noStroke();
  
  timer = countdown_duration * 60 * 1000 - (millis() - countdown_start_time);
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
  
  fill(255);
  rect(beamer_x, 0, width/2, height);
  
  fill(0);
  text(minutes_str + ":" + seconds_str, width/4 + beamer_x, height/2 + size_font_timer/3);
}


  
