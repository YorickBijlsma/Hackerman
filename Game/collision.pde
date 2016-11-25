void checkAllCollisions()
{
  for (float[] c : wallCoords)
  {
    player.overlapsWall(c);// player.collidesWithWall = true;
  }
}