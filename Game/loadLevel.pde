void loadLevel(int num) //)
{
  String fileName = "data/"+num+"/lvl_"+num;
  File directory = new File(dataPath(""+num));
  //File testFile = new File(fileName+"_exists.txt");
  if (directory.exists())
  {
    int restBlocks = 0;
    int puzzleBlocks = 0;
    int wallBlocks = 0;
    
    String varsPlayer[] = {};
    String varsPuzzle[] = {};
    String varsWalls[] = {};
    
    varsPlayer = loadStrings(fileName+"_player.txt");
    varsPuzzle = loadStrings(fileName+"_puzzle.txt");
    varsWalls = loadStrings(fileName+"_walls.txt");
  
    float[][] restCoords = new float[8][4];
    
    player.reqX = Float.parseFloat(varsPlayer[0]);
    player.reqY = Float.parseFloat(varsPlayer[1]);
    
    player.mainX = Float.parseFloat(varsPlayer[2]);
    player.mainY = Float.parseFloat(varsPlayer[3]);
    player.mainW = Float.parseFloat(varsPlayer[4]);
    player.mainH = Float.parseFloat(varsPlayer[5]);
  
    // get remaining player coordinates from player variables array (was 38)
    for(int i = 6; i < varsPlayer.length; i+=4)
    {
       try
       {
         float x = Float.parseFloat(varsPlayer[i]);
         //print(x);
         float y = Float.parseFloat(varsPlayer[i+1]);
         float w = Float.parseFloat(varsPlayer[i+2]);
         float h = Float.parseFloat(varsPlayer[i+3]);
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
    
    //get puzzle blocks from puzzle variable array
    for(int j = 0; j < varsPuzzle.length; j+=4)
    {
      float blockX = Float.parseFloat(varsPuzzle[j]);
      float blockY = Float.parseFloat(varsPuzzle[j+1]);
      float blockW = Float.parseFloat(varsPuzzle[j+2]);
      float blockH = Float.parseFloat(varsPuzzle[j+3]);
      float[] blockCoords = {blockX,blockY,blockW,blockH};
      if(!isEmpty(blockCoords))
      {
        puzzleCoords[puzzleBlocks] = blockCoords;
        puzzleBlocks++;
      }
    }
    
    //get wall blocks from wall variable array
    for(int k = 0; k < varsWalls.length; k+=4)
    {
      float wallX = Float.parseFloat(varsWalls[k]);
      float wallY = Float.parseFloat(varsWalls[k+1]);
      float wallW = Float.parseFloat(varsWalls[k+2]);
      float wallH = Float.parseFloat(varsWalls[k+3]);
      float[] wallStats = {wallX,wallY,wallW,wallH};
      if(!isEmpty(wallStats))
      {
         wallCoords[wallBlocks] = wallStats;
         wallBlocks++;
      }
    }
    levelNumber++;
  }
  else
  {
    //do nothing, as the next level doesn't exist
  }
}