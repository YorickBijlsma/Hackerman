float[] snapRect(float[] currentStats)
{
  float snapPixels = 20.0;
  float[] newCoords = new float[4];
  
  currentX = currentStats[0];
  currentY = currentStats[1];
  currentW = currentStats[2];
  currentH = currentStats[3];
  
  float xRemainder = currentX % snapPixels;
  float yRemainder =  currentY % snapPixels;
  float wRemainder = currentW % snapPixels;
  float hRemainder = currentH % snapPixels;
  
  currentX -= xRemainder;
  currentY -= yRemainder;
  
  newCoords[0] = currentX;
  newCoords[1] = currentY;
  newCoords[2] = roundTen(wRemainder, currentW, snapPixels);
  newCoords[3] = roundTen(hRemainder, currentH, snapPixels);
  
  return newCoords;
}

float roundTen(float remainder, float coord, float snapPixels)
{
    coord += (snapPixels - remainder);
    return coord;
}