int Time = 11;
int last = 0;
int m = 0;
int seconds = 0;
int minutes = 0;
int TimeLevel = Time;
int secondsLeft = 0;
//int timeForLevel = 10;
void updateClock() 
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
}  

void resetClock()
{
  last = 0;
  seconds = 0;
  m = 0;
  minutes = 0;
  TimeLevel = Time;
}