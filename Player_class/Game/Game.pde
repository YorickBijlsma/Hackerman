Player player = new Player();
int slowMove = 0;
boolean done;
import java.util.Arrays;
float reqX, reqY, mainX, mainY, mainW, mainH = 0.0;
float[][] restCoords;
float[][] puzzleCoords = new float[20][4];

void setup()
{
  size(1024,432);
  
  /*
  //Gebruik deze variabelen in de checkDone functie van Player
  player.reqX = 200.0;
  player.reqY = 140.0;

  //Gebruik deze variabelen voor de Main rectangle van Player
  player.mainX = 760.0;
  player.mainY = 40.0;
  player.mainW = 80.0;
  player.mainH = 20.0;
  
  player.restCoords = new float[][]
  {
  {760.0, 40.0, 20.0, 80.0},{720.0, 100.0, 60.0, 20.0},
  };
  */
  loadLevel("level_one.txt");
  //print(vars);
}

void draw()
{
  //print(player.reqX);
 noStroke();
 background(255);
 drawEnvironment();
 player.makeRects(); 
 done = player.checkDone();
 //print(player.reqX);
 if(done)
 {
   player.colour = color(0,255,0);
   player.xsp = 0;
   player.ysp = 0;
 }
 else
 {
   if(slowMove % 5 == 0)
       {
         player.keyReleased();
         player.keyPressed();
       }
   slowMove = slowMove % 10;
   slowMove++;
 }

 fill(player.colour);
 /*
 rect(160.0, 140.0, 40.0, 60.0);
 rect(220.0, 160.0, 60.0, 40.0);
 rect(160.0, 100.0, 120.0, 40.0);
 rect(160.0, 220.0, 60.0, 20.0);
 rect(220.0, 200.0, 60.0, 40.0);
 rect(140.0, 100.0, 20.0, 140.0);
 rect(280.0, 100.0, 20.0, 140.0);
 */
}