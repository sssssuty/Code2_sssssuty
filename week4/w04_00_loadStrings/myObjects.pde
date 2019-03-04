class MyObjects{
  float x, y;
  
  MyObjects(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  void display(){
    noStroke();
    fill(random(255),random(255),random(255),random(255));
    ellipse(x * 100+random(300), random(x * 150), y, y);
  }

}
