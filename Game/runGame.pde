void updateGame()
{
  player.update();
  for(EnemyWorm everyWorm : worms)
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
  for (EnemyWorm everyWorm : worms)
  {
    everyWorm.draw();
  }
  drawEnvironment();
}