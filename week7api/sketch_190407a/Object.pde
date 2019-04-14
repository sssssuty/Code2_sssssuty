class Object{
  JSONObject data;
  JSONObject wind;
  JSONObject main;
  
  float direction = 0;
  float speed = 0;
  float degX = 0;
  String cityName;
Object(String x){
  data = loadJSONObject("http://api.openweathermap.org/data/2.5/weather?q=" + x + "&APPID=" + apiKey);
  wind = data.getJSONObject("wind");
  //println(wind);
  speed = wind.getFloat("speed")/2;
  direction = wind.getFloat("deg")/2;
  cityName = x;
}

void display(){
  //rectMode(CENTER);
  textSize(30);
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(direction + degX));
  //text(cityName, 30, 50);
  line(0, 0, 100, 100);
  text(cityName, 100,100);
  popMatrix();
}

void update(){
  degX = degX + direction/100;
  if (millis() > time + millisecondsToWait) {
    updateData();
    time = millis();
  }
}

void updateData() {
  String x = cityName;
  data = loadJSONObject("http://api.openweathermap.org/data/2.5/weather?q=" + x + "&APPID=" + apiKey);
  wind = data.getJSONObject("wind");
  //println(wind);
  speed = wind.getFloat("speed")/2;
  direction = wind.getFloat("deg")/2;
  cityName = x;
}
}
