void clearScreen()
{
  for(float[] c : blockCoords)
  {
    c[0] = 0.0; c[1]= 0.0; c[2] = 0.0; c[3]= 0.0;
  }
}