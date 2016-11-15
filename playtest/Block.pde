public class Block {
  float x = 250;
  float y = 200;

  float w = 150;
  float h = 25;
  
  Block(float x)
  {
    this.x = x; 
  }
  
  public void UpdateRect()
  {
    noStroke();
    if (PlayerCollision(mouseX, mouseY) )
    {
      stroke(155);
    }
    rect(x,y,w,h);
  }

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
            //angle -= 1;
          }
          if(key== 'w')
          {
            //angle += 1;
          }
  }
}

 boolean PlayerCollision(float xObject, float yObject) 
 {
   if (xObject > x && xObject < x + w) 
   {
     if (yObject > y && yObject < y + h) 
     {
       return true;
     }
   }
   return false;
 }
 
   
}