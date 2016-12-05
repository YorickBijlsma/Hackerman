import java.util.Objects;
import java.util.Arrays;
import java.io.File;
import java.lang.Math;

int slowMove = 0;
int stall    = 0;
boolean done = false;
int nEnemies = 5;
float t      = 0.0; 
int health   = 100;
int loadlevels = 0;
PImage bg;
PImage bgPLAY;
PImage bgEXIT;
int drawbackground = 0;

ArrayList<EnemyDOT> DOTenemies = new ArrayList<EnemyDOT>();
ArrayList<Package> packages    = new ArrayList<Package>();
ArrayList<EnemyAdware> adwares = new ArrayList<EnemyAdware>();
ArrayList<Worm> worms          = new ArrayList<Worm>();

Player player = new Player();                  //a player object, for all rectangles the player controls
Score score = new Score();

float[][] wallCoords   = new float[30][4];     //a 30 slot 2d array, each subarray having 4 slots. this is for the maximum of 30 wall blocks
float[][] puzzleCoords = new float[20][4];     //a 20 slot 2d array, each subarray having 4 slots. this is for the maximum of 20 puzzle blocks
float[][] enemyCoords  = new float[12][2];     //12 enemies of which x and y are known

final int puzzleDoneMargin = 30;                //you need be within 5 pixels of the actual puzzle requirement to finish it

int levelNumber = 1;
int levelWait = 40;

void setup()
{
  size(1250,703);
  if ((int) loadlevels == 1) {
    loadLevel(levelNumber);
    setupGame();
  }
    EnemyDOT xnx = new EnemyDOT(200,200);
    DOTenemies.add(xnx);
}

void draw()
{
  background(bg);
  if (loadlevels == 0) {
    if (keyPressed && key == 'z'){
      loadlevels = 1;
    }
    else if (keyPressed && key == 'x'){
exit();
} 
  
 if (loadlevels == 1) {
    drawGame();
    if (!player.done) //player hasn't completed the puzzle
    {
      updateGame();
    } else             //player has completed the puzzle
    {
      player.done = false;
      doneRoutine();
      if (player.beatGame) text("Congratulations, you have bexeaten the game. Your score is ...", width/2, height/2);
    }
 }
  }
  
 fill(player.colour);
 drawClock();
 score.drawScore();
}

void setupenemies()
{  
  size(1024, 576);
}

void drawGameenemies()
{
  background(0);
  text("Health: " + health, 10, 30);

  for (int iEnemy=0; iEnemy<DOTenemies.size (); iEnemy++)   DOTenemies.get(iEnemy).draw();

  fill(color(255, 255, 255));
}

void drawenemies()
{
  drawGameenemies();
 
  t = frameCount/frameRate;
}