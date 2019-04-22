//PVector posA;

class Apple extends Shape{
  
  Apple(){
    posA = new PVector(int(random(250,400)/grid)*grid,int(random(250,400)/grid)*grid);
    if (posA == posB){
      posA = new PVector(posA.x + int(random(-3,3))*grid, posA.y+ int(random(-3,3))*grid);
    }
  }

  void display(){
    fill(255,0,0);
    pushMatrix();
    translate(posA.x, posA.y);
    //stroke(255);
    box(grid);
    popMatrix();
  }
}  
