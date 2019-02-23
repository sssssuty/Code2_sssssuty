class Brick{
  //PVector pos;
  float x, y;
  
  Brick(float x, float y){
    //pos = new PVector(100, 100);
    this.x = x;
    this.y = y;
}

  void display(){
      fill(255);
      noStroke();
      rect(x, y, 100, 25);
  }
  
  boolean checkCollision2(Ball ball){
   //bottom
  if (((ball.pos.x+25) > x) && (ball.pos.x < (x+100)) &&
    ball.pos.y < (y+25) && (ball.pos.y+25) > y){
    ball.vel.y = -ball.vel.y;
    return true;
  }
  
  //if (((ball.pos.x+25) > x) && (ball.pos.x < (x+100)) &&
  //  (ball.pos.y+25) > y){
  //  ball.vel.y = -ball.vel.y;
  //  return true;
  //}
  
    if (ball.pos.y > 600){
      exit(); 
     }
     return false;
  
  }
}

 
