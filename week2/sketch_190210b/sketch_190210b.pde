Paddle paddle;
Ball ball;
Bricks bricks;

void setup(){
  size(800,600);
  paddle = new Paddle();
  ball = new Ball();
  bricks = new Bricks();
}

void draw(){
  background(0);
  
  paddle.display();
  paddle.update();
  
  ball.display();
  ball.update();
  
  bricks.display();
  
  checkCollision();
  //ball.checkCollision(paddle);   
}

void checkCollision(){
  if ((ball.pos.x < 0) || (ball.pos.x > width-25)){
    ball.vel.x = -ball.vel.x;
  }
  if (ball.pos.y<0){
    ball.vel.y = -ball.vel.y;
  }
  if ((ball.pos.x > paddle.pos.x) && (ball.pos.x < (paddle.pos.x+100)) &&
     ((ball.pos.y+25) > paddle.pos.y)){
    ball.vel.y = -ball.vel.y;
  }
  
  if (ball.pos.y > 600){
    exit(); 
  }
 
  
}
