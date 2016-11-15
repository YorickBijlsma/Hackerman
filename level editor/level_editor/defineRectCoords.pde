void defineRectCoords()
{
  if(blockCoordCount == 0)
  {
    x = mouseX;
    y = mouseY;
    rect(x,y,3,3);
    blockCoordCount++;
  }
  
  else if(blockCoordCount == 1)
  {
    w = -(x-mouseX);
    rect(x,y,w,3);
    blockCoordCount++;
  }
  
  else if(blockCoordCount == 2)
  {
    h = -(y-mouseY);
    point(x,y+h);
    //reset the coordinate index
    blockCoordCount = 0;
    doneBlockDrawing = true;
  }
}