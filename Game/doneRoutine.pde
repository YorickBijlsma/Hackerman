void doneRoutine()
{
  if(player.done)
  {

    image(puzzleDoneSprite,0,0);
    player.colour = color(0,255,0);   //set colour to green
    
    score.berekenScore();
    drawScoreAddition();
    
    //this suspends progressing to the next level for the number of frames in LEVELWAIT
    stall++;
    if(stall>=LEVELWAIT)             
    {
      stall = 0;
      if(levelNumber > AMOUNTOFLEVELS) levelNumber = 1;
      loadLevel(levelNumber);     
    }
  }
}