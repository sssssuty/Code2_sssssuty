class MyObjects{
  float x, y;
  
  MyObjects(float x){
    this.x = x;
    this.y = x;
  }
  
  void display(){
    noStroke();
    fill(random(255),random(255),random(255),random(255));
    ellipse(x, y, 100, 100);
  }
  
  void update(){
    x ++;
    y --;
    
  }

}
