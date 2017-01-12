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
    if(player.health > 0)
    {
      for             (Worm everyWorm : worms)     everyWorm    .update();
      for            (Virus everyVirus : vira)     everyVirus   .update(); 
      for  (EnemyAdware everyAdware : adwares)     everyAdware  .update();
      for    (Package everyPackage : packages)     everyPackage .update();
      for    (Malware everyMalware : malwares)     everyMalware .update();
      playerDamageParticle.update();
    }
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

  //draw all enemies
  if (player.health > 0)
  {
    for             (Worm everyWorm : worms)    everyWorm   .draw();
    for            (Virus everyVirus : vira)    everyVirus  .draw();
    for    (Package everyPackage : packages)    everyPackage.draw();
    for  (EnemyAdware everyAdware : adwares)    everyAdware .draw();
    for    (Malware everyMalware : malwares)    everyMalware.draw();
    for                   (Ad everyAd : ads)    everyAd     .draw();
    drawHUD();
    playerDamageParticle.draw();
  }
  else
  {
    slideFromTopAnimation(deathScreen, 0, 0);
    if (stretchCounter > height-10)  //check if the animation is almost done, if so, display the score
    { 
      fill(red); 
      textSize(68);
      text((int)score.totalScore, 760, 317);
    }
  }
}



void drawEnvironment()
{
  //PImage puzzleSprite = (player.done)? playerSpriteDone: playerSpriteNormal;

  for (float[] c : puzzleCoords) //draw the puzzle
  {
    //rect(c[0],c[1],c[2],c[3]);
    int puzzleX = (int) c[0];
    int puzzleY = (int) c[1];
    int puzzleW = (int) c[2];
    int puzzleH = (int) c[3];
    //image(puzzleSprite.get(0, 0, puzzleW, puzzleH), 
    // puzzleX, puzzleY, puzzleW, puzzleH);
    puzzleSprite = puzzleSpritesheet.get(0, 0, puzzleW, puzzleH);
    image     (puzzleSprite, puzzleX, puzzleY, puzzleW, puzzleH);
  }

  for (float[] c : wallCoords) //draw the walls
  {
    int thisWallX = (int) c[0];
    int thisWallY = (int) c[1];
    int thisWallW = (int) c[2];
    int thisWallH = (int) c[3];
    
    /*int outWallX = thisWallX + 4; //stroke implementation for walls
    int outWallY = thisWallY + 4;
    int outWallW = thisWallW - 8;
    int outWallH = thisWallH - 8;

    //rect(outWallX,outWallY,outWallW,outWallH);
    //fill(55, 255, 255);
    //rect(thisWallX,thisWallY,thisWallW,thisWallH);*/
   
    WallSprite    =    wallSpritesheet.get(thisWallX, thisWallY, thisWallW, thisWallH);
    image                     (WallSprite, thisWallX, thisWallY, thisWallW, thisWallH);
    
  }
}