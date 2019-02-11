class Bricks{
  int gridW = 6;
  int gridH = 5;
  float[][] xPositions = new float[gridW][gridH];
  float[][] yPositions = new float[gridW][gridH];
  PVector[] posArray = new PVector [30];
  PVector pos;
  
  Bricks(){
    pos = new PVector();
    for (int i = 0; i < gridW; i++) {
    for (int j = 0; j < gridH; j++) {
      xPositions[i][j] = map(i, 0, gridW, 20, width);
      yPositions[i][j] = map(j, 0, gridH, 0, height/3);
    }
    }
  }

  void display(){
    
    for (int i = 0; i < gridW; i++) {
    for (int j = 0; j < gridH; j++) {
      stroke(255);
      noFill();
      pos.x = xPositions[i][j];
      pos.y = yPositions[i][j];
      rect(pos.x, pos.y, 100, 25);
      
       if ((ball.pos.x + ball.s) > bricks.xPositions[i][j] && ball.pos.x <(bricks.xPositions[i][j] +100) &&
        (ball.pos.y > (bricks.yPositions[i][j]+25)) && ball.pos.y < bricks.yPositions[i][j]){
        ball.vel.y = -ball.vel.y;
        ball.vel.x = -ball.vel.x;
  }
    }
    }
  }

}
