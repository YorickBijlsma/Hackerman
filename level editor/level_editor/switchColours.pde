void getKeyboard()
{
  if(keyPressed)
  {
    switch(key)
    {
      //case 'w': colour = color(255,255,255); break;
      case 'b': colour = color(0,0,255); break;
      case 'r': colour = color(255,0,0); break;
      case 'g': colour = color(0,255,0); break;
      case 'c': clearScreen(); break;
    }
    redVal = red(colour);
    greenVal = green(colour);
    blueVal = blue(colour);
  }
}