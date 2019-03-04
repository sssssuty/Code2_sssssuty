class Shape{

  float x;
  float y;
  float w;
  float h;
  boolean active;
  
  Shape(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    active = true;
  }

  void display() {
    
    rect(x, y, w, h);
  }
}
