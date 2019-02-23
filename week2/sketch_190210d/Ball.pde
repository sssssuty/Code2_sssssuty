class Ball{
   PVector pos, vel;
   int s;
   
   Ball(){
     pos = new PVector(width/2, height/2);
     vel = new PVector(random(-5,5), 4);
   }

  void display(){
    s = 25;
    fill(255);
    rect(pos.x, pos.y, s, s);
  }
  
  void update(){
    pos.add(vel);
  }
  
  
}
