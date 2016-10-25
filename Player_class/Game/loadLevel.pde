void loadLevel(String filename)
{
  String vars[] = loadStrings(filename);
  float[][] restCoords = new float[vars.length-6][4];
  int restBlocks = 0;
  int puzzleBlocks = 0;
  //print(vars);
  
  player.reqX = Float.parseFloat(vars[0]);
  player.reqY = Float.parseFloat(vars[1]);
  
  player.mainX = Float.parseFloat(vars[2]);
  player.mainY = Float.parseFloat(vars[3]);
  player.mainW = Float.parseFloat(vars[4]);
  player.mainH = Float.parseFloat(vars[5]);

//// execute 8 times to grab all remaining player rect coords
  for(int i = 6; i < 38;i+=4)
  {
     try
     {
       float x = Float.parseFloat(vars[i]);
       //print(x);
       float y = Float.parseFloat(vars[i+1]);
       float w = Float.parseFloat(vars[i+2]);
       float h = Float.parseFloat(vars[i+3]);
       float[] coords = {x,y,w,h};
       if(!isEmpty(coords))
       {
         restCoords[restBlocks] = coords;
         restBlocks++;
         //coords[listIndex] = Float.parseFloat(vars[i]);
       }
     }
     catch(ArrayIndexOutOfBoundsException e)
     {
       break;
     }
  }
  player.restCoords = restCoords;
  
  for(int j = 38; j < vars.length; j+=4)
  {
    float blockX = Float.parseFloat(vars[j]);
    float blockY = Float.parseFloat(vars[j+1]);
    float blockW = Float.parseFloat(vars[j+2]);
    float blockH = Float.parseFloat(vars[j+3]);
    float[] blockCoords = {blockX,blockY,blockW,blockH};
    if(!isEmpty(blockCoords))
    {
      puzzleCoords[puzzleBlocks] = blockCoords;
      puzzleBlocks++;
    }
  }
  /*
  player.mainX = mainX;
  player.mainY = mainY;
  player.mainW = mainW;
  player.mainH = mainH;
  
  player.reqX = reqX;
  player.reqY = reqY;
  */

}