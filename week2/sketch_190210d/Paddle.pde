class Paddle{
  PVector pos;
  int w, h;
  
  Paddle(){
    w = 100;
    h = 25;
    pos = new PVector(width/2, height-50);
  }
  
  void display(){
    fill(255);
    rect(pos.x, pos.y, w, h);
  }
  
  void update(){
    if (keyPressed && keyCode == LEFT){
      pos.x -= 5;
    }
    if (keyPressed && keyCode == RIGHT){
      pos.x += 5;
    }
    if (pos.x < 0){
      pos.x = 0;
    }
    if(pos.x > width-100){
      pos.x = width-100;
    }
  }
  
}
