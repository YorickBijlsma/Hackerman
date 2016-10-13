float[] snapRect(float[] currentBlockStats)
{
  float snapPixels = 20.0;
  float[] newBlockCoords = new float[4];
  
  x = currentBlockStats[0];
  y = currentBlockStats[1];
  w = currentBlockStats[2];
  h = currentBlockStats[3];
  
  float xRemainder = x % snapPixels;
  float yRemainder =  y % snapPixels;
  float wRemainder = w % snapPixels;
  float hRemainder = h % snapPixels;
  
  x -= xRemainder;
  y -= yRemainder;
  
  //newBlockCoords[0] = roundTen(xRemainder, x, snapPixels);
  //newBlockCoords[1] = roundTen(yRemainder, y, snapPixels);
  
  newBlockCoords[0] = x;
  newBlockCoords[1] = y;
  newBlockCoords[2] = roundTen(wRemainder, w, snapPixels);
  newBlockCoords[3] = roundTen(hRemainder, h, snapPixels);
  
  return newBlockCoords;
}

float roundTen(float remainder, float coord, float snapPixels)
{

    coord += (snapPixels - remainder);
    return coord;
}