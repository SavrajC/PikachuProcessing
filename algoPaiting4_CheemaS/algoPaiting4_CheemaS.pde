int rectX = 0;
int rectY = 0;
int rectWidth = 0;
int rectHeight = 75;
int ear1X = 0;
int ear1Y = 0;
int ear1Width = 0;
int ear1Height = 80;
int ear1Angle = 55;
int ear2X = 0;
int ear2Y = 0;
int ear2Width = 0;
int ear2Height = 80;
int ear2Angle = -55;
boolean ear1IsCreated = false;
boolean ear2IsCreated = false;
boolean faceCircle = false;
boolean faceTriangle1 = false;

void setup() {
  size(1600, 800);
  background(0,110,0);
  drawStars(100);
}

void draw() {
  rectX = width / 2 - rectWidth / 2;
  rectY = height / 2 - rectHeight / 2 + 250;
  drawPokecenter();
  noStroke();
  fill(255,210,0);
  rect(rectX, rectY, rectWidth, rectHeight);
  
  if (rectWidth < 180) {
    rectWidth++;
    rectHeight++;
  } else if (faceCircle == false) {
    faceCircle();
    triangle(width/2 + 95, 550, width/2, height, width/2 + 125, height);
    triangle(width/2 - 57, 600, width/2, height, width/2 - 125, height);
  } else if(faceCircle == true) {
    ear1();
  } 
  if (ear2IsCreated == true){
  faceFeatures();
  fill(255,210,0);
  noStroke();
  circle(width/2 - 70, height/2 + 150, 45);
  circle(width/2 + 70, height/2 + 150, 45);
  }
  
  //System.out.println(mouseX);
  //System.out.println(mouseY);
  fill(255);
 
}

void faceCircle() {
  int x = width / 2;
  int y = height / 2 + 235;
  int diameter = 150;
  
  fill(255,210,0);
  stroke(100);
  beginShape();
  for (int i = 0; i < 361; i++) {
    float angle = radians(i);
    float xpos = x + cos(angle) * diameter/1.6 - 20;
    float ypos = y + sin(angle) * diameter/1.4 - 6;
    vertex(xpos, ypos);
  }
  endShape(CLOSE);
  ellipse(width/2, height/2 + 130, 140, 35);
  
  faceCircle = true;
}

void ear1() {
  ear1X = width / 2 - ear1Width / 2 + 125;
  ear1Y = height / 2 - ear1Height / 2 + 110;
  stroke(100);
  pushMatrix();
  translate(ear1X + ear1Width/2, ear1Y + ear1Height/2);
  rotate(radians(ear1Angle));
  rect(-ear1Width/2, -ear1Height/2, ear1Width, ear1Height);
  popMatrix();
  fill(0);
  triangle(width / 2 + 205, height/2 + 60, 964, 457, 988, 493);
  //System.out.println(height/2 + 50); 
  if (ear1Width < 45) {
    ear1Width++;
    ear1Height++;
  } else {
    ear1IsCreated = true;
  }
  
  if (ear1IsCreated == true) {
    ear2();
  }
  ear1IsCreated = true;
}

public void ear2() {
  fill(255,210,0);
  ear2X = width / 2 - ear2Width / 2 - 125;
  ear2Y = height / 2 - ear2Height / 2 + 110;
  stroke(100);
  pushMatrix();
  translate(ear2X + ear2Width/2, ear2Y + ear2Height/2);
  rotate(radians(ear2Angle));
  rect(-ear2Width/2, -ear2Height/2, ear2Width, ear2Height);
  popMatrix();
  fill(0);
  triangle(width / 2 - 200, height/2 + 60, 638, 457, 611, 492);
  if (ear2Width < 45) {
    ear2Width++;
    ear2Height++;
  }else{
  ear2IsCreated = true;
  }
  fill(255,210,0);
}

void faceFeatures(){
  fill(40);
  ellipse(width/2 - 50, height/2 + 190, 25, 30);
  ellipse(width/2 +50, height/2 + 190, 25, 30);
  fill(255);
  circle(width/2 - 52, height/2 + 185, 10);
  circle(width/2 + 48, height/2 + 185, 10);
  fill(230,90,0);
  ellipse(width/2 + 70, height/2 + 240, 35, 30);
  ellipse(width/2 - 70, height/2 + 240, 35, 30);
  fill(60);
  ellipse(width/2 , height/2 + 220, 16, 9);
  fill(255,160,122);
  ellipse(width/2, height/2 + 260, 40, 30);
  
}

void drawStars(int numStars) {
  for (int i = 0; i < numStars; i++) {
    float x = random(width);
    float y = random(height);
    drawStar(x, y);
  }
}

void drawStar(float x, float y) {
  pushMatrix();
  translate(x, y);
  float angle = random(TWO_PI);
  rotate(angle);
  float starSize = random(10, 20);
  drawShape(starSize);
  popMatrix();
}

void drawShape(float size) {
  beginShape();
  for (int i = 0; i < 5; i++) {
    float angle = TWO_PI / 5 * i;
    float x = cos(angle) * size;
    float y = sin(angle) * size;
    vertex(x, y);
    angle += TWO_PI / 10;
    x = cos(angle) * size / 2;
    y = sin(angle) * size / 2;
    vertex(x, y);
  }
  endShape(CLOSE);
}

void keyPressed() {
  if (key == ' ') {
    stroke(10);
    drawStars(5);
  }
}

void drawPokecenter() {
  fill(255); 
  rect(100, 100, 200, 300);
  
  fill(255, 50, 0); 
  triangle(100, 100, 300, 100, 200, 50);
  

  fill(39, 69, 190); 
  rect(155, 220, 90, 130);
  

  fill(210,210,210);
  rect(125, 125, 50, 50);
  rect(225, 125, 50, 50);
  

  fill(255); 
  rect(180, 60, 40, 40);
  fill(255, 0, 0); 
  textAlign(CENTER, CENTER);
  textSize(20);
  text("P", 200, 75);
}
