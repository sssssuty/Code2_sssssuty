String[] data;
MyObjects [] myObjects = new MyObjects [6];

void setup() {
  data = loadStrings("dataPos.txt");
  
  size(600, 600);
  background(255);
  String[] splitData = data[0].split(",");
  String[] splitDataSiz = data[1].split(",");
  
  for (int i = 0; i < splitData.length; i++) {
    myObjects[i] = new MyObjects(float(splitData[i]),float(splitDataSiz[i]));
    myObjects[i].display();
  }
}
