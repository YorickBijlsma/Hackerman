class Score
{
  float totalScore = 0;
  float oldScore = 0;
  int numberOfScores = 0;
  float scorePoints = 20;
  float totaltime = secondsCounter;
  float timePoints;
  float healthpoints = health/10;
  boolean calculatedThisLevel = false;

  float berekenScore()
  { 
    if (!calculatedThisLevel)
    {
      oldScore = totalScore;

      timePoints = secondsLeft * 5;      //add secondsLeft*5 amount of points over levelWait amount of frames
      totalScore += scorePoints;
      totalScore += timePoints;
      
      //numberOfScores = numberOfScores % 20;

      calculatedThisLevel = true;
      
    }
    return totalScore;
  }



  void drawScore()
  {
  }
}

class Leaderboard
{
  float[] lastFiveScores = {0, 0, 0, 0, 0};
  int x = 1170;
  int y = 0;
  int padding = 20;

  void draw()
  {
    fill(HUDcolour);
    imageMode(CORNER);
    image(leaderboardImage, x, y);
    textSize(18);
    for (int thisScore = 0; thisScore < 5; thisScore++)
    {
      text(thisScore+1+": " + (int)lastFiveScores[thisScore], x+padding, padding*3 + (thisScore*padding));
    }
  }
}