void printDoneReqs()
{
  int z = 0;
  print("//gebruik deze variabelen als criteria om de puzzel af te maken\n\n");
  for(float[] coords : playerCoords)
  {
    float reqX = coords[0];
    float reqY = coords[1];
    float reqW = coords[2];
    float reqH = coords[3];
    
    if(reqX+reqY+reqW+reqH == 0.0)
    {
      print("//rect "+z+":");
      print("\nfloat reqX"+z+" = "+reqX+
            ";\nfloat reqY"+z+" = "+reqY+
            ";\nfloat reqW"+z+" = "+reqW+
            ";\nfloat reqH"+z+" = "+reqH+
            ";\n\n");
      z++;
    }
  }
  
  print("//dit zijn de blocks die je net hebt gemaakt:\n");
  print("noStroke();\n");
  print("fill("+(int)redVal+","+
                (int)greenVal+","+
                (int)blueVal+
                ");\n");
  for(float[] coords : blockCoords)
  {
    if(coords[0]+coords[1]+coords[2]+coords[3] != 0.0)
    {
      String coordsString = Arrays.toString(coords);
      String rectString = coordsString.substring(1,coordsString.length()-1);
      print("rect("+rectString+");\n");
    }
  }
}