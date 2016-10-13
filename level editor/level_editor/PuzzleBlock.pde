/*
NOT YET IN USE 
*/
public class PuzzleBlock
{
  float x,y,h,w;
  
  PuzzleBlock(float x,float y,float h,float w)
  {
    this.x = x;
    this.y = y;
    this.h = h;
    this.w = w;
  }
  
  void displayPuzzleBlock()
  {
    rect(x,y,w,h);
  }
}