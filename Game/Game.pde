import java.util.Objects;
import java.util.Arrays;
import java.io.File;

int slowMove = 0;
int stall = 0;
boolean done;
int nEnemies = 5;
float t = 0.0; 
int health = 100;

ArrayList<EnemyDOT> DOTenemies = new ArrayList<EnemyDOT>();
ArrayList<Package> packages = new ArrayList<Package>();

Player player = new Player();                  //a player object, for all rectangles the player controls
//Worm worm = new Worm(800,200);

float[][] wallCoords = new float[30][4];       //a 30 slot 2d array, each subarray having 4 slots. this is for the maximum of 30 wall blocks
float[][] puzzleCoords = new float[20][4];     //a 20 slot 2d array, each subarray having 4 slots. this is for the maximum of 20 puzzle blocks

ArrayList<Worm> worms = new ArrayList<Worm>();
final int puzzleDoneMargin = 5;                //you need be within 5 pixels of the actual requirement for the puzzle to finish it

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
 //drawGameenemies();
 if(!player.done) //player hasn't completed the puzzle
 {
   updateGame();
 }
 else  //player has completed the puzzle
 {
   player.done = false;
   doneRoutine();
   if(player.beatGame) text("Congratulations, you have beaten the game. Your score is ...",width/2,height/2);
 }

 fill(player.colour);
}

void setupenemies() {  
  size(1024, 576);

  
  /*
  for (int iEnemy=0; iEnemy<enemies.size (); iEnemy++) {
    Enemy anEnemy = enemies.get(iEnemy); // Fetch a single enemy from the enemies ArrayList
  }*/
}

void drawGameenemies() {
  background(0);
  text("Health: " + health, 10, 30);

 
  
  
  for (int iEnemy=0; iEnemy<DOTenemies.size (); iEnemy++)
    DOTenemies.get(iEnemy).draw();

  fill(color(255, 255, 255));
}

void drawenemies() {
  drawGameenemies();
 
  t = frameCount/frameRate;
}