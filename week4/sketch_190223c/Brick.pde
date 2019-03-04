class Brick extends Shape{
  
  Brick(float x, float y, float w, float h){
    super(x, y, w, h);
  }
  
  void display(){
    stroke(255);
    fill(100);
    rectMode(CORNER);
    super.display();
  }
}
