class HealthPickup
{
  int x,y;
  int speedX,speedY;
  int diameter = 10;
  int healthBonus = 30;
  boolean hit,spawned = false;
  int outScreen = 10000;
  
  public HealthPickup()
  {    
    speedX = calcSpeed();
    speedY = calcSpeed();
    x = width/2;
    y = height/2;  
  }
  
  void update()
  {
    collision();

    //movement
    x = x + speedX;
    y = y + speedY;
    
    //collision Player
    if (overlapsPlayer(x,y))
    {
      hit = true;
    }
    else
    {
      hit = false;  
    }
    if(hit && player.health < player.originalHealth)
    {
      player.health += healthBonus;
      if(player.health > player.originalHealth)
      {
       player.health = player.originalHealth; 
      }
      x = outScreen;
      y = outScreen;
      hit = false;
    }   
      
  }
    void draw()
    {
        fill(255,0,0);
        rectMode(RADIUS);
        rect(x,y,diameter,diameter);  
        //rectMode(CORNER);
  }
  
  int calcSpeed()
  {
    int speed = 0;
    
       speed = (int)random(-1,1);
      while(speed == 0)
      {
        speed = (int)random(-1,1);
      }
      return speed;
  }
  void collision()
  {
    // border
     if (x + diameter > width || x + diameter < 0)
    {
      speedX = speedX *-1;
    }
    if (y + diameter > height || y + diameter < 0)
    {
     speedY = speedY *-1; 
    }
    
    // walls
    
     if (bounceOffWall(x + diameter, y + diameter))
    {
       if(speedX < 0) speedX = speedX *-1; 
       else speedX = speedX *-1;
       
       if(speedY < 0) speedY = speedY *-1; 
       else speedY = speedY *-1;
    }
}
}

/*
 if (bounceOffWall(x, y))
    {
      if (xsp < 0) xsp = speed; 
      else         xsp = -speed;
      if (ysp < 0) ysp = speed; 
      else         ysp = -speed;
    }
*/