Block block;
//Block block2;

boolean done = false;
//float angle = 0;

void setup()
{
  block = new Block(200);
  ///block2 = new Block(250);
  
  //block2.y += 100;
  
  size(1024,432);
  background(255);

}
color c = color(255,0,0);



void draw()
{
  done = done();
  if (!done)
  {
  block.input();
  //block2.input();
  //rotate(angle);
  }
  else{ c = color(0,255,0); }
  
  
  background(255);
  fill(c);
  
  rect(260.0, 80.0, 420.0, 260.0);
rect(740.0, 80.0, 180.0, 260.0);
rect(60.0, 120.0, 20.0, 100.0);
rect(120.0, 120.0, 20.0, 100.0);
rect(80.0, 200.0, 60.0, 20.0);

  
  block.UpdateRect();
  //block2.UpdateRect();
}

void makeBlocks()
{
  fill(255,0,0);
  
}

boolean done()
{
  if(block.x >= 50 - 2 && block.x <= 50 + 2)
  {
    if(block.y >= 300 - (block.h+2) && block.y <= 300 + (block.h+2))
    {
    return true; 
    }
  }
  else{return false;}  
  return false;
}