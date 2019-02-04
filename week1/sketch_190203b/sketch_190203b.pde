float rectX[][] = new float [20][20];
float rectY[][] = new float [20][20];
//PVector[] rect = new PVector [];
boolean checkColor[][] = new boolean [20][20];
color x;


void setup(){
  size(400,300);
  background(255);

  for(int i = 0; i<20; i++){
    for(int j = 0; j<20; j++){
      rectX[i][j] = width/20 *i;
      rectY[i][j] = width/20 *j;
      checkColor[i][j] = false;
    }
  }
  
}

void draw(){
  
  x = color(random(255),random(255),random(255));

//void mousePressed(){
  
  //for(int i = 0; i<20; i++){
  //for(int j = 0; j<20; j++){
  //    if(mousePressed){
  //     if(dist(mouseX, mouseY, rectX[i][j]+10, rectY[i][j]+10)<20){
  //          if(checkColor[i][j] == false){
  //            checkColor[i][j] = true;
  //            noStroke();
  //            fill(x);
  //            rect(rectX[i][j], rectY[i][j], 20, 20);
  //          }
  //      }
  //    }    
  //}
  //}
  
  for(int i = 0; i<20; i++){
  for(int j = 0; j<20; j++){
      if(mousePressed){
         if(mouseX > rectX[i][j] && mouseX < rectX[i][j]+20){
         if(mouseY > rectY[i][j] && mouseY < rectY[i][j]+20){
            if(checkColor[i][j] == false){
              checkColor[i][j] = true;
              noStroke();
              fill(x);
              rect(rectX[i][j], rectY[i][j], 20, 20);
            }
        }
        }
      }    
  }
  }
  

  
}
