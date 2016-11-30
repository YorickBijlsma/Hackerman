import java.util.Objects;
import java.util.Arrays;
import java.io.File;

int slowMove = 0;
int stall    = 0;
boolean done = false;
int nEnemies = 5;
float t      = 0.0; 
int health   = 100;

ArrayList<EnemyDOT> DOTenemies = new ArrayList<EnemyDOT>();
ArrayList<Package> packages    = new ArrayList<Package>();
ArrayList<EnemyAdware> adwares = new ArrayList<EnemyAdware>();
ArrayList<Worm> worms          = new ArrayList<Worm>();

Player player = new Player();                  //a player object, for all rectangles the player controls

float[][] wallCoords = new float[30][4];       //a 30 slot 2d array, each subarray having 4 slots. this is for the maximum of 30 wall blocks
float[][] puzzleCoords = new float[20][4];     //a 20 slot 2d array, each subarray having 4 slots. this is for the maximum of 20 puzzle blocks

final int puzzleDoneMargin = 5;                //you need be within 5 pixels of the actual puzzle requirement to finish it

int levelNumber = 1;
int levelWait = 150;

void setup()
{
  size(1024,576);
  loadLevel(levelNumber);
  setupGame();
}

void draw()
{
 drawGame();
 if(!player.done) //player hasn't completed the puzzle
 {
   updateGame();
 }
 else             //player has completed the puzzle
 {
   player.done = false;
   doneRoutine();
   if(player.beatGame) text("Congratulations, you have beaten the game. Your score is ...",width/2,height/2);
 }

 fill(player.colour);
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

void drawenemies() {
  drawGameenemies();
 
  t = frameCount/frameRate;
}