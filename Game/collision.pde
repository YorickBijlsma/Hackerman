boolean overlapsPlayer(float x, float y)
{
  float playerX = player.mainX;
  float playerY = player.mainY;
  float playerW = player.mainW;
  float playerH = player.mainH;

  return( //return if player has overlapped
    x <= playerX + playerW      &&
    x >= playerX                &&
    y <= playerY + playerH      &&
    y >= playerY
    );
}

boolean bounceOffWall(float x, float y)
{
  //float nextXposition = x;         //position player attempts to move in
  //float nextYposition = y;

  for (float[] c : wallCoords)
  {
    float otherX = c[0];
    float otherY = c[1];
    float otherW = c[2];
    float otherH = c[3];

    if(     x <= otherX + otherW    &&      //there's a wall to the left
            x >= otherX             &&      //to the right
            y <= otherY + otherH    &&      //above
            y >= otherY                     //below
      )return true;                         //collision!        
                              
  }   
  return false; //no wall where we want to move!
}

boolean damagePlayer(float x, float y, int damage)
{
  if(overlapsPlayer(x,y))
  {
    player.colour = color(255,0,0);
    player.health -= damage;
    return true;
  }
  return false;
}  