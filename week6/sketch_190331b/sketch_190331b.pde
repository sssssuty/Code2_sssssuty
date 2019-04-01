// state = screen
// text to display for each screen   (state representation)
// options to choose for each screen (state transitions)

// string for each text
// string for each option - corresponds to a keypress

int state = 0;
JSONObject json;

String[] descriptions = {
  "You are hungry but remember that you have had four meals already on that day",
  "you can't control your hand but grabbing a piece of cake",
  "you were distracted for the first minute, but you opened a bag of chip without even thinking about it"
};

String[][] options = {
  {"try to stay away from any food", "call a friend to use your mouth in another way"},
  {"you eat your fifth meal"},
  {"struggle to keep your mouth close", "enjoy more foooooooood"}
};


int[][] optionTargets = {
  {1, 2},
  {0},
  {1, 0},
};

Scene[] scenes = new Scene[descriptions.length];

void setup() {
  size(600, 600);
  json = new JSONObject();
  for (int i = 0; i < scenes.length; i++) {
    scenes[i] = new Scene(descriptions[i], options[i], optionTargets[i]);
  }
  
  for (int i = 0; i < scenes.length; i++) {
    json.setString("descriptions", descriptions[i]);
  }
    json.setString("options", "{try to stay away from any food, call a friend to use your mouth in another way},{you eat your fifth meal},{struggle to keep your mouth close, enjoy more foooooooood}");
    json.setString("optionTargets", "{1, 2},{0},{1, 0},");
  //}
  

  saveJSONObject(json, "data/new.json");
}

void draw() {
  background(255);
  textSize(40);
  fill(0);
  text(scenes[state].displayText, 40, 40, 450, 300);
  
  textSize(20);
  int i = 0;
  for (String option : scenes[state].options) {
    text(option, 40, 450 + i * 50);
    i++;
  }
}

void keyPressed() {  
  for (int i = 0; i < scenes[state].options.length; i++) {
    if (keyCode - 49 == i) {
       state = scenes[state].optionTargets[i];
    }
  }
}

class Scene {
  String displayText;
  String[] options;
  int[] optionTargets;
  
  Scene(String txt, String[] opt, int[] targets) {
    displayText = txt;
    options = opt;
    optionTargets = targets;
  }
}
