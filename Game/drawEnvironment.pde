void drawEnvironment()
{
  fill(player.colour);
  for(float[] c : puzzleCoords) //draw the puzzle
  {
   rect(c[0],c[1],c[2],c[3]);
  }
  
  fill(139,69,19);
  for(float[] c : wallCoords) //draw the walls
  {
    rect(c[0],c[1],c[2],c[3]);
  }
}