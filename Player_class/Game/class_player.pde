class Player
{
  
  //float[][] restCoords = new float[vars.length][4];
  
  float reqX, reqY;
  float mainX, mainY, mainW, mainH;
  float xsp, ysp = 0;
  float speed = 20;
  float angle = 0;
  
  color colour = color(0,0,255);
  float[][] restCoords;
  
  void makeRects()
  {
    //rectMode(CENTER);
    //translate(width/2,height/2);
    //rotate(radians(angle));
    fill(colour);
    mainX += xsp;                    //move the main block
    mainY += ysp;
    rect(mainX,mainY,mainW,mainH);   //draw the main block
    for(float[] c : restCoords)
    {
      //print(c[0]);e
      if(!isEmpty(c))
      {
        c[0] += xsp;                 //then move all the others
        c[1] += ysp;
        fill(colour);
        //print(c[0]);
        rect(c[0],c[1],c[2],c[3]);   //then draw them too
      }
    }
    xsp = 0;                         //done moving 1 gridline
    ysp = 0;                         //so stop us moving
  }
  //void controls()
  
    void keyReleased()
    {
      if (keyCode == DOWN)    ysp = speed;
      if (keyCode == UP)      ysp = -speed;
        
      if (keyCode == LEFT)    xsp = -speed;
      if (keyCode == RIGHT)   xsp = speed;
      
      keyCode = ALT;
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