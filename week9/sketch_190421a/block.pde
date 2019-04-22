//PVector posB;

class Block extends Shape{
  
  Block(){
    posB = new PVector(posA.x + int(random(-3,3))*grid, posA.y+ int(random(-3,3))*grid);
  }

  void display(){
    fill(0,0,255);
    pushMatrix();
    translate(posB.x, posB.y);
    //stroke(255);
    box(grid);
    popMatrix();
  }
}  
