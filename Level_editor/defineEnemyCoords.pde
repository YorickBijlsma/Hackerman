void defineEnemyCoords()
{
  enemyX = mouseX;
  enemyY = mouseY;
  doneEnemyDrawing = true;
  println("yo");
}

void drawEnemies()
{
  fill(255,0,0);
  for(float[] c : enemyCoords) if(!isEmpty(c)) ellipse(c[0], c[1], 10, 10); //draw a circle for every enemy
}