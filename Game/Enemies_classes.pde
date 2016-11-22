class Worm
{
  int x, y;
  int moveSpeed = 3;
  int dir = RIGHT;
  
  int segments = 1;
  int segmentSize = 10;
  float headSize = segmentSize * 1.2;
  int maxSegments = 10;
  float size;                 //placeholder variable for black magic
  
  int halfLife = 40;        //every halfLife amount of frames, a new segment is added (the worm grows bigger)
  int count = 0;            //count every frame for duplication purposes
  
  public Worm(int x, int y)
  {
    this.x = x;
    this.y = y;
  }
  
  void drawWorm()
  {
    count++; //count ALL the frames!!
    duplicateWorm();
                                                        //stay inside the screen
                                                        if(x+segmentSize > width) dir = LEFT;
                                                        if(x-segmentSize < 0) dir = RIGHT;
    //actually draw the worm
    for(int i = 0; i < segments; i++)
    {
      if(i==0) fill(color(240,0,240));  //make the head (first segment) a unique colour
      else                              //segments are alternated between 2 colours
      {   
        if(i%2==0) fill(color(244,164,96));
        else fill(color(205,133,63));
      }
      
      if(i==0) size = headSize; else size = segmentSize;            //draw the head bigger
      
      if(dir == LEFT)  ellipse(x + (i*segmentSize), y ,size,size);  //draw additional segments to the right of the head
      if(dir == RIGHT) ellipse(x - (i*segmentSize), y ,size,size);  //draw additional segments to the left of the head
    }
  }
  
  void moveWorm()
  {
    switch(dir)
    {
      case LEFT:                  //move left
        x -= moveSpeed; break;
      case RIGHT:                 //move right
        x += moveSpeed; break;  
      default:
        break;
    }
  }
  
  void duplicateWorm()
  {
    if(segments <= maxSegments)
    {
      if(count > halfLife)  //a halfLife amount of frames has passed
      {
        segments++;  //add another segment
        count = 0;   //reset the counter
      }
    }
  }
}