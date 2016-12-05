void updateGame()
{
  updateKeys();
  updateClock();
  
  player.update();
  for            (Worm everyWorm : worms)     everyWorm   .update();
  for      (EnemyDOT iEnemy : DOTenemies)     iEnemy      .update(); 
  for (EnemyAdware everyAdware : adwares)     everyAdware .update();
  for   (Package everyPackage : packages)     everyPackage.update();
  for   (Malware everyMalware : malwares)     everyMalware.update();
}

void drawGame()
{
  background(0);
  noStroke();
  drawEnvironment();                                                     //draw the environment under all other things in the room
  player.draw(); 
  
  //draw all enemies
  for            (Worm everyWorm : worms)    everyWorm   .draw();
  for    (EnemyDOT everyDOT : DOTenemies)    everyDOT    .draw();
  for   (Package everyPackage : packages)    everyPackage.draw();
  for (EnemyAdware everyAdware : adwares)    everyAdware .draw();
  for   (Malware everyMalware : malwares)    everyMalware.draw();
  
  
  
  if(player.health > 0) drawHUD();
}

void setupGame()
{
  /*
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
  */
  
}