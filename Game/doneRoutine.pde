void doneRoutine()
{
  if(player.done)
  {
    int addedPoints = 0;
    addedPoints++;
    if(addedPoints < levelWait/1.5) score.totalScore++;
    //score.berekenScore();
    player.colour = color(0,255,0);   //set colour to green
    player.xsp = 0;                   //freeze player
    player.ysp = 0;
    packages.clear();
    resetClock();
    
    //this suspends progressing to the next level for the number of frames in levelWait
    stall++;
    if(stall>=levelWait)             //wait before going to next level
    {
      stall = 0;
      //File f = new File("data/" + levelNumber + "/lvl_" + levelNumber + "_player.txt");                                             //make a file object to test if the next level exists
      loadLevel(levelNumber);     
      text("You have beaten the game, I guess. Grats.",0,0);
    }
  }
}