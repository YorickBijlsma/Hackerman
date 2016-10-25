void drawEnvironment()
{
  for(float[] c : puzzleCoords)
  {
   rect(c[0],c[1],c[2],c[3]);
  }
}