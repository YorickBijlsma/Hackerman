void startScreen()
{
  image(entryScreen,0,0);
  if (keysPressed['Z'])
  {
    gameState = 1;
  }
  if (keysPressed['X'])
  {
    gameState = 2;
  }
}