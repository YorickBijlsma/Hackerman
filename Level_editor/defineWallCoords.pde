void defineWallCoords()
{
  if(wallCoordCount == 0)
  {
    wallX = mouseX;
    wallY = mouseY;
    wallCoordCount++;
  }
  
  else if(wallCoordCount == 1)
  {
    wallW = -(wallX-mouseX);
    wallCoordCount++;
  }
  
  else if(wallCoordCount == 2)
  {
    wallH = -(wallY-mouseY);
    wallCoordCount = 0; //reset the coordinate index
    doneWallDrawing = true;
  }
}

void drawWalls()
{
  fill(139,69,19);
  for(float[] c : wallCoords) //draw the walls
  {
    rect(c[0],c[1],c[2],c[3]);
  }
}