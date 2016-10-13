void removeRect()
{
  for(float[] coord : blockCoords)
  {
    if(mouseX >= coord[0] && mouseY >= coord[1])
    {
      if(mouseX <= (coord[0] +coord[2]) && mouseY <= (coord[1] + coord[3]))
      {  
        //empty out the current coordinates       
        coord[0] = 0.0; coord[1]= 0.0; coord[2] = 0.0; coord[3]= 0.0;
        blockAmount--;
      }
    }
  }
}