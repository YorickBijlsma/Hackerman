boolean isEmpty(float[] set)
{
  float total = 0;
  
  for(float item : set)
  {
    total += item;
  }
  return total == 0.0;
}