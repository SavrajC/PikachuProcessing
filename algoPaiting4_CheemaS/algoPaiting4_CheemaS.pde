int rectX = 0;
int rectY = 0;
int rectWidth = 0;
int rectHeight = 25;
int ear1X = 0;
int ear1Y = 0;
int ear1Width = 0;
int ear1Height = 70;
int ear1Angle = 55;
int ear2X = 0;
int ear2Y = 0;
int ear2Width = 0;
int ear2Height = 70;
int ear2Angle = -55;
boolean ear1IsCreated = false;
boolean ear2IsCreated = false;
boolean faceCircle = false;

void setup() {
  size(1600, 800);
  background(255);
}

void draw() {
  rectX = width / 2 - rectWidth / 2;
  rectY = height / 2 - rectHeight / 2;
  noStroke();
  fill(255,210,0);
  rect(rectX, rectY, rectWidth, rectHeight);
  
  if (rectWidth < 120) {
    rectWidth++;
    rectHeight++;
  } else if (faceCircle == false) {
    faceCircle();
  } else if(faceCircle == true) {
    ear1();
  }
}

void faceCircle() {
  int x = width / 2;
  int y = height / 2;
  int diameter = 90;
  
  fill(255,210,0);
  noStroke();
  beginShape();
  for (int i = 0; i < 361; i++) {
    float angle = radians(i);
    float xpos = x + cos(angle) * diameter/1.6 - 20;
    float ypos = y + sin(angle) * diameter/1.4 - 10;
    vertex(xpos, ypos);
  }
  endShape(CLOSE);
  faceCircle = true;
}

void ear1() {
  ear1X = width / 2 - ear1Width / 2 + 65;
  ear1Y = height / 2 - ear1Height / 2 - 75;
  
  pushMatrix();
  translate(ear1X + ear1Width/2, ear1Y + ear1Height/2);
  rotate(radians(ear1Angle));
  rect(-ear1Width/2, -ear1Height/2, ear1Width, ear1Height);
  popMatrix();
  
  if (ear1Width < 30) {
    ear1Width++;
    ear1Height++;
  } else {
    ear1IsCreated = true;
  }
  
  if (ear1IsCreated == true) {
    ear2();
  }
}

void ear2() {
  ear2X = width / 2 - ear2Width / 2 - 65;
  ear2Y = height / 2 - ear2Height / 2 - 75;
  
  pushMatrix();
  translate(ear2X + ear2Width/2, ear2Y + ear2Height/2);
  rotate(radians(ear2Angle));
  rect(-ear2Width/2, -ear2Height/2, ear2Width, ear2Height);
  popMatrix();
  
  if (ear2Width < 30) {
    ear2Width++;
    ear2Height++;
  }else{
  ear2IsCreated = true;
  }
}
