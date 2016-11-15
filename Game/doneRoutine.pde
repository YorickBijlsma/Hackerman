void doneRoutine()
{
  player.colour = color(0,255,0);   //set colour to green
  player.xsp = 0;                   //freeze player
  player.ysp = 0;
  
  //this suspends progressing to the next level for the number of frames in levelWait
  stall++;
  if(stall>=levelWait)             //wait before going to next level
  {
    stall = 0;
    //File f = new File("data/" + levelNumber + "/lvl_" + levelNumber + "_player.txt");                                             //make a file object to test if the next level exists
    try
    {
        loadLevel(levelNumber);     
    }
    catch(NullPointerException e)
    {
      text("You have beaten the game, I guess. Grats.",0,0);
    }
    //load the next level if it exists
    //else player.beatGame = true;                                                                                                  //if it doesn't, we assume player has beaten the game
  }
}