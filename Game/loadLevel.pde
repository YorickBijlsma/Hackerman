void loadLevel(int num) //)
{
  String fileName = "data/"+num+"/lvl_"+num;
  File directory = new File(dataPath(""+num));
  //remove all data from previous level
  clearCoordinates();
  resetClock();
  worms     .clear();
  adwares   .clear();
  DOTenemies.clear();
  ads       .clear();
  player.hit = false;

  if (directory.exists())
  {
    int restBlocks = 0;
    int puzzleBlocks = 0;
    int wallBlocks = 0;
    int enemyAmount = 0;

    String varsPlayer [] = {};
    String varsPuzzle [] = {};
    String varsWalls  [] = {};
    String varsEnemies[] = {};

    varsPlayer = loadStrings(fileName+"_player.txt");
    varsPuzzle = loadStrings(fileName+"_puzzle.txt");
    varsWalls =  loadStrings(fileName+"_walls.txt");
    varsEnemies =  loadStrings(fileName+"_enemies.txt");

    float[][] restCoords = new float[8][4];

    player.reqX = Float.parseFloat(varsPlayer[0]);
    player.reqY = Float.parseFloat(varsPlayer[1]);

    player.mainX = Float.parseFloat(varsPlayer[2]);
    player.mainY = Float.parseFloat(varsPlayer[3]);
    player.mainW = Float.parseFloat(varsPlayer[4]);
    player.mainH = Float.parseFloat(varsPlayer[5]);

    // get remaining player coordinates from player variables array (was 38)
    for (int i = 6; i < varsPlayer.length; i+=4)
    {
      try
      {
        float x = Float.parseFloat(varsPlayer[i]);
        //print(x);
        float y = Float.parseFloat(varsPlayer[i+1]);
        float w = Float.parseFloat(varsPlayer[i+2]);
        float h = Float.parseFloat(varsPlayer[i+3]);
        float[] coords = {x, y, w, h};
        if (!isEmpty(coords))
        {
          restCoords[restBlocks] = coords;
          restBlocks++;
          //coords[listIndex] = Float.parseFloat(vars[i]);
        }
      }
      catch(ArrayIndexOutOfBoundsException e)
      {
        break;
      }
    }
    player.restCoords = restCoords;

    //get puzzle blocks from puzzle variable array
    for (int j = 0; j < varsPuzzle.length; j+=4)
    {
      float blockX = Float.parseFloat(varsPuzzle[j]);
      float blockY = Float.parseFloat(varsPuzzle[j+1]);
      float blockW = Float.parseFloat(varsPuzzle[j+2]);
      float blockH = Float.parseFloat(varsPuzzle[j+3]);
      float[] blockCoords = {blockX, blockY, blockW, blockH};
      if (!isEmpty(blockCoords))
      {
        puzzleCoords[puzzleBlocks] = blockCoords;
        puzzleBlocks++;
      }
    }

    //get wall blocks from wall variable array
    for (int k = 0; k < varsWalls.length; k+=4)
    {
      float wallX = Float.parseFloat(varsWalls[k]);
      float wallY = Float.parseFloat(varsWalls[k+1]);
      float wallW = Float.parseFloat(varsWalls[k+2]);
      float wallH = Float.parseFloat(varsWalls[k+3]);
      float[] wallStats = {wallX, wallY, wallW, wallH};
      if (!isEmpty(wallStats))
      {
        wallCoords[wallBlocks] = wallStats;
        wallBlocks++;
      }
    }

    for (int l = 0; l < varsEnemies.length; l+=2)
    {
      int enemyX = (int)Float.parseFloat(varsEnemies[l]);
      int enemyY = (int)Float.parseFloat(varsEnemies[l+1]);
      int amountOfEnemies = 3;
      float[] enemyStats = {enemyX, enemyY};

      if (!isEmpty(enemyStats))
      {
        int range = (amountOfEnemies - 0) + 1;
        int enemyType = (int)(Math.random() * range) + 0;

        switch(enemyType)  //spawn an enemy
        {
        case 0:
          Worm newWorm = new Worm(enemyX, enemyY);
          worms.add(newWorm);
          break;

        case 1:
          EnemyAdware newAdware = new EnemyAdware(enemyX, enemyY);
          adwares.add(newAdware);
          break;

        case 2:
          EnemyDOT newDOT = new EnemyDOT(enemyX, enemyY);
          DOTenemies.add(newDOT);
          break;  

        case 3:
          Malware newMalware = new Malware(enemyX, enemyY);
          malwares.add(newMalware);
        }
        enemyAmount++;
      }
    }


    player.done = false;
    score.calculatedThisLevel = false;
    levelNumber++;
    //debug line       for(float[] coords : enemyCoords) for(float coord : coords) println(coord);
    //println(enemyCoords.length);
  } else
  {
    //do nothing, as the next level doesn't exist
  }
}

void restartGame()
{
  //restart the game
  //leaderboard.lastFiveScores[score.numberOfScores] = score.totalScore;
  //recentScoresWriter = createWriter(bestScoresEver);
  for (int i = 0; i < 5; i++)
  {
    float everyScore = leaderboard.lastFiveScores[i];
    if (score.totalScore > everyScore)
    {
      for (int j=4; j>=max(i, 1); j--)
      {
        leaderboard.lastFiveScores[j] = leaderboard.lastFiveScores[j-1];
      }
      leaderboard.lastFiveScores[i] = score.totalScore;
      break;
    }
  }

  //recentScoresWriter.close();
  levelNumber = 1;
  loadLevel(levelNumber);
  player.beatGame = false;
  player.done = false;
  player.health = player.originalHealth;
  resetClock();
  score.totalScore = 0;
}

void saveBestScores()
{
  for (float currentScore : leaderboard.lastFiveScores)
  {
    //println(currentScore);
    //recentScoresWriter.println(currentScore);    //NPE
    recentScoresWriter.flush();
  }
  //recentScoresWriter.close();
}