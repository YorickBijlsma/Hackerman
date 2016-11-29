void updateGame()
{
  player.update();
  for(Worm everyWorm : worms)
  {
    everyWorm.update();
  }
  for (EnemyDOT iEnemy : DOTenemies)
  {
    iEnemy.update(); 
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
  for (EnemyDOT iEnemy : DOTenemies)
  {
    iEnemy.draw(); 
  }
  for (Package everyPackage : packages)
  {
    everyPackage.draw();
  }
  
  drawEnvironment();
  
  fill(player.healthColour);
  text("Health: " + player.health, 10, 30);
}

void setupGame()
{
  for (int iEnemy=0; iEnemy<nEnemies; iEnemy++)
  {
    EnemyDOT anEnemy = new EnemyDOT();
    anEnemy.init();
    DOTenemies.add(anEnemy);
  }
  
  Worm newWorm = new Worm(250, 200);
  newWorm.dir = LEFT;
  worms.add(newWorm);
  
}