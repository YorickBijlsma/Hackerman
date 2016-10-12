
//while true, array rectangles at index i becomes new rectangle where you clicked( x&y , w , h )
//if you enter 'done' in the console, it prints out the array of coords per rect

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