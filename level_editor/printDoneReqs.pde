void printDoneReqs()
{  
  outPlayer = createWriter(filepath+levelNumber+"/"+"lvl_"+levelNumber+"_player.txt");
  outPuzzle = createWriter(filepath+levelNumber+"/"+"lvl_"+levelNumber+"_puzzle.txt");
  outWalls = createWriter(filepath+levelNumber+"/"+"lvl_"+levelNumber+"_walls.txt");
  outEnemies = createWriter(filepath+levelNumber+"/"+"lvl_"+levelNumber+"_enemies.txt");
  
  int z = 0;
  for(float[] coords : playerCoords)
  {
    float reqX = coords[0];
    float reqY = coords[1];
    float reqW = coords[2];
    float reqH = coords[3];
      if(z==0)    //requirement coords
      {
        outPlayer.println(reqX);
        outPlayer.println(reqY);
      }
      else        //player coords, 0st index is main player rect
      {
        outPlayer.println(reqX);
        outPlayer.println(reqY);
        outPlayer.println(reqW);
        outPlayer.println(reqH);
      }
    z++;
  }

  for(float[] coords : blockCoords)
  {
    outPuzzle.println(coords[0]);
    outPuzzle.println(coords[1]);
    outPuzzle.println(coords[2]);
    outPuzzle.println(coords[3]);
    
    if(!isEmpty(coords))
    {
      String coordsString = Arrays.toString(coords);
      String rectString = coordsString.substring(1,coordsString.length()-1);
      //print("rect("+rectString+");\n");
    }
  }
  
  for(float[] c : wallCoords)
  {
    outWalls.println(c[0]);
    outWalls.println(c[1]);
    outWalls.println(c[2]);
    outWalls.println(c[3]);
  }
  
  for(float[] c : enemyCoords)
  {
    outEnemies.println(c[0]);
    outEnemies.println(c[1]);
  }
  
  
  outPlayer.flush();
  outPuzzle.flush();
  outWalls.flush();
  outEnemies.flush();
  
  outPlayer.close();
  outPuzzle.close();
  outWalls.close();
  outEnemies.close();
}