class Shape{
  float counter, s, c;

  Shape(){
   c = 0;
  }

  void display(int x, int y){
      if (c > 255){
      c = 0;
      }else {
      c++;
      }
      counter += TWO_PI/1000;
      s = sin(counter)*60;
      rect( (x*120+60), (y*120+60), s, s);
      stroke(255, c, c);
  }
  
}
