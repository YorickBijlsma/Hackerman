void startScreen()
{
  if (playingMenu == false)
  {
   menu.loop();
   playingMenu = true;
  }
  blockAnimation(entryScreen,0,0);
  if (keysPressed['Z'])
  {
    menu.stop();
    gameState = 1;
    gamestart.play();
    mainsong.play();
  }
  if (keysPressed['X'])
  {
    gameState = 2;
  }
}