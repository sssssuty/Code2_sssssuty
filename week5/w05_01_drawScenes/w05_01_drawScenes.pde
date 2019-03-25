// bryan ma for code 2 sp 19

int scene = 0;

void setup() {
  size(600, 600);
  println("C for circle, S for square, T for triangle, then click mouse once");
}

void draw() {
  background(255);
  //fill(0);
  switch (scene) {
    case 0:
      fill(0);
      ellipse(200, 200, 100, 100);
      //fill(255, 0, 0);
      //text("a s d f", 100, 500);
      break;
    case 1:
      fill(0);
      rect(300, 300, 100, 100);
      //fill(255, 0, 0);
      //text("a s d f", 100, 500);
      break;
    case 2:
      fill(0);
      triangle(0, 0, width, 0, width/2, height);
      //fill(255, 0, 0);
      //text("a s d f", 100, 500);
      break;
    case 3:
      fill(0);
      text("finish", 100, 100);
      //fill(255, 0, 0);
      //text("a s d f", 100, 500);
      break;
  }
  advance();
  
}

void advance(){
  if (keyPressed){
    if (scene < 1){
    if (key == 'c' || key == 'C'){
        scene = 1;
      }
    }
    
    if (scene > 0 && scene < 2){
      if (key == 's' || key == 'S'){
        scene = 2;
      }
    }
    
    if (scene > 1 && scene < 3){
    if (key == 't' || key == 'T'){
        scene = 3;
      }
    }
  }
  
  
  if (mousePressed){
    if (scene > 2 && scene < 4){
    //if (key == 'f' || key == 'F'){
        scene = 0;
      }
    //}
  }
  
}
