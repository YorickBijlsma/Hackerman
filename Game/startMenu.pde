void startScreen()
{
  if (playingMenu == false)
  {
    menu.loop();
    playingMenu = true;
  }
  blockAnimation(entryScreen, 0, 0);
  if (keysPressed['Z'])
  {
    menu.stop();
    gameState = 1;
    //gamestart.play();
    //mainsong.play();
  }
  if (keysPressed['X'])
  {
    gameState = 3;
  }
}

void deathScreen()
{
  slideFromTopAnimation(deathScreen, 0, 0);
  println(gameState);
  if (stretchCounter > height-10)  //check if the animation is almost done, if so, display the score
  { 
    color hackerGreen = color(125, 255, 45);
    fill(hackerGreen); 
    textSize(56);
    text((int)score.totalScore, 420, 645);
    leaderboard.drawScores(911, 190, 38, hackerGreen, 28);
  }
}