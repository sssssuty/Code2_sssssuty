 float l;
 
void setup(){
  size(600, 600);
  background(255);
  strokeWeight(2);
  translate(width/2, height);
  l = 300;
  branch(l);
}

void draw(){
  l --;
  if (l < 200){
    l = 300;
  };
  
}

void branch(float len){
  strokeWeight(0.5);
  rect(0,0,len,len);
  //line(0,0,0,-len);
  translate(0,-len);
  len *= .6;
  if(len > 2){
    pushMatrix();
    rotate(radians(60));
    branch(len);
    popMatrix();
  }

}
