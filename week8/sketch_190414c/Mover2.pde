class Mover2 extends Mover{

  Mover2(){
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
    fill(0);
  }
} //<>//
