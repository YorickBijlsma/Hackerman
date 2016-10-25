boolean isEmpty(float[] set)
{
  float total = 0;
  for(float item : set)
  {
    total += item;
  }
  if (total == 0.0)
  {
    return true;
  }
  else{ return false; }
}