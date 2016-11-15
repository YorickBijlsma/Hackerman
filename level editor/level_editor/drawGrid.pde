void drawGrid()
{
  stroke(100);
  int grid = 20;
  ;   for(int j = 0; j < width; j+=grid)
  {
    line (j-1, -1, j-1, height);
  }
  for (int k = 0; k < height; k+=grid)
  {
    line (-1, k-1, width, k-1);
  }
}