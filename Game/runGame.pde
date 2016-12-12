void runGame()
{
  if(keysPressed['Z']) showStartScreen = false;    //press Z to start
  if(showStartScreen) image(entryScreen,0,0);      //show start screen if z not yet pressed this game
  
  else                                             //if Z was pressed, start updating and drawing the 1st level (which has already been loaded in setup())
  {
    
    drawGame();
    updateGame();
    
  }
}

void updateGame()
{
  updateKeys();

  if (!player.done)      //if player isn't done yet, keep updating
  {
    updateClock();
    player.update();
    for             (Worm everyWorm : worms)     everyWorm    .update();
    for       (EnemyDOT iEnemy : DOTenemies)     iEnemy       .update(); 
    for  (EnemyAdware everyAdware : adwares)     everyAdware  .update();
    for    (Package everyPackage : packages)     everyPackage .update();
    for    (Malware everyMalware : malwares)     everyMalware .update();
    playerDamageParticle.update();
  }
  else if (player.done)
  {
    doneRoutine();                //otherwise do the done routine
  }
}

void drawGame()
{
  background(0);
  noStroke();
  drawEnvironment();                                                     //draw the environment under all other things in the room
  player.draw(); 
  

  //draw all enemies
  for             (Worm everyWorm : worms)    everyWorm   .draw();
  for     (EnemyDOT everyDOT : DOTenemies)    everyDOT    .draw();
  for    (Package everyPackage : packages)    everyPackage.draw();
  for  (EnemyAdware everyAdware : adwares)    everyAdware .draw();
  for    (Malware everyMalware : malwares)    everyMalware.draw();
  for                   (Ad everyAd : ads)    everyAd     .draw();
  playerDamageParticle.draw();
  if (player.health > 0) drawHUD();
}