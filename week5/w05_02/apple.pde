PVector posA;

class Apple{
  
  Apple(){
    posA = new PVector(int(random(width)/grid)*grid,int(random(height)/grid)*grid);
  }

  void display(){
    fill(ac);
    rect(posA.x, posA.y, grid, grid);
  }
}  
