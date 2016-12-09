class Score
{
  int totalScore = 0;
  int scorepoints = 1;
  float totaltime = secondsCounter;
  float timepoints = secondsCounter/5;
  float healthpoints = health/10;

  void berekenScore()
  {
    if (health < player.originalHealth / 2) 
    {
      healthpoints = 0;
    }

    if (secondsCounter < 8)
    {
      timepoints = 0;
    }
    totalScore += scorepoints;
   //totalscore += scorepoints + timepoints + healthpoints;
  }



  void drawScore()
  {
    
  }
}