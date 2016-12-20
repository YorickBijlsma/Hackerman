/*space for writing general comments on the code
 
 every resource involving numbers (score, time, health etc.) should be float, but drawn as int.
 this gives us more control over handling these numbers, as we can be more precise due to the nature of float
 drawing the numbers as int is important as this removes the fraction floats have, which is ugly on screen
 
 basic program flow
 
 *just once:
 *initialize things like score, leaderboard and timer
 
 *loop indefinitely
 *load level at the index, levels have player, enemies, wall information
 *loop until player has completed level
 *update player depending on input
 *update enemies depending on behaviour
 *draw everything in the room
 *if player coordinates match with done requirement coordinates, break loop
 *increment level index, wrap around if nonexistent
 */
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
boolean savedBestScoresThisLevel = false;
int levelNumber = 1;
int gameState = 0; //0 = starmenu, 1 = game, 2 = exitgame

int drawbackground = 0;
color HUDcolour = color(255, 201, 14);
color red   = color(255, 0, 0);
color green = color(0, 255, 0);
color blue  = color(0, 0, 255);

ArrayList<Virus>       vira = new ArrayList<Virus>();
ArrayList<Package>     packages   = new ArrayList<Package>();
ArrayList<EnemyAdware> adwares    = new ArrayList<EnemyAdware>();
ArrayList<Worm>        worms      = new ArrayList<Worm>();
ArrayList<Malware>     malwares   = new ArrayList<Malware>();
ArrayList<Ad>          ads        = new ArrayList<Ad>();
//ArrayList<ParticleSystem>    particles  = new ArrayList<ParticleSystem>();

ParticleSystem playerDamageParticle = new ParticleSystem(0,0);


//setup prerequisites
Player player           = new Player();                  
Score score             = new Score();
Leaderboard leaderboard = new Leaderboard();

float[][] wallCoords   = new float[30][4];     //a 30 slot 2d array, each subarray having 4 slots. this is for the maximum of 30 wall blocks
float[][] puzzleCoords = new float[20][4];     //a 20 slot 2d array, each subarray having 4 slots. this is for the maximum of 20 puzzle blocks
float[][] enemyCoords  = new float[12][2];     //12 enemies of which x and y are known
//int[] lastFiveScores = {0, 0, 0, 0, 0};


//game constants
final int PUZZLEDONEMARGIN       = 40;                
final int AMOUNTOFLEVELS         = 6;
final int LEVELWAIT              = 150;
final int TIMELEVEL              = 10;

PImage   entryScreen, deathScreen, wallSprite, leaderboardImage, scoreAdditionImage, 
         wallSpritesheet, playerInjuredSprite, puzzleDoneSprite, playerSpriteNormal,
         playerSpriteDone, adwareSprite, virusSprite, malwareSprite;
PImage[] adwareSprites;
PFont    regularFont;

File bestScoresEver = new File("best_5_scores.txt");

void setup()
{
  size(1250, 702);
  regularFont = loadFont("regular_font.vlw");
  textFont(regularFont);
  
  loadAllImages();
  loadAllSounds();
  leaderboard.loadBestScores();
  loadLevel(levelNumber);
  timerInit();
}

void draw()
{
  runGame();
  println(frameRate);
}




void drawHUD()
{
  drawClock();
  textSize(32);
  //color timeLeftColour = color((int) random(155,255));          //random colour between 155 and 255 RGB
  leaderboard.draw();
  fill(255);
  textSize(24);
  //text(secondsLeft, player.mainX-5, player.mainY-5);

  
  if (!player.done)      //draw leaderboard and score in top right if player isnt done (player.done is handled in doneRoutine)
  {
    textSize(30);
    fill(HUDcolour);
    text("Score : " + (int)score.totalScore, leaderboard.x-125, leaderboard.padding);
  }
  if(player.hit)
  {
    image(playerInjuredSprite,0,0);
  }

  fill(player.healthColour);
  float textSize = (int)  (player.mainW/2) + (player.mainH/2) /23;
  textSize(textSize);
  //textAlign(CENTER);
  text((int)player.health, player.mainX, player.mainY+(player.mainH/2));
}

void drawScoreAddition()
{
  textSize(48);
  fill(red);
  image(scoreAdditionImage, (width/2)-(344/2), (height/2)-(358/2));

  text((int)score.oldScore, 678, 228);
  text((int)score.timePoints, 678, 304);
  text((int)score.scorePoints, 678, 382);

  float newScore = (int) score.calculateScore();
  textSize(64);
  text((int)score.calculateScore(), 540, 490);
}