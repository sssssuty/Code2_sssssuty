class Brick{
  PVector pos;
  
  Brick(){
    pos = new PVector(100, 100);
  }

  void display(){
      fill(255);
      noStroke();
      rect(pos.x, pos.y, 100, 25);
  }
  
  void checkCollision2(){
   //bottom
  if (((ball.pos.x+25) > brick.pos.x) && (ball.pos.x < (brick.pos.x+100)) &&
    ball.pos.y < (brick.pos.y+25)){
    ball.vel.y = -ball.vel.y;
  }
  //
  if (((ball.pos.x+25) > brick.pos.x) && (ball.pos.x < (brick.pos.x+100)) &&
    (ball.pos.y+25) > brick.pos.y){
    ball.vel.y = -ball.vel.y;
  }
  
    if (ball.pos.y > 600){
    exit(); 
  }
  
  }
}

 
