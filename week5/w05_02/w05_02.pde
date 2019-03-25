int grid = 20; 
int speed = 10;
boolean dead = true;
Snake snake;
Apple ap;
int stage = 0;
int sc, ac, tc, bc;

void setup() {
  size(500, 500);
  snake = new Snake();
  ap = new Apple();
  sc = int(random(255));
  tc = int(random(255));
  ac = int(random(255));
  bc = int(random(255));
}

void draw() {
  //background(0);
  //fill(255);
  
  switch(stage){
    case 0:
      background(bc);
      //fill(150);
      restart();
      break;
    case 1:
      background(bc);
      //fill(255);
      n();
      break;
  }
  
  if (!dead) {
    stage = 1;
  } else {
    stage = 0;
  } 
}

void n(){
    if (frameCount % speed == 0) {
      snake.update();
    }
    snake.display();
    snake.eat();
    ap.display();
    textAlign(LEFT);
    textSize(30);
    fill(tc);
    text(snake.len, 10, 20);
}

void restart(){
    textSize(25);
    textAlign(CENTER);
    text("Click to start\nDon't go out the border", width/2, height/2);
}

void mousePressed() {
  if (dead) {
    snake = new Snake();
    ap = new Apple();
    speed = 10;
    dead = false;
    sc = int(random(255));
    tc = int(random(255));
    ac = int(random(255));
    bc = int(random(255));
  }
}
