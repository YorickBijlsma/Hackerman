//add class PlayerBlock inheriting from PuzzleBlock in that it has
//x,y,w,h (and can be made by this) but can move and rotate
import java.util.Arrays;
import java.util.Objects;
//define a class PuzzleBlock.
//PuzzleBlocks are made of an arbitrary number of rect's.
//the rects are made by pointing and clicking

//1st click
//make new PuzzleBlock
//determine x and y, save to PuzzleBlock
float rectCoords[] = {};
float x, y, w, h = 0;
float currentX, currentY, currentW, currentH;
boolean doneBlockDrawing = false;
boolean donePlayerDrawing = false;
int blockAmount = 0;
color colour = color(0,0,255);
float redVal, greenVal = 0;
float blueVal = 255;
int blockCoordCount = 0;
int playerCoordCount = 0;

String editType = new String();

//max 20 rects
float[][] blockCoords =   {
                          {0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},
                          {0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},
                          {0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},
                          {0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},
                          {0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},
                          };
                          
//starting out with 1 rect surface as done criterium                          
float[] playerCoords = {0.0,0.0,0.0,0.0};

//coords for criterium puzzle finish
float doneX , doneY, doneW, doneH = 0;
                          
PFont font;

void setup()
{
  editType = ("block");
 size(1024,432);
 background(255);
 fill(255,0,0);
 font = createFont("Arial",12,true);
}

void draw()
{
  background(255);
  drawGrid();
  drawPuzzleBlocks();
  drawPlayer();
  
  getKeyboard();
  addRectCoords();
  addPlayerCoords();
  drawTexts();
}

void exitEditor()
{
  
  printDoneReqs();
  
  print("//dit zijn de vormen die je net hebt gemaakt:\n");
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
    }
  }
  exit();
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


//switch to editing player-done-requirement coords and back to block coords
void keyReleased()
{
  if(key == 'p')
  {
    if(Objects.equals(editType,"block")){ editType = "player"; }
    else if(Objects.equals(editType,"player")){ editType = "block"; }
  }
}



void mousePressed()
{
  if(mouseButton==LEFT)
  {
    if(editType=="block"){defineRect(); }
    else if(editType=="player"){definePlayerCoords(); }
  }
  else if(mouseButton==RIGHT)
  {
    removeRect();
  }
}

void addRectCoords()
{   
  if(doneBlockDrawing)
  {
    if(blockAmount<blockCoords.length)
    {
      float[] currentBlockStats = {x,y,w,h};
      float[] newBlockStats = snapRect(currentBlockStats);
      blockCoords[blockAmount] = newBlockStats;
      doneBlockDrawing = false;
      blockAmount++;
      
    }else{text("You're out of blocks.",width/2,height/2);}
  }
}
void addPlayerCoords()
{
if(donePlayerDrawing)
  {
    //if(playerCoords[0]+playerCoords[1]+playerCoords[2]+playerCoords[3] == 0.0)
      float[] currentPlayerStats = {doneX,doneY,doneW,doneH};
      float[] newPlayerStats = snapRect(currentPlayerStats);
      playerCoords = newPlayerStats;
      donePlayerDrawing = false;
  }
}



void drawTexts()
{
  String xc = new String();
  String yc = new String();
  String blocksLeft = new String();
  String exitHint = new String();
  String colours = new String();
  String resetHint = new String();
  String editing = new String();
  
  xc = ("x pos: " +  mouseX);
  yc = ("y pos: " + mouseY);
  blocksLeft = ("Blocks left: "+(blockCoords.length-blockAmount));
  exitHint = ("Press q to quit");
  colours = ("Colours:\nb - blue \n r - red \n g - green");
  resetHint = ("Press c to clear screen");
  editing = ("editing:"+editType);
  
  textFont(font,12);
  fill(0);
  text(xc,10,10);
  text(yc,10,30);
  text(blocksLeft,10,50);
  text(exitHint,10,height-15);
  text(resetHint,10,height-35);
  text(colours,width-60,height-85);
  text(editing,10,height-200);
}