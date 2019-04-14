String apiKey = "d9e40004dfa7e1f572ca81f1d08a5109"; // YOUR API KEY HERE
String[] cNames = {"Denver", "Chicago", "Boston","Tokyo", "Roma", "Paris", "Amsterdam","Tripoli","Sydney"};
float time = 0; 
float millisecondsToWait = 2000;
Object[] cs = new Object[cNames.length];

void setup() {
  size(600, 600);
  background(255);
  fill(0);
  time = millis();
  for (int i = 0; i < cNames.length; i++){
    cs[i] = new Object(cNames[i]);
  }
}

void draw() {
  background(255);
  for (int i = 0; i < cNames.length; i++){
    cs[i].display();
    cs[i].update();
  }
}
