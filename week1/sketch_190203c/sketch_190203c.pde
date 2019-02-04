float counter;
float a;
boolean vertical = false;

void setup(){
size(600, 600);
}

void draw(){
  background(200);
  counter += TWO_PI/1000;
  float a = sin(counter)*3;
  if (vertical){
    ellipse(a*80+width/2, height/2, 100, 100);
  }else
    ellipse(width/2, a*80+height/2, 100, 100);
}

void mousePressed(){
  vertical = true;
}

//void mouseReleased(){
//  ellipse(height/2, a, 100, 100);
//}
