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
        print("Gebruik deze variabelen in de checkDone functie van Player");
        print("\nfloat reqX = "+reqX);
        print("\nfloat reqY = "+reqY);
      }
      else if(z==1)
      {
        print("\n\nGebruik deze variabelen voor de Main rectangle van Player");
        print("\nfloat mainX = "+reqX);
        print("\nfloat mainY = "+reqY);
        print("\nfloat mainW = "+reqW);
        print("\nfloat mainH = "+reqH);
      }
      else
      {
        print("\n\nRestanten Player rectangles");
        print("\nrect("+reqX+","+reqY+","+reqW+","+reqH+");");
      }
    }
    z++;
  }
  
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