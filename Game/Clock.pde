int Time = 11;
int last = 0;
int m = 0;
int seconds = 0;
int minutes = 0;
int TimeLevel = Time;
int secondsLeft = 0;
//int timeForLevel = 10;
void drawClock () 
{
  
  m = millis()-last;
  
  if (millis() > last + 1000)
  {
    last = millis();
    seconds += 1;
  }
  
    if (seconds == 60) 
    {
      minutes += 1;
      seconds = 0;
    }
    
  secondsLeft = TimeLevel - seconds;
  
    if (secondsLeft < 0) 
    {
      player.health = 0;
      secondsLeft = 0;      
    }
    
    if (player.health > 0)
    {
      fill(HUDcolour);
      textSize(36);
      text("Time left: " + secondsLeft,width - 250,40);
    }
}  
void resetClock()
{
  last = 0;
  seconds = 0;
  m = 0;
  minutes = 0;
  TimeLevel = Time;
}
  