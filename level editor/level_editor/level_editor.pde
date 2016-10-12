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
color colour = color(0,0,0);

//max 10 rects
float[][] blockCoords =   {
                          {0.0,0.0,0.0,0.0},
                          {0.0,0.0,0.0,0.0},
                          {0.0,0.0,0.0,0.0},
                          {0.0,0.0,0.0,0.0},
                          {0.0,0.0,0.0,0.0},
                          {0.0,0.0,0.0,0.0},
                          {0.0,0.0,0.0,0.0},
                          {0.0,0.0,0.0,0.0},
                          {0.0,0.0,0.0,0.0},
                          {0.0,0.0,0.0,0.0},
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
  switchColours();
  runEditor();
  makeRects();
  drawCoords();
  
}

void runEditor()
{
  //mods[index++] = new Module(x*unit, y*unit, unit/2, unit/2, random(0.05, 0.8), unit);
  if(keyPressed)
  {
    if(key=='q')
    {
      //print(blockCoords);
      for(float[] coords : blockCoords)
      {
        if(coords[0]+coords[1]+coords[2]+coords[3] != 0.0)
        {
          String coordsString = Arrays.toString(coords);
          print(coordsString+"\n");
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
      //PuzzleBlock puzzleblock = new PuzzleBlock(c[0],c[1],c[2], c[3]);
      fill(colour);
      noStroke();
      rect(c[0],c[1],c[2],c[3]);
    }
  }
}



int coordCount = 0;
void mousePressed()
{
  if(coordCount == 0)
  {
    x = mouseX;
    y = mouseY;
    rect(x,y,3,3);
    coordCount++;
  }
  
  else if(coordCount == 1)
  {
    w = -(x-mouseX);
    rect(x,y,w,3);
    coordCount++;
  }
  
  else if(coordCount == 2)
  {
    h = -(y-mouseY);
    point(x,y+h);
    //reset the coordinate index
    coordCount = 0;
    doneDrawing = true;
  }
}

void makeRects()
{   
  if(doneDrawing)
  {
    if(blockAmount<10)
    {
      float[] currentBlockStats = {x,y,w,h};
      blockCoords[blockAmount] = currentBlockStats;
      doneDrawing = false;
      println(blockCoords[blockAmount]);
     
      blockAmount += 1;
      
    }else{text("You're out of blocks.",width/2,height/2);}
  }
}

void drawCoords()
{
  String xc = new String();
  String yc = new String();
  String blocksLeft = new String();
  String exitHint = new String();
  String colours = new String();
  
  xc = ("x pos: " +  mouseX);
  yc = ("y pos: " + mouseY);
  blocksLeft = ("Blocks left: "+(blockCoords.length-blockAmount));
  exitHint = ("Press q to quit");
  colours = ("Colours:\n w - white \n b - blue \n r - red \n g - green");
              
  
  textFont(font,12);
  fill(0);
  text(xc,10,10);
  text(yc,10,30);
  text(blocksLeft,10,50);
  text(exitHint,10,height-10);
  text(colours,width-60,height-80);
}
  
void switchColours()
{
  if(keyPressed)
  {
    switch(key)
    {
      case 'w': colour = color(255,255,255); break;
      case 'b': colour = color(0,0,255); break;
      case 'r': colour = color(255,0,0); break;
      case 'g': colour = color(0,255,0); break;
    }
  }
}