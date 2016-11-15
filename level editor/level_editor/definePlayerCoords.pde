void definePlayerCoords()
{
  fill(colour);
  
  if(playerCoordCount == 0)
  {
    doneX = mouseX;
    doneY = mouseY;
    rect(doneX,doneY,20,20);
    playerCoordCount++;
  }
  
  else if(playerCoordCount == 1)
  {
    doneW = -(doneX-mouseX);
    rect(doneX,doneY,doneW,20);
    playerCoordCount++;
  }
  
  else if(playerCoordCount == 2)
  {
    doneH = -(doneY-mouseY);
    //reset the coordinate index
    playerCoordCount = 0;
    donePlayerDrawing = true;
    //editType = "block";
  }
}

void drawPlayer()
{
  fill(255,193,37);
  for(float[] coords : playerCoords)
  {
    rect(coords[0],coords[1],coords[2],coords[3]);
  }
}