class Player
{
  float reqX, reqY;
  float mainX, mainY, mainW, mainH;
  float xsp, ysp = 0;
  float speed = 50;
  float angle = 0;
  boolean done = false;
  boolean beatGame = false;
  
  color colour = color(0,0,255);
  float[][] restCoords = {{0.0}};
  
  void makeRects()
  {
    fill(colour);
    mainX += xsp;                    //move the main block
    mainY += ysp;
    rect(mainX,mainY,mainW,mainH);   //draw the main block
    for(float[] c : restCoords)
    {
      if(!isEmpty(c))
      {
        c[0] += xsp;                 //then move all the others
        c[1] += ysp;
        fill(colour);
        rect(c[0],c[1],c[2],c[3]);   //then draw them too
      }
    }
    xsp = 0;                         //done moving 1 gridline
    ysp = 0;                         //so stop us moving
    
    if(checkDone()) done = true;     //check if puzzle is completed
  }
  
    void keyReleased()
    {
      if (keyCode == DOWN)    ysp = speed;
      if (keyCode == UP)      ysp = -speed;
        
      if (keyCode == LEFT)    xsp = -speed;
      if (keyCode == RIGHT)   xsp = speed;
      
      keyCode = ALT;      //reset keyCode to something that doesn't make you move, so that you don't keep on moving on indefinitely
    }
    //else{ysp = 0; xsp = 0;}
    void keyPressed()
    {
              
     if (key == 'z')         angle -= 45;
     if (key == 'x')         angle += 45;
      key = 'q';
    }
  
  
  
  boolean checkDone()
  {
    if(mainX == reqX && mainY == reqY)
    {
      return true;
    }
    else{return false;}
  }
}