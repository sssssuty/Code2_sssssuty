class Pendulum {
  PVector position;
  PVector origin;
  float r;
  float angle;
  float aVelocity;
  float aAcceleration;
  float damping;
Pendulum(PVector origin_, float r_) {
    origin = origin_.get();
    position = new PVector();
    r = r_;
    angle = PI/4;

    aVelocity = 0.0;
    aAcceleration = 0.0;
    damping = 0.995;
  }

  void go() {
    update();
    display();
  }

  void update() {
      float gravity = 0.4;
      aAcceleration = (-1 * gravity / r) * sin(angle);
      aVelocity += aAcceleration;
      aVelocity *= damping;
      angle += aVelocity;
  }

  void display() {
    position.set(r*sin(angle), r*cos(angle), 0);
    position.add(origin);

    stroke(0);
    textSize(30);
    strokeWeight(2);
    fill(0);
    textAlign(CENTER,CENTER);
    text("Su Tingyu", position.x, position.y*2);
  }
}
