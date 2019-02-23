Player player;
Ball ball;

Shape[] [] shapes = new Shape [10][5];
boolean rightPressed = false;
boolean leftPressed = false;

void setup() {
  size(900, 600);
  player = new Player();
  ball = new Ball();

  for (int i = 0; i < shapes.length; i++) {
    for (int j = 0; j < shapes[0].length; j++) {
      float r = random(1);
    if (r > 0.5) {
      shapes[i][j] = new Brick(5 + i * 90, 50 + j * 40, 80, 20);
    } else {
      shapes[i][j] = new CBrick(5 + i * 90, 50 + j * 40, 80, 20);
    }
    }
  }
}

void draw() {
  background(10);
  player.update();
  player.display();

  ball.update();
  ball.display();


  // does it make sense for ball to own this?
  if (ball.pos.x > player.x - player.w/2 && ball.pos.x < player.x + player.w/2 &&
    ball.pos.y > player.y - player.h/2 && ball.pos.y < player.y + player.h/2) {
      
    ball.angle = random(PI, TWO_PI);
    ball.vel = new PVector(cos(ball.angle), sin(ball.angle));
    ball.vel.mult(ball.speed);
    ball.pos.add(ball.vel);
  }

  for (int i = 0; i < shapes.length; i++) {
    for (int j = 0; j < shapes[0].length; j++) {
      if (shapes[i][j].active) {
        shapes[i][j].display();
        if (ball.didCollideWithBrick(shapes[i][j])) {
          shapes[i][j].active = false;
        }
      }
    }
  }
}
