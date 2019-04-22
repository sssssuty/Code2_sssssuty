PVector posA;

class Apple{
  
  Apple(){
    posA = new PVector(int(random(width)/grid)*grid,int(random(height)/grid)*grid);
  }

  void display(){
    stroke(255);
    fill(ac);
    pushMatrix();
    translate(posA.x, posA.y);
    box(grid);
    //rect(posA.x, posA.y, grid, grid);
    popMatrix();
  }
}  
