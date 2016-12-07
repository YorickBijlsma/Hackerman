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
boolean showStartScreen = true;


int drawbackground = 0;
color HUDcolour = color(193, 134, 255);
color red   = color(255, 0, 0);
color green = color(0, 255, 0);
color blue  = color(0, 0, 255);

ArrayList<EnemyDOT>    DOTenemies = new ArrayList<EnemyDOT>();
ArrayList<Package>     packages   = new ArrayList<Package>();
ArrayList<EnemyAdware> adwares    = new ArrayList<EnemyAdware>();
ArrayList<Worm>        worms      = new ArrayList<Worm>();
ArrayList<Malware>     malwares   = new ArrayList<Malware>();
ArrayList<Ad>          ads        = new ArrayList<Ad>();

Player player = new Player();                  //a player object, for all rectangles the player controls
Score score = new Score();

float[][] wallCoords   = new float[30][4];     //a 30 slot 2d array, each subarray having 4 slots. this is for the maximum of 30 wall blocks
float[][] puzzleCoords = new float[20][4];     //a 20 slot 2d array, each subarray having 4 slots. this is for the maximum of 20 puzzle blocks
float[][] enemyCoords  = new float[12][2];     //12 enemies of which x and y are known

final int puzzleDoneMargin       = 30;                //you need be within 30 pixels of the actual puzzle requirement to finish it
final int gameRestartTimeAmount  = 150;
int gameRestartTimer       = 0;

int levelNumber = 1;
int levelWait   = 40;

PImage entryScreen; 
PImage deathScreen;

void setup()
{
  entryScreen = loadImage("start_screen.png");
  deathScreen = loadImage("death_screen.png");
  size(1250, 703);

  loadLevel(levelNumber);

  EnemyAdware xnx = new EnemyAdware(width-50, 100);
  adwares.add(xnx);
}

void draw()
{
  drawGame();
  updateGame();
  doneRoutine();
}

void drawHUD()
{
  textAlign(LEFT);
  textSize(32);

  fill(HUDcolour);
  text("Time left: " + secondsLeft, width - 250, 40);
  text("Score : " + score.totalScore, 625, 40);

  fill(player.healthColour);
  text("Health: " + player.health, 10, 40);
}

void drawGameenemies()
{
  background(0);
  for (int iEnemy=0; iEnemy<DOTenemies.size (); iEnemy++)   DOTenemies.get(iEnemy).draw();
  fill(color(255, 255, 255));
}

void drawenemies()
{
  drawGameenemies();

  t = frameCount/frameRate;
}