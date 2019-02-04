boolean button0 = false; 
boolean button1 = false;
boolean button2 = false;
boolean button3 = false;
//int x = width/5;
//int y = height/2;

String[] text = new String [4];
PVector[] location = new PVector[4];

void setup() {
   size(600, 300);
    text[0] = "Hey"; 
    text[1] = "My name is Tingyu Su";
    text[2] = "Today is Feb 3rd";
    text[3] = "Not feeling like getting up";
    for (int i=0; i<4; i++){
      location[i]= new PVector (width*(i+1)/5, height/3);
    }
}

void draw() {
  background(200);

  
  if (button0) {
    fill(0);
    text(text[0], (location[0].x-width/45),(location[0].y+height/3));
    fill(255);
  } else {
    fill(0);
  }
  ellipse(location[0].x,location[0].y, 80, 80);
  
  if (button1) {
    fill(0);
    text(text[1], (location[1].x-width/10),(location[1].y+height/3));
    fill(255);
  } else {
    fill(0);
  }
  ellipse(location[1].x,location[1].y, 80, 80);
  
  if (button2) {
    fill(0);
    text(text[2], (location[2].x-width/13),(location[2].y+height/3)); 
    fill(255);
  } else {
    fill(0);
  }
  ellipse(location[2].x,location[2].y, 80, 80);
  
  if (button3) {
    fill(0);
    text(text[3], (location[3].x-width/8),(location[3].y+height/3));
    fill(255);
  } else {
    fill(0);
  }
  ellipse(location[3].x,location[3].y, 80, 80);
}

void mousePressed() {
  if (dist(mouseX, mouseY, width/5, height/4) < 40) {
    button0 = true;
  }
  
  if (dist(mouseX, mouseY, width*2/5, height/4) < 40) {
    button1 = true;
  }
  
  if (dist(mouseX, mouseY, width*3/5, height/4) < 40) {
    button2 = true;
  }
  if (dist(mouseX, mouseY, width*4/5, height/4) < 40) {
    button3 = true;
  }
}

void mouseReleased(){
    button0 = false;
    button1 = false;
    button2 = false;
    button3 = false;
}
