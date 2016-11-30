void updateGame()
{
  updateKeys();
  
  player.update();
  for(Worm everyWorm : worms)
  {
    everyWorm.update();
  }
  for (EnemyDOT iEnemy : DOTenemies)
  {
    iEnemy.update(); 
  }
  for (EnemyAdware everyAdware : adwares)
  {
    everyAdware.update();
  }
  
  
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
  for (EnemyAdware everyAdware : adwares)
  {
    everyAdware.draw();
  }
  
  drawEnvironment();
  
  fill(player.healthColour);
  text("Health: " + player.health, 10, 30);
}

void setupGame()
{
  for (int iEnemy=0; iEnemy<nEnemies; iEnemy++)
  {
    EnemyDOT anEnemy = new EnemyDOT(200,200);
    DOTenemies.add(anEnemy);
  }
  
  Worm newWorm = new Worm(250, 200);
  newWorm.dir = LEFT;
  worms.add(newWorm);
  
  EnemyAdware adware = new EnemyAdware(100,300);
  adwares.add(adware);
  
}