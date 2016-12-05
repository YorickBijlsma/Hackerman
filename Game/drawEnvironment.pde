void drawEnvironment()
{
  if(player.done) fill(green);
  else            fill(blue);
  for(float[] c : puzzleCoords) //draw the puzzle
  {
   rect(c[0],c[1],c[2],c[3]);
  }
  
  color brown = color(139,69,19);  fill(brown);
  for(float[] c : wallCoords) //draw the walls
  {
    rect(c[0],c[1],c[2],c[3]);
  }
}