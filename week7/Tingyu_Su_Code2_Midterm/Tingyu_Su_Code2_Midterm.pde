//class based
//global state
//move values to external data import

//make a child button
//have the botton states represented more visually

Button button1;
Button button3;
CButton button2;
Table data;
float[] xPositions = new float[2];
float[] yPositions = new float[2];
int xpos, ypos;
int aa, bb;
int xpos1 = 180;
int xpos2 = 420;
int ypos1 = 200;
int ypos2 = 200;
int state = 0;
int buttonSize = 125;

color[] BGColor = {color(230), color(230, 255, 200), color(255, 200, 230)};

String[] buttonTexts = {"all lights are off!", "button 1 pressed!", "button 2 pressed!"};

void setup() {
  size(600, 600);
  button1 = new Button();
  button3 = new Button();
  button2 = new CButton();
  
  data = loadTable("data.csv", "header"); 
  
  for (int i = 0; i < 2; i++) {
      for (TableRow row : data.rows()) {
        aa = row.getInt("xposition1");
        bb = row.getInt("xposition12");
        ypos = row.getInt("yposition");
      }
    }
}

void draw() {
  background(BGColor[state]);
  
  button1.display(aa, ypos);
  button3.display(bb, ypos);
  button2.display(width/2, height/2);
  checkBackground();
 
  fill(0);
  textAlign(CENTER);
  textSize(28);
}

void checkBackground(){
    if (dist(mouseX, mouseY, xpos1, ypos1) < buttonSize/2 && mousePressed) {
      state = 1;
      //println(state);
      background(BGColor[state]);
      fill(0);
      text(buttonTexts[state], width/2, 400);
    } else {
      state = 0;
    }
    
    if (dist(mouseX, mouseY, xpos2, ypos2) < buttonSize/2 && mousePressed) {
      state = 2;
      background(BGColor[state]);
      fill(0);
      text(buttonTexts[state], width/2, 400);
    } else {
      state = 0;
    }
}
