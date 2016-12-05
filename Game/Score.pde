class Score
{
  int totalScore = 0;
  int scorepoints = 1;
  float totaltime = minutes*60 + seconds;
  float timepoints = seconds/5;
  float healthpoints = health/10;

  void berekenScore()
  {
    if (health < player.originalHealth / 2) 
    {
      healthpoints = 0;
    }

    if (seconds < 8)
    {
      timepoints = 0;
    }
    totalScore += scorepoints;
   //totalscore += scorepoints + timepoints + healthpoints;
  }



  void drawScore()
  {
    fill(HUDcolour);
    textSize(24);
    textAlign(CENTER); text("Score : " + totalScore, 625, 25);
  }
}