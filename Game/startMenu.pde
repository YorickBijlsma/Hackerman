void startScreen()
{
  if (playingMenu == false)
  {
    menu.play();
    playingMenu = true;
  }
  blockAnimation(entryScreen, 0, 0);
  if (keysPressed['Z'])
  {
    menu.stop();
    gameState = 1;
    gamestart.play();
    mainsong.play();
  }
  if (frameCount % 60 == 0)
  {
    timer++;
  }
  if (keysPressed['X'] && (timer >= 3))
  {
    gameState = 3;
  }
}

void deathScreen()
{
  if(keysPressed['Z'])
  {
    clearCoordinates();
    restartGame();
    gameState = 1;
  }

  if(keysPressed['X']) 
  {
    playingMenu = false;
    timer = 0;
    gameState = 0; 
  }
  slideFromTopAnimation(deathScreen, 0, 0);
  //println(gameState);
  if (stretchCounter > height-10)  //check if the animation is almost done, if so, display the score
  { 
    
    fill(hackerGreen); 
    textSize(56);
    text((int)score.totalScore, 420, 643);
    leaderboard.drawScores(911, 190, 38, hackerGreen, 28);
  }
}