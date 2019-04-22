class OtherBlock extends Shape{

OtherBlock(){
  posC = new PVector(posA.x + int(random(-4,4))*grid, posA.y+ int(random(-4,4))*grid);
}

void display(){
    fill(0,0,255);
    pushMatrix();
    translate(posC.x, posC.y);
    //stroke(255);
    box(grid);
    popMatrix();

}

}
