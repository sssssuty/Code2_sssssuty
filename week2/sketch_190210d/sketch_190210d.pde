Paddle paddle;
Ball ball;
Brick brick;
ArrayList<Brick> myArrayList = new ArrayList<Brick>();

void setup(){
  size(800,600);
  paddle = new Paddle();
  ball = new Ball();
  for (int i = 0; i < 6; i++){
    for (int j = 0; j < 4; j++){
      //brick = new Brick(i*20, j*20);
      myArrayList.add(new Brick(i*135, j*60));
    }
  }
}

void draw(){
  background(0);
  
  paddle.display();
  paddle.update();
  
  ball.display();
  ball.update();
  
  //brick.display();
  for (int i = 0; i<myArrayList.size(); i++){
  myArrayList.get(i).display();
  if(myArrayList.get(i).checkCollision2(ball)){
    myArrayList.remove(i);
  };
  
  }
  //arraylist;
  
  checkCollision1();
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
