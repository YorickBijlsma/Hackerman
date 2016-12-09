void updateGame()
{
  updateKeys();

  if (!player.done)      //if player isn't done yet, keep updating
  {
    updateClock();
    player.update();
    for            (Worm everyWorm : worms)     everyWorm   .update();
    for      (EnemyDOT iEnemy : DOTenemies)     iEnemy      .update(); 
    for (EnemyAdware everyAdware : adwares)     everyAdware .update();
    for   (Package everyPackage : packages)     everyPackage.update();
    for   (Malware everyMalware : malwares)     everyMalware.update();
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
  for            (Worm everyWorm : worms)    everyWorm   .draw();
  for    (EnemyDOT everyDOT : DOTenemies)    everyDOT    .draw();
  for   (Package everyPackage : packages)    everyPackage.draw();
  for (EnemyAdware everyAdware : adwares)    everyAdware .draw();
  for   (Malware everyMalware : malwares)    everyMalware.draw();
  for                  (Ad everyAd : ads)    everyAd     .draw();
  if (player.health > 0) drawHUD();
}