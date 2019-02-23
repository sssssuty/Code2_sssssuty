class Brick{
  PVector pos;
  
  Brick(){
    pos = new PVector(10, 10);
  }

  void display(){
      fill(255);
      noStroke();
      rect(pos.x, pos.y, 100, 25);
  }
  
  void checkCollision2(){
   //bottom + top
  if (((ball.pos.x+25) > brick.pos.x) && (ball.pos.x < (brick.pos.x+100)) &&
    ball.pos.y < (brick.pos.y+25) && (ball.pos.y+25) > brick.pos.y){
    ball.vel.y = -ball.vel.y;
  }
  //sides
  if ((ball.pos.y < (brick.pos.y + 25)) && ((ball.pos.y + 25) > brick.pos.y) && 
      ((ball.pos.x + 25) > brick.pos.x) && (ball.pos.x < (brick.pos.x + 100)) ){
      ball.vel.x = ball.vel.x;
  }
  
    if (ball.pos.y > 600){
    exit(); 
  }
  
  }
}

 
