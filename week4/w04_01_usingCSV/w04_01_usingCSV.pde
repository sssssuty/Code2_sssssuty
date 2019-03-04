// bryan ma for code 2 sp19 A

// replace the sizes integer array with csv data loaded externally.

//int[] sizes = { 300, 500, 100, 200, 400, 300, 500, 200 };
String[] data;
String[] splitData;
MyObjects [] myObjects = new MyObjects [8];

void setup() {
  size(800, 600);
  background(255);
  rectMode(CENTER);
  
  data = loadStrings("data.txt");
  String[] splitData = data[0].split(",");
  
   for (int i = 0; i < splitData.length; i++) {
      println(splitData[i]);
      myObjects[i] = new MyObjects(float(splitData[i]));
   }

}

void draw() {
     for (int i = 0; i < 8; i++) {
      myObjects[i].display();
      myObjects[i].update();
   }
}
