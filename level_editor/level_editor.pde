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
float wallX, wallY, wallW, wallH;
float enemyX, enemyY;



color colour = color(0,0,255);
float redVal, greenVal = 0;
float blueVal = 255;

int blockAmount, playerAmount, wallAmount, enemyAmount = 0;
int blockCoordCount,playerCoordCount,wallCoordCount, enemyCoordCount = 0;
boolean doneBlockDrawing, doneWallDrawing, donePlayerDrawing, doneEnemyDrawing = false;

PrintWriter outPlayer, outPuzzle, outWalls, outEnemies;


String editType = new String();
int editIndex = 0;

//max 20 rects
float[][] blockCoords =   {
/* 5 x 4 = 20 indexes*/   {0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},
                          {0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},
                          {0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0}, 
                          {0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0}, 
                          {0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0}, //
                          };
                          
//starting out with 1 rect surface as done criterium                          
float[][] playerCoords = {
                         {0.0,0.0,0.0,0.0}, //the first array will hold the requirement coordinates
                         {0.0,0.0,0.0,0.0}, //the second array will hold the main player block
                                            //they will be compared and if they match, puzzle is done
                         
                         //surplus arrays will be used to store other player rectangles (will all move at the same time as main player rect)
                         {0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},
                         {0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0}
                         };
                         
float[][] wallCoords =    {
/*30 indexes*/            {0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},
                          {0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},
                          {0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},
                          {0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},
                          {0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0}, 
                          {0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0}, 
                          {0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0} 
                          };
                                                 
float[][] enemyCoords =   {
                          {0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},
                          {0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},
                          {0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},
                          };
                       
                         
float[][] playerRects =//for printing surplus player rects
{{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0},{0.0,0.0,0.0,0.0}};    
String strPlayerRects = new String();


//coords for criterium puzzle finish
float doneX , doneY, doneW, doneH = 0;

int levelNumber = 1;
String filepath = "data/";  //open a new directory for the current level data to be written to
                          
PFont font;
//File savepath = new File(
//"C:\Users\Yorick\Desktop\Programming\processing-3.1.1\SCRIPTS\School\FYS Brightly Coloured Lines\FYS\Player_class\Game\data"
//);


void setup()
{
  editType = ("puzzle");
  //output = createWriter("level_"+levelNumber+".txt");
  size(1024,432);
  background(255);
  fill(255,0,0);
  font = createFont("Arial",15,true);
}

void draw()
{
  background(255);
  drawAll();
  getInput();
}

void drawAll()
{
  drawGrid();
  drawPuzzleBlocks();
  drawPlayer();
  drawWalls();
}
void getInput()
{
  getKeyboard();
  addRectCoords();
  addPlayerCoords();
  addWallCoords();
  drawTexts();
}

void exitEditor()
{
  printDoneReqs();
  levelNumber++;
  editType = ("puzzle");
  clearScreen();
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
    //if(Objects.equals(editType,"puzzle")){ editType = "player"; }
    //else if(Objects.equals(editType,"player")){ editType = "puzzle"; }
    editIndex++;
    editIndex = editIndex % 4;
    if     (editIndex == 0) editType = "puzzle";
    else if(editIndex == 1) editType = "player";
    else if(editIndex == 2) editType = "walls";
    else if(editIndex == 3) editType = "enemies";
  }
  if(key == 'q')
  {
    exitEditor();
  }
}

void mousePressed()
{
  if(mouseButton==LEFT)
  {
    if(editType=="puzzle")        defineRectCoords(); 
    else if(editType=="player")   definePlayerCoords(); 
    else if(editType=="walls")    defineWallCoords(); 
    else if(editType=="enemies")  defineEnemyCoords();
  }
  else if(mouseButton==RIGHT)
  {
    if(editType=="puzzle")        removeRect(blockCoords); 
    else if(editType=="player")   removeRect(playerCoords); 
    else if(editType=="walls")    removeRect(wallCoords); 
    else if(editType=="enemies")  removeRect(enemyCoords);
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
    }
    else
    {
      fill(0);
      text("You're out of blocks.",width/2,height/2);
    }
  }
}
void addPlayerCoords()
{
if(donePlayerDrawing)
  {
    if(playerAmount<playerCoords.length)
    {
      //if(playerCoords[0]+playerCoords[1]+playerCoords[2]+playerCoords[3] == 0.0)
        float[] currentPlayerStats = {doneX,doneY,doneW,doneH};
        float[] newPlayerStats = snapRect(currentPlayerStats);
        playerCoords[playerAmount] = newPlayerStats;
        donePlayerDrawing = false;
        playerAmount++;
    }
    else
    {
      fill(0);
      text("You're out of player blocks.",width/2,(height/2)-50);
    }
  }
}
void addWallCoords()
{
  if(doneWallDrawing)
  {
    if(wallAmount<wallCoords.length)
    {
      float[] wallStats = {wallX,wallY,wallW,wallH};
      float[] newWallStats = snapRect(wallStats);
      wallCoords[wallAmount] = newWallStats;
      doneWallDrawing = false;
      wallAmount++;
    }
    else{ fill(0); text("You're out of wall blocks.",width/2,(height/2)-50); }
  }
}

void addEnemyCoords()
{
  if(doneEnemyDrawing)
  {
    if(enemyAmount<enemyCoords.length)
    {
      float[] enemyStats = {enemyX,enemyY};
      enemyCoords[enemyAmount] = enemyStats;
      doneEnemyDrawing = false;
      enemyAmount++;
    }
  }
}



void drawTexts()
{
  String xc = new String();
  String yc = new String();
  String blocksLeft = new String();
  String playerLeft = new String();
  String exitHint = new String();
  String colours = new String();
  String resetHint = new String();
  String editing = new String();
  
  xc = ("x pos: " +  mouseX);
  yc = ("y pos: " + mouseY);
  blocksLeft = ("Blocks left: "+(blockCoords.length-blockAmount));
  playerLeft = ("Player blocks left: "+(playerCoords.length-playerAmount));
  exitHint = ("Press q to quit");
  colours = ("Colours:\nb - blue \n r - red \n g - green");
  resetHint = ("Press c to clear screen");
  editing = ("editing:"+editType);
  strPlayerRects = ("");
  
  textFont(font,12);
  fill(0);
  text(xc,10,10);
  text(yc,10,30);
  text(blocksLeft,10,50);
  text(playerLeft,10,70);
  text(exitHint,10,height-15);
  text(resetHint,10,height-35);
  text(colours,width-60,height-95);
  text(editing,10,height-200);
}