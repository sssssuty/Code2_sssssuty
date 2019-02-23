float counter, s, c;

void setup(){
  size(600, 600);
  background(255);
}

void draw(){

  if (c > 255){
    c = 0;
  }
  if(c < 1){
  c++;
  }else {
  c++;
  }
  //println(c);
  
for(int i = 0; i< 5; i++){  
  for (int j = 0; j< 5; j++){
    counter += TWO_PI/1000;
    s = sin(counter)*60;
    rect((i*120+60),(j*120+60), s, s);
    stroke(255, c, c);
  }
}

}
