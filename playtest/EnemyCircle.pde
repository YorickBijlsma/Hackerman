public class EnemyCircle {
  float x = 0;
  float y = 0;
  
  float r = 20;
  float xv = 1;
  float yv = 0.1;
  
   
  void MoveEnemy() {
    x += xv;
    y += yv;
    
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
     if(EnemyCollision()) 
     {
       fill(0,0,0);
     }
     
     stroke(255,100,0);     
     ellipse(x,y + r, r, r);    
  
  }
  
  boolean EnemyCollision() {
    if (dist(block.x, block.y, x, y + r) < 20) 
    {
      return true;
    }
    else 
    {
     return false;    
    }   
  }
  
 
  }