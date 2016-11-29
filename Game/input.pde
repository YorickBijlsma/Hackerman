boolean[] keysPressed = new boolean[2560]; //a slot for every key you can press
boolean [] lastFrameKeysPressed = new boolean[2560]; //remember which keys were pressed last frame

void updateKeys()
{
  for (int iKey=0; iKey<keysPressed.length; iKey++)
  {
    lastFrameKeysPressed[iKey] = keysPressed[iKey];
  }
}

void keyPressed()
{        
  keysPressed[keyCode] = true;
}
void keyReleased()
{
  keysPressed[keyCode] = false;
}