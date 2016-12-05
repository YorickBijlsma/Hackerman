void clearCoordinates()
{
  player.mainX = 0;
  player.mainY = 0;
  player.mainW = 0;
  player.mainH = 0;
  for(float[] c : wallCoords)
  {
     c[0] = 0.0; c[1]= 0.0; c[2] = 0.0; c[3]= 0.0;
  }
  for(float[] c : puzzleCoords)
  {
     c[0] = 0.0; c[1]= 0.0; c[2] = 0.0; c[3]= 0.0;
  }
  for(float[] c : enemyCoords)
  {
    c[0] = 0.0; c[1] = 0.0;
  }
  worms       .clear();
  adwares     .clear();
  DOTenemies  .clear();
  packages    .clear();
  malwares    .clear();
}