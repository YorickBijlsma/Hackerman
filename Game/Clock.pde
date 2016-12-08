int Time = 10; //Amount of seconds for each level
int last = 0;
int m = 0;
int seconds = 0;
int TimeLevel = Time;
int secondsLeft = 0;

void updateClock() 
{  
  m = millis()-last;

  if (millis() > last + 1000) //do something every 1000 miliseconds (1 second)
  {
    last = millis();
    seconds += 1;
  }
  
  secondsLeft = TimeLevel - seconds;  //subtract amount of time by already passed time

  if (secondsLeft < 0)
  {
    player.health = 0;
    secondsLeft = 0;
  }
}  

void resetClock()  // reset all values making the clock reset itself
{
  last = 0;
  seconds = 0;
  m = 0;
  TimeLevel = Time;
}