class Worm
{
  float x, y;
  float moveSpeed = 3;
  int dir = RIGHT;
  float nextXposition, nextYposition = 0;

  int segments = 1;
  int segmentSize = 5;
  float headSize = segmentSize * 1.3;
  int maxSegments = 100;
  float size;                        //placeholder variable for black magic

  int segmentationTime = 5;         //every segmentationTime amount of frames, a new segment is added (the worm grows bigger)
  int segmentCounter = 0;            //count every frame for duplication purposes
  int damage = 1;

  public Worm(int x, int y)
  {
    this.x = x;
    this.y = y;
  }

  void draw()
  {
    for (int i = 0; i < segments; i++)
    {
      if (i==0)        fill(color(240, 0, 240));           //make the head (first segment) a unique colour
      else                                          
      {  
         if (i%2==0)   fill(color(244, 164, 96));    
         else          fill(color(205, 133, 63));          //segments are alternated between 2 colours
      }

      size = (i == 0) ? headSize : segmentSize;           //draw the head bigger
      

      if (dir == LEFT)  ellipse(x + (i*segmentSize), y, size, size);  //draw additional segments to the right of the head
      if (dir == RIGHT) ellipse(x - (i*segmentSize), y, size, size);  //draw additional segments to the left of the head
      if (dir == DOWN)  ellipse(x, y + (i*segmentSize), size, size);
      if (dir == UP)    ellipse(x, y - (i*segmentSize), size, size);
    }
  }

  void update()
  {
    segmentCounter++;
    if (segments <= maxSegments)
    {
      if (segmentCounter > segmentationTime)
      {
        segments++;
        segmentCounter = 0;
      }
    } else segmentCounter = 0;

    

    if(bounceOffWall(x,y) || bounceOffScreenEdge())//if (hitsWall())
    {
      segments = 3;
      if(bounceOffWall(x,y))
      {
        if (dir == LEFT) dir = RIGHT;
        else if (dir == RIGHT) dir = LEFT;
      }
    }

    switch(dir)
    {
    case LEFT:                  //move left
      x -= moveSpeed; 
      break;
    case RIGHT:                 //move right
      x += moveSpeed; 
      break;  
    case DOWN:
      y -= moveSpeed; 
      break;
    case UP:
      y += moveSpeed; 
      break;
    default:
      break;
    }
    if (damagePlayer(x,y,damage)) player.hit = true;
    else                          player.hit = false;
    
  }
  
  boolean bounceOffScreenEdge()
  {
    if (x+segmentSize > width)
    {
      dir = LEFT;
      return true;
    }
    if (x-segmentSize < 0)
    {
      dir = RIGHT;
      return true;
    }
    if (y+segmentSize > height)
    {
      dir = DOWN;
      return true;
    }
    if (y-segmentSize < 0)
    {
      dir = UP;
      return true;
    }
    return false;
  }
}
/*
//////////////////////////////////////////////
end of worm class
//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////
begin of adware class
//////////////////////////////////////////////
*/

class EnemyAdware
{
  float x = 10;
  float y = 10;
  float w = 20;
  float h = 20;
  int amountOfAds = 1000;
  float speed = 3;
  float xsp = speed; 
  float ysp = speed;
  int damage = 0;
  float originalSpeed = speed;

  int adAmount = amountOfAds;
  color colour = color(70, 215, 240);
  //arrays to assign ad amount, size and location on the screen
  float[] burstSize = new float[adAmount];
  float[] burstLocationX = new float[adAmount];
  float[] burstLocationY = new float [adAmount];

  public EnemyAdware (int x, int y)
  {
    this.x = x;
    this.y = y;
  }

  void setup()
  {
    //size(1000, 600);
  }

  void stayInScreen()
  {
    if (x > width - w)    xsp = -speed;
    if (x < 0)            xsp = speed;
    if (y > height - h)   ysp = -speed;
    if (y < 0)            ysp = speed;
  }

  

  void update()
  {
    stayInScreen();
    if(bounceOffWall(x,y))
    {
      if(xsp < 0) xsp = speed; else xsp = -speed;
      if(ysp < 0) ysp = speed; else ysp = -speed;
    }
    x += xsp;
    y += ysp;
    //if(overlapsPlayer(x, y)) player.health -= 1;
    if (damagePlayer(x,y,damage))
    {
      player.hit = true;
      burstAdware();
    }
    else player.hit = false;
  }

