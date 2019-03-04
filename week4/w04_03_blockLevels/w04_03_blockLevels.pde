// bryan ma for code 2 sp 19 A

int rows = 12;
int cols = 12;
int cellsize = 600/rows;
//String[] data;
Table data;

Block[][] blocks = new Block[rows][cols];


void setup() {
  size(600, 600);
  data = loadTable("dataa.csv");

  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      TableRow row = data.getRow(i);
      int [] x = new int [cols];
      x[j] = row.getInt(j);
      
      if (x[j] == 1) {
        blocks[j][i] = new DarkBlock(i, j);
      } else {
        blocks[j][i] = new LightBlock(i, j);
      }
    }
  }
}

void draw() {
  background(255);
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      blocks[j][i].display();
    }
  }
}

class Block {
  PVector pos;
  float c;

  Block(int row, int col) {
    pos = new PVector(row * cellsize, col * cellsize);
  }

  void display() {
    fill(c);
    rect(pos.x, pos.y, cellsize, cellsize);
  }
}

class LightBlock extends Block {
  LightBlock(int row, int col) {
    super(row, col);
    c = 220;
  }
}

class DarkBlock extends Block {
  DarkBlock(int row, int col) {
    super(row, col);
    c = 50;
  }
}
