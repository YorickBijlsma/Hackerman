int Time = 11;
int last = 0;
int m = 0;
int seconds = 0;
int minutes = 0;
int TimeLevel = Time;
int secondsLevel = 0;
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
    
  secondsLevel = TimeLevel - seconds;
  
    if (secondsLevel < 0) 
    {
      player.health = 0;
      secondsLevel = 0;      
    }
    
    if (player.health > 0)
    {
      fill(255);
      textSize(36);
      text("Time left: " + secondsLevel,width - 250,40);
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
  