  void burstAdware()
  {
    speed = 0;
    player.speed = 0;
    //randomizing size and location
    for (int i = 0; i < amountOfAds; i++)
    {
      burstSize[i]      =    random(60, 160);
      burstLocationX[i] = 10 *  (random(100));                //this part can be more efficient
      burstLocationY[i] = 10 *  (random(57));
    }
    for (int i = 0; i < amountOfAds; i++)                    //this for loop isn't needed
    {
      rect(burstLocationX[i], burstLocationY[i], burstSize[i], burstSize[i]);
    }
    speed = originalSpeed;
    player.speed = player.originalSpeed;
  }

  void PopUpRandomizer()
  {
  }

  void draw()
  {
    fill(colour);                                                  //stroke(255, 100, 0);
    rect(x, y, w, h); 
    //noLoop();                                                    //i greyed out the noLoop as it stopped the game loop
  }                                                                
}

class EnemyDOT
{
  float x,  y;
  float vx, vy;
  float diameter = 45;

  color fillColor = color(255, 0, 0);
  int teller = 0;
  float draw = 0;
  int i = 0;
  
  public EnemyDOT(float x, float y)
  {
    this.x = x;
    this.y = y;
    
    vx = random(-3.0, 3.0);
    vy = random(-3.0, 3.0);
  }
  // The init method can be called to set an enemy to it's default stat
  // Whenever you want to update an enemy, call this method
  void update()
  {    
    // use the velocity to calculate the new position
    float ownWidth = x + diameter;
    float ownHeight = y + diameter;
    if(overlapsPlayer(x,y)) player.health -= 1;
    x += vx;
    y += vy;

    // Detect wether the enemy bounces against the edges of the window
    // and change the direction if they do
    if ((x > width-diameter/2) || (x < diameter/2)) vx = -vx;
    if ((y > height-diameter/2) || (y < diameter/2)) vy = -vy;
    teller++;  

    if (teller >= 150 && i!=5)
    {
      i++;

      // Instanciate a specific enemy
      Package aPackage = new Package();
      // set its properties to default values 
      aPackage.init(x, y);
      // add the enemy to the array
      packages.add(aPackage);

      System.out.println("ready" + i);
      teller = 0;
    }
  }

  // Whenever you want to draw the enemy, call this method
  void draw() {
    fill(fillColor);
    ellipse(x, y, diameter, diameter);
  }

  // Use this method to check wether a player overlaps with the enemy
  /*boolean overlapsPlayer(Player somePlayer){
   // Calculate the distance between the player and an enemy
   float a = x-somePlayer.x,  // horizontal distance between player and enemy
   b = y-somePlayer.y,  // vertical distance between player and enemy
   c = sqrt(a*a + b*b); // diagonal distance between player and enemy
   // if distance < radii combined, they overlap
   return c < (diameter/2 + somePlayer.diameter/2); */
}

class Package
{
  float vx, vy;
  float x, y;
  float diameter;
  color fillColor;
  int teller = 0;
  float damage = 0.3;
  int infectCounter = 0;
  boolean infected = false;
  int infectTime = 35;

  void init(float x, float y)
  {
    // The size of an enemy varies
    diameter = 20;
    fillColor = color(255, 255, 255);
    this.x = x;
    this.y = y;
  }
  void draw()
  {
    fill(fillColor);
    rect(x, y, diameter, diameter);
  }
  void update()
  {/*
    damageCounter++;
    if(damageCounter == 10)
    {
      damagePlayerDoT(x,y,damage);
      damageCounter = 0;

    }
    */
    
    if (overlapsPlayer(x,y)) infected = true;
    damagePlayerDoT(x,y,damage);
  }
  
  boolean damagePlayerDoT(float x, float y, float damage)
  {
    /*
    if(overlapsPlayer(x,y))
    {
      for(int i=0; i<1; i++)
      {
        player.health -= 0.3;
      }
      return true;
    }*/
    if(infected)
    {
      infectCounter++;
      if(infectCounter >= infectTime) infected = false;
      player.health -= damage;
    }
    return false;
  }
}