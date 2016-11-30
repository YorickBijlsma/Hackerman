class Worm
{
  int x, y;
  int moveSpeed = 3;
  int dir = RIGHT;
  int nextXposition, nextYposition = 0;

  int segments = 1;
  int segmentSize = 5;
  float headSize = segmentSize * 1.3;
  int maxSegments = 100;
  float size;                        //placeholder variable for black magic

  int segmentationTime = 5;         //every segmentationTime amount of frames, a new segment is added (the worm grows bigger)
  int segmentCounter = 0;            //count every frame for duplication purposes

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

    if (x+segmentSize > width)    dir = LEFT;      //reverse direction if either side of screen is hit
    if (x-segmentSize < 0)        dir = RIGHT;
    if (y+segmentSize > height)   dir = DOWN;
    if (y-segmentSize < 0)        dir = UP;

    if (hitsWall())
    {
      segments = 3;
      if (dir == LEFT) dir = RIGHT;
      else if (dir == RIGHT) dir = LEFT;
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
  }



  boolean hitsWall()
  {
    switch(dir)
    {
    case LEFT:
      nextXposition = x - moveSpeed; 
      break;
    case RIGHT:
      nextXposition = x + moveSpeed; 
      break;
    }
    for (float[] c : wallCoords)
    {
      float otherX = c[0];
      float otherY = c[1];
      float otherW = c[2];
      float otherH = c[3];

      if(     x <= otherX + otherW    &&      //there's a wall to the left
              x >= otherX             &&      //to the right
              y <= otherY + otherH    &&      //above
              y >= otherY             )       //below
              return true;                    //collision!
    }   
    return false;                             //no wall where we want to move!
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
  int amountOfAds = 10;
  float speed = 5;
  float xsp = speed; 
  float ysp = speed;

  int adAmount = 10;
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
    size(1000, 600);
  }

  void MoveAdware()
  {
    x += xsp;
    y += ysp;
    //TODO movement, does not bounce
    if (x > width - w) 
    {
      xsp = -speed;
    }

    if (x < 0)
    {
      xsp = speed;
    }

    if (y > height - h)
    {
      ysp = -speed;
    }

    if (y < 0) 
    {
      ysp = speed;
    }
  }

  void update()
  {
    MoveAdware();
    color(colour);
    stroke(255, 100, 0);
    //rectMode(CENTER);
    rect(x, y, w, h);
  }

  void BurstAdware()
  {
    //randomizing size and location
    for (int i = 0; i <= amountOfAds; i++)
    {
      burstSize[i] = random(60, 160);
      burstLocationX[i] = 10 * (random(100));
      burstLocationY[i] = 10 * (random(57));
    }
    for (int i = 0; i <= amountOfAds; i++)
    {
      rect(burstLocationX[i], burstLocationY[i], burstSize[i], burstSize[i]);
    }
  }

  void PopUpRandomizer()
  {
  }

  void draw()
  {
    PopUpRandomizer(); 
    //noLoop();
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
}