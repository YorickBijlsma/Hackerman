void drawEnvironment()
{
  PImage puzzleSprite = (player.done)? playerSpriteDone: playerSpriteNormal;
 
  for(float[] c : puzzleCoords) //draw the puzzle
  {
   //rect(c[0],c[1],c[2],c[3]);
    int puzzleX = (int) c[0];
    int puzzleY = (int) c[1];
    int puzzleW = (int) c[2];
    int puzzleH = (int) c[3];
    image(puzzleSprite.get(0, 0, puzzleW, puzzleH),
          puzzleX, puzzleY, puzzleW, puzzleH);
  }
  
  color brown = color(139,69,19);  fill(brown);
  for(float[] c : wallCoords) //draw the walls
  {
    int thisWallX = (int) c[0];
    int thisWallY = (int) c[1];
    int thisWallW = (int) c[2];
    int thisWallH = (int) c[3];
    
    //rect(wallX,wallY,wallW,wallH);
    
    wallSprite = wallSpritesheet.get(thisWallX, thisWallY, thisWallW, thisWallH);
    image               (wallSprite, thisWallX, thisWallY, thisWallW, thisWallH);
  }
}