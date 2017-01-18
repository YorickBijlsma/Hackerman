class Score
{
  float totalScore = 0; //was 0
  float oldScore = 0;
  int numberOfScores = 0;
  float scorePoints = 20;
  float totaltime = secondsCounter;
  float timePoints;
  float healthpoints = health/10;
  boolean calculatedThisLevel = false;

  float calculateScore()
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
  int x, y, padding;

  void drawScores(int x, int y, int padding, color colour, int textSize)
  {
    fill(colour);
    
    textSize(textSize);
    for (int thisScore = 0; thisScore < 5; thisScore++)
    {
      text(thisScore+1+":" + (int)bestFiveScores[thisScore], x+10,  y + thisScore*padding);    //write every score at the right place depending on its index in the array
    }
  }
  void drawScoresPlaque(int x, int y)
  {
    image(leaderboardImage, x, y);
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