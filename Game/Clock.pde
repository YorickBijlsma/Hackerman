final int TIMELEVEL = 10; //Amount of seconds for each level
int millisCounter = 0;
int secondsCounter = 0;
int secondsLeft = 0;

void updateClock() //TODO: levels start at 9, not 10. this means secondsCounter = 1 somewhere early in the code
{   
  if (millis()> millisCounter + 1000) //1000 millis is 1 second
  {
    millisCounter = millis(); //this makes the difference 1000 millis again thus 1 second
    secondsCounter++;
  }
  
  if (secondsLeft < 0)
  {
    player.health = 0;
  }
  
  secondsLeft = TIMELEVEL - secondsCounter;
}  

void resetClock()  // reset all values making the clock reset itself
{
  millisCounter = 0;
  secondsCounter = 0;
}