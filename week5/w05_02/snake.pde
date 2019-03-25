class Snake {
  PVector pos;
  PVector vel;
  ArrayList<PVector> hist;
  int len;
  int moveX = 0;
  int moveY = 0;


  Snake() {
    pos = new PVector(0, 0);
    vel = new PVector();
    hist = new ArrayList<PVector>();
    len = 0;
  }
 
 void display() {
    noStroke();
    fill(sc);
    rect(pos.x, pos.y, grid, grid);
    for (PVector p : hist) {
      rect(p.x, p.y, grid, grid);
    }
  }
  
  void update() {
    hist.add(pos.copy());
    pos.x += vel.x*grid;
    pos.y += vel.y*grid;
    moveX = int(vel.x);
    moveY = int(vel.y);
    
    if (hist.size() > len) {
      hist.remove(0);
    }
    
    if ((pos.y > height)||(pos.x > width)||(pos.y < 0)||(pos.x<0)){
     dead = true;
    }
    
  }

  void eat() {
    if (pos.x == posA.x && pos.y == posA.y) {
      len++;
      if (speed > 5) speed--;
      ap = new Apple();
      sc = int(random(255));
      tc = int(random(255));
      ac = int(random(255));
      bc = int(random(255));
    }
  }

 
}

void keyPressed() {
  if (keyCode == LEFT && snake.moveX != 1) {
    snake.vel.x = -1;
    snake.vel.y = 0;
  } else if (keyCode == RIGHT && snake.moveX != -1) {
    snake.vel.x = 1;
    snake.vel.y = 0;
  } else if (keyCode == UP && snake.moveY != 1) {
    snake.vel.y = -1;
    snake.vel.x = 0;
  } else if (keyCode == DOWN && snake.moveY != -1) {
    snake.vel.y = 1;
    snake.vel.x = 0;
  }
}
