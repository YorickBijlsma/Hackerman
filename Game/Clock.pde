int secondsCounter = 0;
int secondsLeft = 0;

void updateClock() //TODO: levels start at 9, not 10. this means secondsCounter = 1 somewhere early in the code
{
  if (frameCount % 60 == 0)
  {
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
  secondsCounter = 0;
}