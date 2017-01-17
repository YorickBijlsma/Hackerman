class Player
{
  final int originalHealth = 100;
  float health = originalHealth;
  public color healthColour = color(255, 255, 255);
  boolean hit = false;
  int hitCounter = 0;
  PImage sprite;
  PImage eitherSprite;

  float reqX, reqY;
  float mainX, mainY, mainW, mainH;
  float xRemainderToWall, yRemainderToWall = 0.0;
  float playerWidth = mainW - mainX;
  float playerHeight = mainH - mainY;
  float playerArea = (playerWidth / playerHeight);
  float xsp, ysp = 0;
  public float speed = 10;
  float originalSpeed = speed;
  float angle = 0;
  boolean done = false;
  boolean beatGame = false;
  boolean collidesWithWall, xCollision, yCollision = false;
  boolean u, d, l, r = false;
  float otherX, otherY, otherW, otherH = 0.0;
  color colour = color(0, 0, 255);
  float[][] restCoords = {{0.0}};

  float setSpeed()
  {
    return (playerArea);
  }

  void draw()
  {
    /*if     (hit)  colour = color(255,0,0);
     else if(done) colour = color(0,255,0);
     else          colour = color(0,0,255);*/

    //fill(colour);
    //eitherSprite = (done)? playerSpriteDone : playerSpriteNormal; //change sprite if player done

    //sprite = eitherSprite.get(0, 0, (int)mainW, (int)mainH);
    image(playerSpriteNormal, mainX, mainY);   //player sprite corresponding to width and height at x and y

    if (checkDone()) done = true;     //check if puzzle is completed
    else colour = color(0, 0, 255);
  }

  void update()
  {
    if (health <= 0)  //death sequence
    {
      mainsong.stop();
      if (playingGameOver == false)
      {
        gameover.play();
        playingGameOver = true;
      }  
      if (!savedBestScoresThisLevel) saveBestScores();
      gameState = 2;
    } 
    else            //sequence for player is alive
    {
      hitSpriteHandler();
      xsp *= 0.4;
      ysp *= 0.4;

      if (keysPressed[LEFT])   xsp = -1;
      if (keysPressed[RIGHT])  xsp = 1;
      if (keysPressed[UP])     ysp = -1;
      if (keysPressed[DOWN])   ysp = 1;
      if (keysPressed[65])     xsp = -1; //A
      if (keysPressed[68])     xsp = 1;  //D
      if (keysPressed[87])     ysp = -1; //W
      if (keysPressed[83])     ysp = 1;  //S

      if (keysPressed[SHIFT])
      {
      }
      if (! nextPositionIsWall('x') )
      {
        mainX += xsp * speed;
      }
      if (! nextPositionIsWall('y') )
      {
        mainY += ysp * speed;
      }
      mainX = constrain(mainX, 0, width-mainW);      //stay in the screen x wise
      mainY = constrain(mainY, 0, height-mainH);     //y wise
    }
  }

  boolean nextPositionIsWall(char checkSide)
  {
    float nextXposition = mainX + (xsp * speed);          //position player attempts to move in
    float nextYposition = mainY + (ysp * speed);

    if (checkSide == 'x')
    {
      for (float[] c : wallCoords)
      {
        otherX = c[0]; 
        otherY = c[1];
        otherW = c[2]; 
        otherH = c[3];

        if (                                                    //if our next position is...
          nextXposition <= otherX + otherW    &&             //more left than most right side of wall   
          nextXposition + mainW >= otherX     &&             //more right than most left side of wall   
          mainY <= otherY + otherH            &&             //more up than most down side of wall   
          mainY + mainH >= otherY                            //more down than most up side of wall
          )                                                   //then we have collision!
        {
          if (!(mainX <= otherX + otherW)) mainX += 1;    //applies bounciness on x
          if (!(mainX + mainW >= otherX))  mainX -= 1;
          wallbump.play();
          return true;
        }
      }
    }
    if (checkSide == 'y')
    {
      for (float[] c : wallCoords)
      {
        otherX = c[0]; 
        otherY = c[1];
        otherW = c[2]; 
        otherH = c[3];

        if (                                                       
          mainX <= otherX + otherW            &&             
          mainX + mainW >= otherX             &&                
          nextYposition <= otherY + otherH    &&                
          nextYposition + mainH >= otherY                       
          )                                                       
        {
          if (!(mainY <= otherY + otherH)) mainY += 2;     //applies bounciness on y
          if (!(mainY+mainH >= otherY))    mainY -= 2;     
          wallbump.play();
          return true;
        }      //below player
      }
    }
    return false;
  }

  boolean checkDone()
  {
    //check if player collides with a pseudo hitbox cast around the requirement coordinates by margin amount of pixels
    if (mainX <= reqX + PUZZLEDONEMARGIN &&
      mainX >= reqX - PUZZLEDONEMARGIN &&
      mainY <= reqY + PUZZLEDONEMARGIN &&
      mainY >= reqY - PUZZLEDONEMARGIN)
    {
      //place the player exactly where they need to be, thus removing any ugly lines from the player not exactly fitting (puzzle margin)
      mainX = reqX;                   
      mainY = reqY;
      return true;
    }
    return false;
  }

  void hitSpriteHandler()
  {
    if (hit)
    {
      hitCounter++;
    }
    if (hitCounter >= 20)
    {
      hitCounter = 0;
      hit = false;
    }
  }

  void drawHealthBar()
  {
    String drawType = new String("bar");
    //String drawType = new String("circle");
    int pad = 2;

    boolean drawOutline = //false;
                          true;

    float barx, bary, barw, barh;
    if (Objects.equals(drawType,"bar"))
    {
      barx = mainX + mainW + 6;
      bary = mainY + mainH + 2;
      barw = 6;
      barh = mainH * (health / 100); //the height of the bar is a representation of the percentage of health left

      fill(green);
      rect((int)barx, (int)bary-pad, 
           (int)barw, (int)-barh);
      if (drawOutline)
      {
        stroke(35);
        strokeWeight(3);
        noFill();
        
        rect((int)barx-pad, (int)bary-pad, 
             (int)barw+pad, (int)-mainH);
        noStroke();
      }
    }   

    if (Objects.equals(drawType,"circle"))
    {
      ellipseMode(CENTER);
      float cx = mainX + (mainW/2);
      float cy = mainY + (mainH/2);
      float r = health * 0.85;

      stroke(green);
      strokeWeight(3);
      noFill();
      ellipse(cx, cy, 
        r, r);
      noStroke();
    }
  }
}