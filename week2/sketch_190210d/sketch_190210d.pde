Paddle paddle;
Ball ball;
Brick brick;

void setup(){
  size(800,600);
  paddle = new Paddle();
  ball = new Ball();
  brick = new Brick();
}

void draw(){
  background(0);
  
  paddle.display();
  paddle.update();
  
  ball.display();
  ball.update();
  
  brick.display();
  
  ball.checkCollision1();
  brick.checkCollision2();
  

  
}
