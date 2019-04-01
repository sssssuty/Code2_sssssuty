//"1", "3","7","6","1","8","4","6","9","2"
int state = 0;
float r,g,b,alpha;
String[] texts = {
"Welcome to the memory test. Try to remember this line of number: 1376184692",
"Is the 1st number 1?","Is the 2nd number 5?","Is the 3rd number 3?","Is the 4th number 6?",
"Is the 5th number 1?","Is the 6th number 4?","Is the 7th number 6?","Is the 8th number 5?",
"Is the 9th number 9?","Is the 10th number 5?","YOU MADE IT!!!"};

String[][] options = {
{"Let's do it!","I need more time"},{"Yes!","No"},{"Yes!","No"},
{"Yes!","No"},{"Yes!","No"},{"Yes!","No"},{"Yes!","No"},
{"Yes!","No"},{"Yes!","No"},{"Yes!","No"},{"Yes!","No"},
{"I would play no more","I want to try again"}};

int[][] pages = {{1,0},
{2,0},{0,3},{0,4},{5,0},
{6,0},{0,7},{0,8},{0,9},{10,0},{0,11},
{11,0}
};

Scene[] scenes = new Scene[texts.length];

void setup(){
size(800,500);
  for (int i = 0; i < scenes.length; i++) {
    scenes[i] = new Scene(texts[i], options[i], pages[i]);
  }
fill(255);
}

void draw(){
background(r,g,b,alpha);
textSize(40);
//fill(alpha, b, g, r);
text(scenes[state].displayText, 40, 40, 750, 300);
int i = 0;
  for (String option : scenes[state].options) {
    text(option, 40, 350 + i * 50);
    i++;
  }
}

void keyPressed() {  
  for (int i = 0; i < scenes[state].options.length; i++) {
    if (keyCode - 49 == i) {
       state = scenes[state].optionTargets[i];
       r = random(255);
       g = random(255);
       b = random(255);
       alpha = random(255);
       fill(g,b,r,alpha);
    }
  }
}

class Scene {
  String displayText;
  String[] options;
  int[] optionTargets;
  int btargets;
  
  Scene(String txt, String[] opt, int[] targets) {
    displayText = txt;
    options = opt;
    optionTargets = targets;
  }
}
