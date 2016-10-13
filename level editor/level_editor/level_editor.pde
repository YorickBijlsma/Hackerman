//add class PlayerBlock inheriting from PuzzleBlock in that it has
//x,y,w,h (and can be made by this) but can move and rotate
import java.util.Arrays;
//define a class PuzzleBlock.
//PuzzleBlocks are made of an arbitrary number of rect's.
//the rects are made by pointing and clicking

//1st click
//make new PuzzleBlock
//determine x and y, save to PuzzleBlock
float rectCoords[] = {};
float x, y, w, h = 0;
boolean doneDrawing = false;
int blockAmount = 0;
color colour = color(0,0,255);
float redVal, greenVal = 0;
float blueVal = 255;

//max 20 rects
float[][] blockCoords =   {
                          {0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},
                          {0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},
                          {0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},
                          {0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},
                          {0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},
                          };
PFont font;

void setup()
{
 size(1024,432);
 background(255);
 fill(255,0,0);
 font = createFont("Arial",12,true);
}

void draw()
{
  background(255);
  drawGrid();
  switchColours();
  runEditor();
  makeRects();
  drawMouseCoords();
}

void runEditor()
{
  //mods[index++] = new Module(x*unit, y*unit, unit/2, unit/2, random(0.05, 0.8), unit);
  if(keyPressed)
  {
    if(key=='q')
    {
      //allow user to copy colour of drawn rect's, also noStroke
      print("noStroke();\n");
      print("fill("+(int)redVal+","+
                  (int)greenVal+","+
                  (int)blueVal+
                  ");\n");
                  
      //print out the coordinates of the rect's user has drawn
      for(float[] coords : blockCoords)
      {
        if(coords[0]+coords[1]+coords[2]+coords[3] != 0.0)
        {
          String coordsString = Arrays.toString(coords);
          String rectString = coordsString.substring(1,coordsString.length()-1);
          print("rect("+rectString+");\n");
          //string.length() - 1
        }
        exit();
      }
    }
  }
  else
  {
      drawPuzzleBlocks();     
  }
}

void drawPuzzleBlocks()
{
  for(float[] c : blockCoords)
  {
    if(c[0]+c[1]+c[2]+c[3] != 0.0)
    {
      fill(colour);
      noStroke();
      rect(c[0],c[1],c[2],c[3]);
    }
  }
}

int coordCount = 0;
void mousePressed()
{
  if(mouseButton==LEFT)
  {
    defineRect();
  }
  else if(mouseButton==RIGHT)
  {
    removeRect();
  }
}

void makeRects()
{   
  if(doneDrawing)
  {
    if(blockAmount<blockCoords.length)
    {
      float[] currentBlockStats = {x,y,w,h};
      float[] newBlockStats = snapRect(currentBlockStats);
      blockCoords[blockAmount] = newBlockStats;
      doneDrawing = false;
      //println(blockCoords[blockAmount]);
      blockAmount += 1;
      
    }else{text("You're out of blocks.",width/2,height/2);}
  }
}

void drawMouseCoords()
{
  String xc = new String();
  String yc = new String();
  String blocksLeft = new String();
  String exitHint = new String();
  String colours = new String();
  String resetHint = new String();
  
  xc = ("x pos: " +  mouseX);
  yc = ("y pos: " + mouseY);
  blocksLeft = ("Blocks left: "+(blockCoords.length-blockAmount));
  exitHint = ("Press q to quit");
  colours = ("Colours:\nb - blue \n r - red \n g - green");
  resetHint = ("Press c to clear screen");
  
  textFont(font,12);
  fill(0);
  text(xc,10,10);
  text(yc,10,30);
  text(blocksLeft,10,50);
  text(exitHint,10,height-10);
  text(resetHint,10,height-30);
  text(colours,width-60,height-80);
}