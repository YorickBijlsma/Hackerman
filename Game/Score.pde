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
      //saveBestScores();
      //numberOfScores = numberOfScores % 20;

      calculatedThisLevel = true;
    }
    return totalScore;
  }
}

class Leaderboard
{
  float[] bestFiveScores = {0, 0, 0, 0, 0};
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
      text(thisScore+1+": " + (int)bestFiveScores[thisScore], x+10, padding*2.5 + (thisScore*padding));    //write every score at the right place depending on its index in the array
    }
  }
  void loadBestScores()
  {
    String[] stringBestScores = loadStrings("best_5_scores.txt");              //load each score as a string
    for (int thisScore = 0; thisScore < 5; thisScore++)
    {
      float floatScore = Float.parseFloat(stringBestScores[thisScore]);        //parse it to a float
      leaderboard.bestFiveScores[thisScore] = floatScore;                      //put it in the best scores array at the right index
    }
  }
}