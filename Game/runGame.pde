void runGame()
{
  if(slowMove % 5 == 0) //check input every 5 frames
       {
         player.keyReleased();
         player.keyPressed();
       }
   slowMove = slowMove % 10;
   slowMove++;
}