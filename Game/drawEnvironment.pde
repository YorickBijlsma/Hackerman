void drawEnvironment()
{
  if(player.done)
  {
    fill(green);
  }
  else
  {
    fill(blue);
  }
  for(float[] c : puzzleCoords) //draw the puzzle
  {
   rect(c[0],c[1],c[2],c[3]);
  }
  
  color brown = color(139,69,19);  fill(brown);
  imageMode(CORNER);
  for(float[] c : wallCoords) //draw the walls
  {
    int thisWallX = (int) c[0];
    int thisWallY = (int) c[1];
    int thisWallW = (int) c[2];
    int thisWallH = (int) c[3];
    
    //rect(wallX,wallY,wallW,wallH);
    
    wallSprite = wallspritesheet.get(thisWallX, thisWallY, thisWallW, thisWallH);
    image               (wallSprite, thisWallX, thisWallY, thisWallW, thisWallH);
  }
}