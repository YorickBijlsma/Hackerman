float x = 250;
float y = 200;

float w = 150;
float h = 25;
boolean done = false;
float angle = 0;

void input()
{
  if(keyPressed)
  {
    if (keyCode == DOWN)
          {
          y += 2;
          }      
              
          if (keyCode == UP) 
          {
          y -= 2;
          }
        
          if (keyCode == LEFT)
          {
          x -= 2;
          }
        
          if (keyCode == RIGHT)
          {
          x += 2;
          }
          
          if(key == 'q')
          {
            angle -= 1;
          }
          if(key== 'w')
          {
            angle += 1;
          }
  }
}

void makeBlocks()
{
  fill(255,0,0);
  
}






void setup()
{
  size(500,500);
  background(255);
}
color c = color(255,0,0);

void draw()
{
  done = done();
  if (!done)
  {
  input();
  //rotate(angle);
  }
  else{ c = color(0,255,0); }
  
  background(255);
  fill(c);
  rect(x,y,w,h);
  
  
  rect(50, 300, 25, 150);
  rect(50,450,150,25);
  rect(175,300,25,150);
}

boolean done()
{
  if(x >= 50 - 3 && x <= 50 + 3)
  {
    if(y >= 300 - (h+3) && y <= 300 + (h+3)) {done = true; }
  }
  else{done = false;}  
  return done;
}