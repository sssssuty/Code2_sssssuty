class CBrick extends Shape{
  
  CBrick(float x, float y, float w, float h){
    super(x, y, w, h);
  }
  
  void display(){
    super.display();
    rectMode(CORNER);
    noStroke();
    fill(0, 0, 200);
  }
}
