class Score {
  int totalscore = 0;
  float scorepoints = 1;
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
    totalscore += scorepoints;
   //totalscore += scorepoints + timepoints + healthpoints;
  }



  void drawScore()
  {
    fill(255);
    textSize(18);
    textAlign(CENTER); text("Score : " + totalscore, 625, 35);
  }
}