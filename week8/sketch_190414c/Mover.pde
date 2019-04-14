class Mover {
  PVector pos;
  PVector vel;
  PVector acc;
  float mass;
  
  Mover() {
    pos = new PVector(random(width), random(height));
    vel = new PVector(0,0);
    acc = new PVector(0, 0);
    mass = random(1, 5);
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass); 
    acc.add(f);
  }
  
  void update() {
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
    
    if (pos.x > width) {
      pos.x = width;
      vel.x *= -1;
    } else if (pos.x < 0) {
      vel.x *= -1;
      pos.x = 0;
    }

    if (pos.y > height) {
      vel.y *= -1;
      pos.y = height;
    }
  }
  
  void display() {
    //stroke(0);
    //noFill();
    //noStroke();
    ellipse(pos.x, pos.y, 3*mass, 3*mass);
  }
}
