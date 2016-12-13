void runGame()
{
  switch(gameState)
  {
    case 0:
      startScreen();
      break;
    case 1:
      playGame();
      break;
    case 2:
      exit();
      break;
  }
}  

void playGame()
{
  drawGame();
  updateGame();
}

void updateGame()
{
  updateKeys();

  if (!player.done)      //if player isn't done yet, keep updating
  {
    updateClock();
    player.update();
    for             (Worm everyWorm : worms)     everyWorm    .update();
    for            (Virus everyVirus : vira)     everyVirus   .update(); 
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
  drawEnvironment(); //draw the environment under all other things in the room    
  player.draw();
  drawClock();  
  
  

  //draw all enemies
  for             (Worm everyWorm : worms)    everyWorm   .draw();
  for            (Virus everyVirus : vira)    everyVirus  .draw();
  for    (Package everyPackage : packages)    everyPackage.draw();
  for  (EnemyAdware everyAdware : adwares)    everyAdware .draw();
  for    (Malware everyMalware : malwares)    everyMalware.draw();
  for                   (Ad everyAd : ads)    everyAd     .draw();
  playerDamageParticle.draw();
  if (player.health > 0) drawHUD();
}