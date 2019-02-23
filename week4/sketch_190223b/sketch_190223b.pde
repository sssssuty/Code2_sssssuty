Shape shapes;

void setup(){
  size(600, 600);
  background(255);
  shapes = new Shape();
}

void draw(){

for(int i = 0; i< 5; i++){  
  for (int j = 0; j< 5; j++){
    shapes.display(i, j);
  }
}

}
