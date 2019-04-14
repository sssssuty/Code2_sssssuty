class Mover3 extends Mover{
  Mover3(){
    super();
  }
  
  void applyForce(PVector force) {
     PVector f = PVector.div(force, mass); 
    acc.add(f);
  }
  
  void update() {
  super.update();
  }
  
  void display() {
    super.display();
    noFill();
    //noStroke();
    //fill(0);
  }
}
