int grid = 20; 
int speed = 10;
boolean dead = true;
Snake snake;
Apple ap;
Block bb;
OtherBlock cc1;
int stage = 0;
int rows = 30;
int cols = 30;
int w, d;

void setup() {
  background(0);
  w = 20;
  d = 20;
  size(500, 500,P3D);
  snake = new Snake();
  ap = new Apple();
  bb = new Block();
  cc1 = new OtherBlock();
}

void draw() {
  back();
  
  switch(stage){
    case 0:
      back();
      restart();
      break;
    case 1:
      back();
      rectMode(CENTER);
      noFill();
      stroke(255);
      rect(250,250,400,400);
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
    bb.display();
    cc1.display();
    ap.display();
    textAlign(LEFT);
    textSize(30);
    fill(255);
    text(snake.len, 10, 20);
}

void restart(){
    textSize(25);
    textAlign(CENTER);
    text("Click to start\n\nDon't go out the window\nAll elements will be generated\ninside the stroke\n\nEat the red\nStay away from the blue", width/2, height/5);
}

void mousePressed() {
  if (dead) {
    snake = new Snake();
    ap = new Apple();
    bb = new Block();
    cc1 = new OtherBlock();
    speed = 10;
    dead = false;
  }
}

void back(){
  background(0);
  stroke(255);
  float scale = 0.05;
  
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      pushMatrix();
      rotateX(radians(-90));
      float y = noise(i * scale, j * scale, frameCount * 0.005) * 200;
      translate((i * w-2*w)*1.2, y-3*w, (j * d)*1.2);
      point(0, 0, 0);
      popMatrix();
    }
  }
}
