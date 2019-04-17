int state = 0;
JSONArray json;
JSONObject game; //<>//
JSONArray descr;
String[] tempDescr;
JSONArray options;
JSONArray temp;
String[] tempOption;
JSONArray optionTargets;
JSONArray temp2;
int [] tempTargets;

JSONArray c;
JSONArray temp3;
int[] tempColor;

void setup(){
  size(600,600);
  json = loadJSONArray("data2.json");
  background(0);
}

void draw(){
  
  for(int i = 0; i < json.size(); i++){
      game = json.getJSONObject(i);  
      
      descr = game.getJSONArray("descriptions");
      tempDescr = descr.getStringArray();
      
     options = game.getJSONArray("options");
     temp = options.getJSONArray(state);
     tempOption = temp.getStringArray();
     for (int j = 0; j < tempOption.length; j++){
         //println(tempOption[j]); //<>//
     }
       
    optionTargets = game.getJSONArray("optionTargets");
    temp2 = optionTargets.getJSONArray(state);
    for (int j = 0; j < temp2.size(); j++){
      tempTargets = temp2.getIntArray();
      //println(tempTargets[j]);
    }
    
    c = game.getJSONArray("colors");
    temp3 = c.getJSONArray(state);
    for (int j = 0; j < temp3.size(); j++){
      tempColor = temp3.getIntArray();
      background(tempColor[0],tempColor[1],tempColor[2]);
      //println(tempColor);
    }
    
        fill(0);
        textSize(40);
        text(tempDescr[state], 40, 40, 450,300);
  }

  textSize(24);
  for (int j = 0; j < tempOption.length; j++){
    text(tempOption[j], 40, 480 + j*40);
  };
  
  
}


void keyPressed(){
  
  for(int i = 0 ; i< tempTargets.length; i++){
    if(keyCode == 49){
      state = tempTargets[0];
    } 
    if(keyCode == 50){
      state = tempTargets[1];
    } 
  }  
}
