import java.util.Objects;
import java.util.Arrays;

int slowMove = 0;
int stall = 0;
boolean done;

Player player = new Player();                  //a player object, for all rectangles the player controls
float[][] wallCoords = new float[30][4];       //a 30 slot 2d array, each subarray having 4 slots. this is for the maximum of 30 wall blocks
float[][] puzzleCoords = new float[20][4];     //a 20 slot 2d array, each subarray having 4 slots. this is for the maximum of 20 puzzle blocks

int levelNumber = 1;
int levelWait = 150;

void setup()
{
  size(1024,432);
  loadLevel(levelNumber);
}

void draw()
{
 noStroke();
 background(255);
 drawEnvironment();
 player.makeRects(); 

 if(!player.done) //player hasn't completed the puzzle
 {
   runGame();
 }
 else  //player has completed the puzzle
 {
   player.done = false;
   doneRoutine();
   if(player.beatGame) text("Congratulations, you have beaten the game. Your score is ...",width/2,height/2);
 }

 fill(player.colour);
}