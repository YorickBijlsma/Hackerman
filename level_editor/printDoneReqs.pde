void printDoneReqs()
{
  int z = 0;
  for(float[] coords : playerCoords)
  {
    float reqX = coords[0];
    float reqY = coords[1];
    float reqW = coords[2];
    float reqH = coords[3];
    //if(!isEmpty(coords))
    //{
      if(z==0)
      {
        //print("//Gebruik deze variabelen in de checkDone functie van Player");
        print("\n"+reqX);
        print("\n"+reqY);
        output.println(reqX+"\n"+reqY);
      }
      else
      {
        //print("\n\n//Gebruik deze variabelen voor de Main rectangle van Player");
        print("\n"+reqX);
        print("\n"+reqY);
        print("\n"+reqW);
        print("\n"+reqH);
        output.println(reqX);
        output.println(reqY);
        output.println(reqW);
        output.println(reqH);
      }
      /*
      else if(z > 1)
      {
        //print("\n\n//Restanten Player rectangles");
        //print("\nrect("+reqX+","+reqY+","+reqW+","+reqH+");");
        //print("float[][] playerRects = {"+reqX+","+reqY+","+reqW+","+reqH+"}");
          //String tempString = Arrays.toString(playerRect);
          //String playerString = "{"+tempString.substring(1,tempString.length()-1)+"},";
          print("\n"+reqX);
          print("\n"+reqY);
          print("\n"+reqW);
          print("\n"+reqH);
          //strPlayerRects += playerString;
      }*/
    //}
    z++;
  }
  //print("\n//REMEMBER TO REMOVE THE LAST COMMA");
  //print("\nplayer.restCoords = new float[][]\n{\n"+strPlayerRects+"\n};");
  
  //print("\n\n//dit zijn de blocks die je net hebt gemaakt:\n");
  //print("noStroke();\n");
  //print("fill("+(int)redVal+","+
                //(int)greenVal+","+
                //(int)blueVal+
                //");\n");
  for(float[] coords : blockCoords)
  {
    print("\n"+coords[0]);
    print("\n"+coords[1]);
    print("\n"+coords[2]);
    print("\n"+coords[3]);
    output.println(coords[0]);
    output.println(coords[1]);
    output.println(coords[2]);
    output.println(coords[3]);
    
    if(!isEmpty(coords))
    {
      String coordsString = Arrays.toString(coords);
      String rectString = coordsString.substring(1,coordsString.length()-1);
      //print("rect("+rectString+");\n");
    }
  }
}