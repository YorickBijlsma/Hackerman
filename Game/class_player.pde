class Player
{
  float reqX, reqY;
  float mainX, mainY, mainW, mainH;
  float xsp, ysp = 0;
  float speed = 1;
  float angle = 0;
  boolean done = false;
  boolean beatGame = false;
  boolean collidesWithWall = false;
  boolean u, d, l, r = false;
  
  
  color colour = color(0,0,255);
  float[][] restCoords = {{0.0}};
  
  void draw()
  {
    fill(colour);
    rect(mainX,mainY,mainW,mainH);   //draw the main block
    for(float[] c : restCoords)
    {
      if(!isEmpty(c))
      {
        fill(colour);
        rect(c[0],c[1],c[2],c[3]);   //draw the other blocks
      }
    }
    
    //move if not colliding with wall
    //if(!collidesWithWall) update();
    
    if(checkDone()) done = true;     //check if puzzle is completed
  }
  
  void update()
  {
    //mainX += xsp;                    //move the main block
    //mainY += ysp;
    xsp *= 0.1;
    ysp *= 0.1;
    
    //if(!collidesWithWall)
    
      if(keysPressed[LEFT]   && !l)
      {
       xsp = -1;

      }  
      if(keysPressed[RIGHT]  && !r)
      {
        xsp = 1;
      }
      if(keysPressed[UP]     && !u)     ysp = -1;
      if(keysPressed[DOWN]   && !d)     ysp = 1;
      
      if(keysPressed[SHIFT])
      {
        EnemyWorm newWorm = new EnemyWorm(600,200);     //print('h');
        worms.add(newWorm);
      }
             if(r) r = false;
             if(l) l = false;
             if(u) u = false;
             if(d) d = false;
    
    
    mainX += xsp * speed;
    mainY += ysp * speed;
    
    mainX = constrain(mainX, 0, width-mainW);
    mainY = constrain(mainY,0, height-mainH);
    /*
    for(float[] c : restCoords)
    {
      c[0] += xsp;                   //then move all the others
      c[1] += ysp;
    }
    xsp = 0;                         //done moving 1 gridline
    ysp = 0;                         //so stop us moving
    */
  }
    
    
  
   void overlapsWall(float[] c)
  {
    float otherX = c[0];
    float otherY = c[1];
    float otherW = c[2];
    float otherH = c[3];

     //which side we collide on


        if
        (
          mainX + mainW >= otherX                       && 
          mainX <= otherX + otherW                      && 
          mainY + mainH >= otherY                       &&
          mainY <= otherY + otherH
         )
         {
            //collidesWithWall = true;
            
            if(mainX == otherX + otherW) l = true; else l = false;
            if(mainX + mainW == otherX) r = true; else r = false; //!!works
            
            if(mainY + mainH <= otherY) u = true; else u = false;
            if(mainY >= otherY + otherH) d = true; else d = false;
            
         }
        //else l = false; r = false; u = false; d = false;
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