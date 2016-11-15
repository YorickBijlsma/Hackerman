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
  float[] reqCoords = playerCoords[0];
  float[] mainCoords = playerCoords[1];
  fill(255,0,255);
  rect(reqCoords[0],reqCoords[1],reqCoords[2],reqCoords[3]);
  rect(mainCoords[0],mainCoords[1],mainCoords[2],mainCoords[3]);
  
  fill(255,193,37);
  for(int a = 2; a < playerCoords.length; a++) //start at index 2 because the first two elements of player are the puzzle requirements
  {
    float[] restCoords = playerCoords[a];
    rect(restCoords[0],restCoords[1],restCoords[2],restCoords[3]);
  }
}