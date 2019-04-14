Mover3[] mover = new Mover3[20];
Mover2[] mover2 = new Mover2[20];
PVector aa;
Pendulum p;
//new PVector(width/2,0),175
void setup() {
  size(600, 600);
  aa = new PVector(width/2,0);
  for (int i = 0; i < 20; i++) {
    mover[i] = new Mover3();
    mover2[i] = new Mover2();
  }
  p = new Pendulum(aa, 175);
}

void draw() {
  background(255);
  p.go();
    PVector penVector = new PVector(p.position.x, p.position.y);
    //println(penVector);
  for (int i = 0; i < 20; i++) {
    penVector = new PVector(p.position.x, p.position.y*2);
    //println(penVector);
    penVector.sub(mover[i].pos);
    penVector.normalize();
    penVector.mult(0.2);

    mover[i].applyForce(penVector);
    mover[i].update();
    mover[i].display();
    
    mover2[i].applyForce(penVector);
    mover2[i].update();
    mover2[i].display();
  }
}
