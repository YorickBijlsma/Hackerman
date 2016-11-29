class Worm
{
  int x, y;
  int moveSpeed = 3;
  int dir = RIGHT;
  int nextXposition, nextYposition = 0;
  
  int segments = 1;
  int segmentSize = 5;
  float headSize = segmentSize * 1.2;
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
    for(int i = 0; i < segments; i++)
    {
      if(i==0) fill(color(240,0,240));         //make the head (first segment) a unique colour
      else                              
      {   
        if(i%2==0) fill(color(244,164,96));    //segments are alternated between 2 colours
        else fill(color(205,133,63));
      }
      
      if(i==0) size = headSize; else size = segmentSize;            //draw the head bigger
      
      if(dir == LEFT)  ellipse(x + (i*segmentSize), y, size, size);  //draw additional segments to the right of the head
      if(dir == RIGHT) ellipse(x - (i*segmentSize), y, size, size);  //draw additional segments to the left of the head
      if(dir == DOWN)  ellipse(x, y + (i*segmentSize), size, size);
      if(dir == UP)    ellipse(x, y - (i*segmentSize), size, size);
      
    }
  }
  
  void update()
  {
    segmentCounter++;
    if(segments <= maxSegments)
    {
      if(segmentCounter > segmentationTime)
      {
        segments++;
        segmentCounter = 0;
      }
    }else segmentCounter = 0;
    
    if(x+segmentSize > width)    dir = LEFT;      //reverse direction if either side of screen is hit
    if(x-segmentSize < 0)        dir = RIGHT;
    if(y+segmentSize > height)   dir = DOWN;
    if(y-segmentSize < 0)        dir = UP;
    
    if(hitsWall())
    {
      segments = 3;
      if(dir == LEFT) dir = RIGHT;
      else if(dir == RIGHT) dir = LEFT;
    }
    
    switch(dir)
    {
      case LEFT:                  //move left
        x -= moveSpeed; break;
      case RIGHT:                 //move right
        x += moveSpeed; break;  
      case DOWN:
        y -= moveSpeed; break;
      case UP:
        y += moveSpeed; break;
      default:
        break;
    }
  }
  
  
  
  boolean hitsWall()
  {
    switch(dir)
    {
      case LEFT:
        nextXposition = x - moveSpeed; break;
      case RIGHT:
        nextXposition = x + moveSpeed; break;
    }
    for (float[] c : wallCoords)
    {
      float otherX = c[0];
      float otherY = c[1];
      float otherW = c[2];
      float otherH = c[3];

      if (x <= otherX + otherW    &&                //there's a wall to the left
          x >= otherX             &&                //to the right
          y <= otherY + otherH    &&                //above player
          y >= otherY)            return true;      //below player
    }
    return false; //no wall where we want to move!
  }
}

class EnemyAdware
{
  
  float x = 10;
  float y = 10;
  float w = 20;
  float h = 20;
  float xsp, ysp; 
  float speed = 10;
  
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
    size(1000,600);
  }
  
  void MoveAdware()
  {
    xsp = speed;
    ysp = 0.1;
    x += xsp;
    y += ysp;
//TODO movement, does not bounce
    if (x > width - w) 
    {
      xsp = -xsp;                 
    }
    
    if (x < 0)
    {
      xsp = -xsp;      
    }
  
    if (y > height - h)
    {
      ysp = -ysp;
    }
    
    if (y < 0) 
    {
      ysp = -ysp;
    }  
  }
    
  void UpdateAdware()
  {
    MoveAdware();
    color(colour);
    stroke(255,100,0);
    rectMode(CENTER);
    rect(x, y, w, h);
  }
  
  void BurstAdware()
  {
    //randomizing size and location
    for (int i = 0; i < 10; i++)
    {
      burstSize[i] = random(60, 160);
      burstLocationX[i] = 10 * (random(100));
      burstLocationY[i] = 10 * (random(57));    
    }
    for (int i = 0; i < 10; i++)
    {
      rect(burstLocationX[i], burstLocationY[i], burstSize[i], burstSize[i]);
    }
   
  }
  
  void PopUpRandomizer()
  {
    
    
  }
      
  void draw()
  {
    UpdateAdware();
    PopUpRandomizer(); 
    noLoop();
  }
}