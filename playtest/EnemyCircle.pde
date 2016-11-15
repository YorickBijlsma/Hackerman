public class EnemyCircle {
  float x = 0; //x coord
  float y = 0; //y coord
  
  float r = 30; //radius
  float xv = 1; //xvelocity
  float yv = 0.1; //yvelocity
  
   
  void MoveEnemy() {
   // x += xv;
   // y += yv;
    
    //bounce
    if (x == width - 0.5*r) 
    {
      xv = -xv;                 
    }
    
    if (x == 0)
    {
      xv = -xv;      
    }
  
    if (y > height)
    {
      yv = -yv;
    }
    
    if (y < 0) 
    {
      yv = -yv;
    }
  }
  
   void UpdateEnemy() {
     noFill();
     if(EnemyCollision(block.x, block.y) || block.PlayerCollision(mouseX, mouseY) ) //fill if collision is true
     {
       fill(0,0,0);
     }
     
     stroke(255,100,0);     
     ellipse(x + r,y + r, r, r);    
  
  }
  
  boolean EnemyCollision(float xObject, float yObject) {
    if (dist(xObject, yObject, x, y + r) < r) 
    {
      return true;
    }
    else 
    {
     return false;    
    }   
  }
  
 
  }