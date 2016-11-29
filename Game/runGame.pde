void updateGame()
{
  player.update();
  for(Worm everyWorm : worms)
  {
    everyWorm.update();
  }
  checkAllCollisions();

  updateKeys();
}

void drawGame()
{
  background(0);
  noStroke();
  
  player.draw();
  for (Worm everyWorm : worms)
  {
    everyWorm.draw();
  }
  drawEnvironment();
}