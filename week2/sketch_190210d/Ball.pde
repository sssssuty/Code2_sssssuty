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
  
  void checkCollision1(){
  if ((ball.pos.x < 0) || (ball.pos.x > width-25)){
    ball.vel.x = -ball.vel.x;
  }if (ball.pos.y<0){
    ball.vel.y = -ball.vel.y;
  }if ((ball.pos.x+25 > paddle.pos.x) && (ball.pos.x < (paddle.pos.x+100)) &&
     ((ball.pos.y+25) > paddle.pos.y)){
    ball.vel.y = -ball.vel.y;
  }
  


  
}
}
