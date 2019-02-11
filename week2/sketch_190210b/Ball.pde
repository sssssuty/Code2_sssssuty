class Ball{
   PVector pos, vel;
   int s;
   
   Ball(){
     pos = new PVector(width/2, height/2);
     vel = new PVector(random(-5,5), 4);
   }

  void display(){
    s = 25;
    fill(255);
    rect(pos.x, pos.y, s, s);
  }
  
  void update(){
    pos.add(vel);
  }
  
  //  void checkCollision(Paddle p) {
  //  if (ball.pos.x < (p.pos.x + p.w) && 
  //    ball.pos.x > (p.pos.x) &&
  //    ball.pos.y > (p.pos.y) && 
  //    ball.pos.y < (p.pos.y + p.h)) {
  //    ball.vel.x = -ball.vel.x;
  //  }
  //}

}
