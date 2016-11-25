import java.util.Objects;
import java.util.Arrays;
import java.io.File;

int slowMove = 0;
int stall = 0;
boolean done;

Player player = new Player();                  //a player object, for all rectangles the player controls
//Worm worm = new Worm(800,200);

float[][] wallCoords = new float[30][4];       //a 30 slot 2d array, each subarray having 4 slots. this is for the maximum of 30 wall blocks
float[][] puzzleCoords = new float[20][4];     //a 20 slot 2d array, each subarray having 4 slots. this is for the maximum of 20 puzzle blocks

ArrayList<Worm> worms = new ArrayList<Worm>();

int levelNumber = 1;
int levelWait = 150;

void setup()
{
  size(1024,576);
  loadLevel(levelNumber);
}

void draw()
{
 drawGame();
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