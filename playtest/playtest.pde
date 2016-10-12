Block block;
Block block2;

boolean done = false;
//float angle = 0;

void setup()
{
  block = new Block();
  block2 = new Block();
  
  block2.y += 100;
  
  size(500,500);
  background(255);
}
color c = color(255,0,0);

void draw()
{
  done = done();
  if (!done)
  {
  block.input();
  block2.input();
  //rotate(angle);
  }
  else{ c = color(0,255,0); }
  
  
  background(255);
  fill(c);
  
  rect(50, 300, 25, 150);
  rect(50,450,150,25);
  rect(175,300,25,150);
  
  block.UpdateRect();
  block2.UpdateRect();
}

void makeBlocks()
{
  fill(255,0,0);
  
}

boolean done()
{
  if(block.x >= 50 - 3 && block.x <= 50 + 3)
  {
    if(block.y >= 300 - (block.h+3) && block.y <= 300 + (block.h+3)) {
    done = true; 
    }
  }
  else{done = false;}  
  return done;
}