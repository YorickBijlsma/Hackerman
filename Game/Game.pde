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
import processing.sound.*;

int slowMove = 0;
int stall    = 0;
boolean done = false;
int nEnemies = 5;
int timer    = 0; 
int health   = 100;
boolean showStartScreen = true;
boolean savedBestScoresThisLevel = false;
int levelNumber = 5;
int gameState = 0; //0 = starmenu, 1 = game, 2 = exitgame

int drawbackground = 0;
color HUDcolour = color(255,255,255);
color red   = color(255, 0, 0);
color green = color(0, 255, 0);
color blue  = color(0, 0, 255);
color hackerGreen = color(125, 255, 45);

ArrayList<Virus>       vira       = new ArrayList<Virus>();
ArrayList<Package>     packages   = new ArrayList<Package>();
ArrayList<EnemyAdware> adwares    = new ArrayList<EnemyAdware>();
ArrayList<Worm>        worms      = new ArrayList<Worm>();
ArrayList<Malware>     malwares   = new ArrayList<Malware>();
ArrayList<Ad>          ads        = new ArrayList<Ad>();
ArrayList<HealthPickup> healthPickups = new ArrayList<HealthPickup>();
//ArrayList<SoundFile>     allSounds = new ArrayList<SoundFile>();

//ArrayList<ParticleSystem>    particles  = new ArrayList<ParticleSystem>();

boolean playingMenu, playingGameOver, playingLevelDone, showingHealSprite
        = false;



//setup prerequisites
Player player           = new Player();                  
Score score             = new Score();
Leaderboard leaderboard = new Leaderboard();
HealthPickup healthPickup;

float[][] wallCoords   = new float[30][4];     //a 30 slot 2d array, each subarray having 4 slots. this is for the maximum of 30 wall blocks
float[][] puzzleCoords = new float[20][4];     //a 20 slot 2d array, each subarray having 4 slots. this is for the maximum of 20 puzzle blocks
float[][] enemyCoords  = new float[12][2];     //12 enemies of which x and y are known
//int[] lastFiveScores = {0, 0, 0, 0, 0};


//game constants
final int PUZZLEDONEMARGIN       = 40;                
final int AMOUNTOFLEVELS         = 6;
final int LEVELWAIT              = 120; //was 120
final int TIMELEVEL              = 10;

PImage   entryScreen, deathScreen, WallSprite, leaderboardImage, scoreAdditionImage, 
         wallSpritesheet, playerInjuredSprite, puzzleDoneSprite, playerSpriteNormal,
         playerSpriteDone, adwareSprite, virusSprite, malwareSprite, Packagespritesheet, DoTcom,
         puzzleSpritesheet, puzzleSprite, healthPickupSprite, healthFeedback
         ;
PImage[] adwareSprites;
PFont    regularFont, pixelFont;

SoundFile adware, damage, gamestart, gamequit, gameover, infected, menu, mainsong, wallbump, leveldone;

File bestScoresEver = new File("best_5_scores.txt");

void setup()
{
  size(1250, 702);
  background(11, 15, 11);
  pixelFont = createFont("pixtech.ttf", 32);
  regularFont = loadFont("regular_font.vlw");
  textFont(pixelFont);
  
  loadAllImages();
  loadAllSounds();
  leaderboard.loadBestScores();
  loadLevel(levelNumber);
  timerInit();
}

void draw()
{
  runGame();
  //println(frameRate); println("x:"+mouseX); println("y:"+mouseY);
  println(levelNumber-1);
}




void drawHUD()
{
  drawClock();
  textSize(30);
  leaderboard.drawScoresPlaque(1170, 0);
  leaderboard.drawScores(1163, 42, 28, HUDcolour, 16);
  
  fill(255);
  textSize(24);
  //text(secondsLeft, player.mainX-5, player.mainY-5);

  
  if (!player.done)      //draw leaderboard and score in top right if player isnt done (player.done is handled in doneRoutine)
  {
    textSize(30);
    fill(HUDcolour);
    player.drawHealthBar();
    //text("Score : " + (int)score.totalScore, leaderboard.x-155, leaderboard.padding);  //doesnt work as leaderboard no longer has these attributes by default (they are passed to methods)
  }
  if(showingHealSprite)
  {
    image(healthFeedback,0,0);
  }
  else if(player.hit)            //using else if here because we don't want the hit feedback to go over an eventual heal feedback
  {
    image(playerInjuredSprite,0,0);
    damage.play();
  }
}

void drawScoreAddition()
{
  textSize(36);
  fill(255, 255, 180);
  int scoreX = width /2 - (344/2) - 56;
  int scoreY = height/2 - (358/2);
  easeLeftAnimation(scoreAdditionImage, scoreX, scoreY);
  
  if(easeCounter > scoreX-25)    //only draw text if easing is nearly done
  {
    text((int)score.oldScore, 676, 223);
    text((int)score.timePoints, 676, 299);
    text((int)score.scorePoints, 676, 377);
    textSize(64);
    text((int)score.calculateScore(), 540, 490);
  }
  float newScore = (int) score.calculateScore();
}