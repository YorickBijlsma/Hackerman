
int last = 0;
int m = 0;
int seconds = 0;
int minutes = 0;

void drawClock () {
  m = millis()-last;
  if (millis() > last + 1000){
    last = millis();
    //Something 5 seconds
    seconds += 1;
  }
  if (seconds == 60) {
    minutes += 1;
    seconds = 0;
  }
  fill(255);
  textSize(48);
  
  text("Time : " + minutes + "m " + seconds + "s",60,60);
}  
void resetClock(){
  last = 0;
  seconds = 0;
  m = 0;
  minutes = 0;
}
  