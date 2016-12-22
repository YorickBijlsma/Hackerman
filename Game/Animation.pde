int stretchCounter,
      blockCounter  
        
        = 0;
        float easeCounter = 0;
        
void blockAnimation(PImage source, int x, int y)
{
  int w = source.width;
  int h = source.height;
  if(frameCount % 4 == 0)
  {
    if(blockCounter <= h)
    {
      blockCounter+= h/25;
    }
  }

  image(
        source.get(0,0,w,blockCounter),
        x, y
       );
  

  /*      
  copy(source,
                     0,0 ,
                     w,h ,
               
                     0, 0, 
                     w, blockCounter
               ); //this is the engine in spritesheet, change the first imageVariable
  
  */
}

void easeLeftAnimation(PImage source, int x, int y)
{
  if(easeCounter < x)
  {
    easeCounter = easeCounter + (x - easeCounter) * 0.10;
  }
  
  image(source, easeCounter, y);
}
/*
float easing = 0.05;
void easeAnimation(
                   int side,   PImage source,
                   int startX, int startY,
                   int endX,   int endY,
                   int x,      int y
                  )
{
  switch(side)
  {
    case LEFT:
      float dx = endX - x;
      x += dx * easing;
      image(source, x, y);
  }
}
*/
void slideFromTopAnimation(PImage source, int x, int y)
{
  int w = source.width;
  int h = source.height;
  y = -height;
  int yPos = y+stretchCounter;
  yPos = constrain(yPos,(y+stretchCounter),0);
  if(stretchCounter < h)
  {
    stretchCounter+=15;
  }
  image(source, x, yPos);
}