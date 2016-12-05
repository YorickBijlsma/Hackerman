class Score {
  int totalscore = -10;
  float scorepoints = 10;
  float totaltime = minutes*60 + seconds;
  float timepoints = seconds/5;
  float healthpoints = health/10;

  void berekenScore() {
    if (health < 50) 
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



  void drawScore() {
    fill(255);
    textSize(18);

    text("Score : " + totalscore, 625, 35);
  }
}