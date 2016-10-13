void defineRect()
{
  if(coordCount == 0)
  {
    x = mouseX;
    y = mouseY;
    rect(x,y,3,3);
    coordCount++;
  }
  
  else if(coordCount == 1)
  {
    w = -(x-mouseX);
    rect(x,y,w,3);
    coordCount++;
  }
  
  else if(coordCount == 2)
  {
    h = -(y-mouseY);
    point(x,y+h);
    //reset the coordinate index
    coordCount = 0;
    doneDrawing = true;
  }
}