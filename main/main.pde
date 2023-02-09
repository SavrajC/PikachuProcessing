int rectX = 0;
int rectY = 0;
int rectWidth = 0;
int rectHeight = 0;

void setup() {
  size(400, 400);
  background(255);
}

void draw() {
  rectX = width / 2 - rectWidth / 2;
  rectY = height / 2 - rectHeight / 2;
  fill(255,255,0);
  rect(rectX, rectY, rectWidth, rectHeight);
  
  if (rectWidth < 100) {
    rectWidth++;
    rectHeight++;
  }
}
