class Worm
{
  float x, y;
  float moveSpeed = 5;
  int dir = RIGHT;
  float nextXposition, nextYposition = 0;

  int segments = 1;
  int segmentSize = 7;
  float headSize = segmentSize * 1.4;
  int maxSegments = 100;
  float size;                        //placeholder variable for black magic

  int segmentationTime = 5;         //every segmentationTime amount of frames, a new segment is added (the worm grows bigger)
  int segmentCounter = 0;            //count every frame for duplication purposes
  int damage = 5;

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

      //black magic ternary operator, draws the head bigger
      size = (i == 0) ? headSize : segmentSize;

      if (dir == LEFT)  ellipse(x + (i*segmentSize), y, size, size);  //draw additional segments to the right of the head
      if (dir == RIGHT) ellipse(x - (i*segmentSize), y, size, size);  //draw additional segments to the left of the head
      if (dir == DOWN)  ellipse(x, y + (i*segmentSize), size, size);
      if (dir == UP)    ellipse(x, y - (i*segmentSize), size, size);
    }
  }

  void update()
  {
    damagePlayer(x, y, damage);

    segmentCounter++;
    if (segments <= maxSegments)
    {
      if (segmentCounter > segmentationTime)
      {
        segments++;
        segmentCounter = 0;
      }
    } else segmentCounter = 0;



    if (bounceOffWall(x, y) || bounceOffScreenEdge())//if (hitsWall())
    {
      segments = 3;
      if (bounceOffWall(x, y))
      {
        if (dir == LEFT) dir = RIGHT;
        else if (dir == RIGHT) dir = LEFT;
        else if (dir == UP) dir = DOWN;
        else if (dir == DOWN) dir = UP;
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
  final static int amountOfAds = 6;          //final static so we can use this variable by referring to the class, instead of a specific instance (used to spawn ads)
  int adSpawnCounter = 0;
  int adSpawnTime = 2;
  boolean bursting = false;
  int burstCounter = 0;
  int burstingDuration = 30;
  float speed = 17;
  float xsp = speed; 
  float ysp = speed;
  int damage = 0;
  float originalSpeed = speed;

  color colour = color(70, 215, 240);

  public EnemyAdware (int x, int y)
  {
    this.x = x;
    this.y = y;
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
    if (bounceOffWall(x, y))
    {
      if (xsp < 0) xsp = speed; 
      else         xsp = -speed;
      if (ysp < 0) ysp = speed; 
      else         ysp = -speed;
    }
    x += xsp;
    y += ysp;

    if (overlapsPlayer(x, y))
    {
      bursting = true;
      adware.play();
    }
    if (bursting)
    {
      burstCounter++;
      if (burstCounter >= burstingDuration)
      {
        burstCounter = 0;
        bursting = false;
        ads.clear();
      } else
      {
        burstAdware();
      }
    }
  }

  void burstAdware()
  {
    adSpawnCounter++;
    if (adSpawnCounter >= adSpawnTime)
    {
      adSpawnCounter = 0;
      Ad newAd = new Ad();
      ads.add(newAd);
    }
  }

  void draw()
  {
    fill(colour);                                                  
    //rect(x, y, w, h);
    image(adwareSprite, x, y);
  }
}
/*
//////////////////////////////////////////////
 end of adware class
 //////////////////////////////////////////////
 //////////////////////////////////////////////
 //////////////////////////////////////////////
 begin of ad class
 //////////////////////////////////////////////
 */

class Ad
{
  float x;
  float y;
  int imageNumber;
  PImage adSprite;

  public Ad()
  {
    this.x = random(0, width  -  150);          //spawn anywhere, as long as it's 150 pixels away from all edges 
    this.y = random(0, height  -  150);
    imageNumber = (int) random(0, EnemyAdware.amountOfAds); 
    adSprite = adwareSprites[imageNumber];
  }

  void draw()
  {
    image(adSprite, x, y);
  }
}
/*
//////////////////////////////////////////////
 end of ad class
 //////////////////////////////////////////////
 //////////////////////////////////////////////
 //////////////////////////////////////////////
 begin of virus class
 //////////////////////////////////////////////
 */
class Virus
{
  float x, y;
  float vx, vy;
  float diameter = 45;

  color colour = color(255, 0, 0);
  int teller = 100;
  float draw = 0;
  int amountOfPackages = 0;
  int damage = 3;

  //spriteSheet variables
  int frameAmount = 1; //after frameAmount frames, the next sprite loads
  int spritePosition = 0; //spritecounter
  int frameWidth = 69;
  int frameHeight = 70;
  int spriteAmount = 48; //amount of sprites in spritesheet

  public Virus(float x, float y)
  {
    this.x = x;
    this.y = y;

    vx = random(-3.0, 3.0);
    vy = random(-3.0, 3.0);
  }

  void update()
  {    
    if ((frameCount % frameAmount) == 0)  spritePosition =  (spritePosition + 1) % spriteAmount; //spritesheet counter
    x += vx;
    y += vy;

    //bounce off screen edge
    if ( (x > width-diameter/2)  || (x < diameter/2) )  vx = -vx;
    if ( (y > height-diameter/2) || (y < diameter/2) )   vy = -vy;
    teller++;  

    if (teller == 110 && amountOfPackages!=5)
    {
      amountOfPackages++;

      Package newPackage = new Package();    //make a new package
      newPackage.init(x, y);                 //spawn it under ourselves
      packages.add(newPackage);              //add it to the arraylist

      teller = 0;                            //wait teller amount of frames before repeating
    }
  }

  void draw() 
  {
    fill(colour);
    copy(DoTcom, (spritePosition*frameWidth), 0, frameWidth, frameHeight, (int)x, (int)y, frameWidth, frameHeight); //this is the engine in spritesheet, change the first imageVariable
  }
}

class Package
{
  float x, y;
  float w = 18;
  color colour = color(255, 255, 255);
  float damage = 0.6;
  int infectCounter = 0;
  boolean infected = false;
  int infectTime = 35;

  //spriteSheet variables
  int frameAmount = 10; //after frameAmount frames, the next sprite loads
  int spritePosition = 0; //spritecounter
  int frameWidth = 20;
  int frameHeight = 19;
  int spriteAmount = 1; //amount of sprites in spritesheet

  void init(float x, float y)
  {
    this.x = x;
    this.y = y;
  }
  void draw()
  {
    copy(Packagespritesheet, (spritePosition*frameWidth), 0, frameWidth, frameHeight, (int)x, (int)y, frameWidth, frameHeight); //this is the engine in spritesheet, change the first imageVariable
  }
  void update()
  {
    damagePlayer(x, y, damage);

    if ((frameCount % frameAmount) == 0)  spritePosition =  (spritePosition + 1) % spriteAmount; //spritesheet counter

    if (overlapsPlayer(x, y)) infected = true;
    damagePlayerDoT(x, y, damage);
  }

  boolean damagePlayerDoT(float x, float y, float damage)
  {
    if (infected)
    {
      infectCounter++;
      if (infectCounter >= infectTime) infected = false;
      player.health -= damage;
    }
    return false;
  }
}

class Malware
{
  float x;
  float y;
  int w = 20;
  int h = 20;
  color colour = color(125, 125, 0);
  int speed = 5;
  int damage = 10;
  boolean alive = true;
  int engagementDistance = 300;

  //spriteSheet variables
  int frameSpeed = 2; //after frameSpeed amount frames, the next sprite loads
  int spritePosition = 0; //spritecounter
  int frameWidth = 26;
  int frameHeight = 26;
  int spriteAmount = 18; //amount of sprites in spritesheet

  public Malware(float x, float y)
  {
    this.x = x;
    this.y = y;
  }

  void draw()
  {
    fill(colour);
    copy(malwareSprite, (spritePosition*frameWidth), 0, frameWidth, frameHeight, (int)x, (int)y, frameWidth, frameHeight); //this is the engine in spritesheet, change the first imageVariable
  }

  void update()
  {
    move();
    collision();
    if ((frameCount % frameSpeed) == 0)  spritePosition =  (spritePosition + 1) % spriteAmount; //spritesheet counter
  }

  void move() 
  {
    float xDistance = x - player.mainX - (player.mainW/2);                      
    float yDistance = y - player.mainY - (player.mainH/2);

    if (Math.abs(xDistance) <= engagementDistance && Math.abs(yDistance) <= engagementDistance)
    {
      double hyp = Math.sqrt(xDistance * xDistance + yDistance * yDistance);                    //pythagoras
      xDistance /= hyp;
      yDistance /= hyp;
      x += (xDistance * -speed);
      y += (yDistance * -speed);
    }
  }

  void collision() 
  {
    if (damagePlayer(x, y, damage)) 
    {
      x = 10000;          //place the colliding malware outside the room
      y = 10000;
      alive = false;
    }
  }
}

class HealthPickup
{
  int x, y;
  int speedX, speedY;
  int diameter = 10;
  int healthBonus = 30;
  boolean hit, spawned = false;
  int outScreen = 10000;
  int healCounter = 0;

  public HealthPickup()
  {    
    speedX = calcSpeed();
    speedY = calcSpeed();
    x = width/2;
    y = height/2;
    while(wallCollide())
    {
      x += speedX;
      y += speedY;
    }
  }

  void update()
  {
    healSpriteHandler();
    if (x<width && x > 0 
      &&
      y<height && y > 0)
    {
      collision();

      //movement
      x = x + speedX;
      y = y + speedY;

      //collision Player
      if (overlapsPlayer(x, y))
      {
        hit = true;
      } else
      {
        hit = false;
      }
      if (hit && player.health < player.originalHealth)
      {
        player.health += healthBonus;
        if (player.health > player.originalHealth)
        {
          player.health = player.originalHealth;
        }
        x = outScreen;
        y = outScreen;
        showingHealSprite = true;
        hit = false;
      }
    }
  }
  void draw()
  {
    fill(255, 0, 0);
    //rectMode(RADIUS);
    //rect(x, y, diameter, diameter);  
    imageMode(CENTER);
    image(healthPickupSprite, x, y);
    imageMode(CORNER);
    //rectMode(CORNER);
  }

  int calcSpeed()
  {
    int speed = 0;

    speed = (int)random(-1, 1);
    while (speed == 0)
    {
      speed = (int)random(-1, 1);
    }
    return speed;
  }
  void collision()
  {
    // border
    if (x + diameter > width || x + diameter < 0)
    {
      speedX = speedX *-1;
    }
    if (y + diameter > height || y + diameter < 0)
    {
      speedY = speedY *-1;
    }

    // walls

    if (wallCollide())
    {
      if (speedX < 0) speedX = speedX *-1; 
      else speedX = speedX *-1;

      if (speedY < 0) speedY = speedY *-1; 
      else speedY = speedY *-1;
    }
  }
  boolean wallCollide()
  {
    if (bounceOffWall(x + diameter, y + diameter) || bounceOffWall(x - diameter, y - diameter))
    {
      return true;
    }
    return false;
  }
  
  void healSpriteHandler()
  {
    if(showingHealSprite)
    {
      healCounter++;
    }
    if (healCounter >= 20)
    {
      healCounter = 0;
      showingHealSprite = false;
    }
  }
}