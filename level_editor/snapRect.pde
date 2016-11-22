float[] snapRect(float[] currentStats)
{
  float snapPixels = 50.0;
  float[] newCoords = new float[4];
  
  //un-snapped coordinates for rect
  currentX = currentStats[0];
  currentY = currentStats[1];
  currentW = currentStats[2];
  currentH = currentStats[3];
  
  //how far each coordinate is from being a multiple of 20 (aka snapping to grid)
  float xRemainder = currentX % snapPixels;
  float yRemainder =  currentY % snapPixels;
  float wRemainder = currentW % snapPixels;
  float hRemainder = currentH % snapPixels;
  
  //x and y snaps to the first previous 20 pixels (gridline)
  currentX -= xRemainder;
  currentY -= yRemainder;
  newCoords[0] = currentX;
  newCoords[1] = currentY;
  
  //w and h snaps to the first next 20 pixels (gridline)
  newCoords[2] = roundGrid(wRemainder, currentW, snapPixels);
  newCoords[3] = roundGrid(hRemainder, currentH, snapPixels);
  
  return newCoords;
}

float roundGrid(float remainder, float coord, float snapPixels)
{
    coord += (snapPixels - remainder);
    return coord;
}