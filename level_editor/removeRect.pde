void removeRect(float[][] coordinates)
{
  for(float[] coord : coordinates)
  {
    //mouse position is larger than x and y of current rect
    if(mouseX >= coord[0] && mouseY >= coord[1])
    {
      //mouse position does not exceed width and height of current rect
      if(mouseX <= (coord[0]+coord[2]) && mouseY <= (coord[1] + coord[3]))
      {  
        //empty out the current coordinates       
        coord[0] = 0.0; coord[1]= 0.0; coord[2] = 0.0; coord[3]= 0.0;
        //allow the user to draw a new block in the now empty slot
        if(Objects.equals(editType,"puzzle")){ blockAmount--; }
        else if(Objects.equals(editType,"player")){ playerAmount--; }
      }
    }
  }
}