void printDoneReqs()
{
  int z = 0;
  for(float[] coords : playerCoords)
  {
    float reqX = coords[0];
    float reqY = coords[1];
    float reqW = coords[2];
    float reqH = coords[3];
    if(!isEmpty(coords))
    {
      if(z==0)
      {
        print("//Gebruik deze variabelen in de checkDone functie van Player");
        print("\nplayer.reqX = "+reqX);
        print("\nplayer.reqY = "+reqY);
      }
      else if(z==1)
      {
        print("\n\n//Gebruik deze variabelen voor de Main rectangle van Player");
        print("\nplayer.mainX = "+reqX);
        print("\nplayer.mainY = "+reqY);
        print("\nplayer.mainW = "+reqW);
        print("\nplayer.mainH = "+reqH);
      }
      else if(z > 1)
      {
        //print("\n\n//Restanten Player rectangles");
        //print("\nrect("+reqX+","+reqY+","+reqW+","+reqH+");");
        //print("float[][] playerRects = {"+reqX+","+reqY+","+reqW+","+reqH+"}");
        float[] playerRect = {reqX, reqY, reqW, reqH};
        String playerString = Arrays.toString(playerRect);
        strPlayerRects += playerString;
      }
    }
    z++;
  }
  print(strPlayerRects);
  
  print("\n\n//dit zijn de blocks die je net hebt gemaakt:\n");
  print("noStroke();\n");
  print("fill("+(int)redVal+","+
                (int)greenVal+","+
                (int)blueVal+
                ");\n");
  for(float[] coords : blockCoords)
  {
    if(!isEmpty(coords))
    {
      String coordsString = Arrays.toString(coords);
      String rectString = coordsString.substring(1,coordsString.length()-1);
      print("rect("+rectString+");\n");
    }
  }
}