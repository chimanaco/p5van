/*
  author:chimanaco
 
  inspired:
  
  着物買取実績―着物買取らぐたいむ 
  http://www.kimonokaitori.jp/item_cur_201007.html
  
  Traditional Japanese Color Names
  http://www.colordic.org/w/
 
 */

import controlP5.*;
ControlP5 cp5;
RadioButton r;
boolean cp5Visble = true;

int col = 4;  // tate
float radius;  // radius width
int sWeight = 3;  // stroke weight

color c1 = color(143, 46, 20);  // 弁柄色;
color c2 = color(0, 123, 187);  // 紺碧;
color c3 = color(101, 49, 142);  // 本紫
color c4 = color(118, 145, 100); /// 老竹色
color bgColor = color(255, 255, 255); // 白
color starColor = color(255, 255, 255); // 白
color borderColor = color(230, 180, 34); // 金色

/*
  setup cp5
 */
void setup() {
  size(400, 400);
  colorMode(RGB, 255, 255, 255);
  //smooth();
  noStroke();

  // setup cp5
  setupCP5();
}

/*
  setup cp5
 */
void setupCP5() {
  int xPos = 10;
  int yPos = 10;

  // cp5 
  cp5 = new ControlP5(this);

  // slider
  String[] slides = {
    "col", "sWeight"
  };
  int[] minList = {
    1, 1
  };
  int[] maxList = {
    30, 15
  };

  int yMargin = 15;
  int len = slides.length; 

  for (int i = 0; i < len; i++) {
    cp5.addSlider(slides[i])
      .setPosition(xPos, yPos + yMargin * i )
        .setRange(minList[i], maxList[i]);
    ;
  }
}

/*
  loop
 */
void draw() {
  // bg
  background(bgColor);
  
//  col = ceil(random(1, 30));
//  sWeight = ceil(random(0, 10));
  
  // radius
  radius = width / col;

  // draw circle pattern
  for (int i = 0; i < width; i += radius) {
    for (int j = 0; j < height; j += radius) {
      pushMatrix();
      translate(i * 2, j * 2);
      copyPattern(i + radius / 2, j + radius /2);
      popMatrix();
    }
  }

  // draw star pattern in circle
  stroke(borderColor);
  strokeWeight(sWeight);
  fill(starColor);

  for (int i = 0; i < width; i += radius) {
    for (int j = 0; j < height; j += radius) {
      pushMatrix();
      translate(i * 2, j * 2);
      drawStar(radius);
      popMatrix();
    }
  }
}

/*
  cp5 visible
 */
void mouseClicked() {
  if (cp5Visble) {
    cp5.hide();
  } 
  else {
    cp5.show();
  }
  cp5Visble = !cp5Visble;
}

/*
  draw Star in circle
 */
void drawStar(float radius) {
  int step = 60;  // smoothness
  float f;

  beginShape(POLYGON);  

  // left top
  f = 0.0;
  while (f < HALF_PI) {
    vertex(cos(f) * radius, sin(f) * radius);
    f += PI/step;
  }

  // left bottom  
  f = HALF_PI;
  while (f > 0) {
    vertex(cos(f) * radius, radius * 2 - sin(f) * radius);
    f -= PI/step;
  }

  // right bottom
  f = 0.0;
  while (f < HALF_PI) {
    vertex(radius * 2 - cos(f) * radius, radius * 2 - sin(f) * radius);
    f += PI/step;
  }

  // right top
  f = HALF_PI;
  while (f > 0) {
    vertex(radius * 2 - cos(f)* radius, sin(f)*radius);
    f -= PI/step;
  }
  endShape();
}

/*
  copy pattern by matrix
 */
void copyPattern(float xPos, float yPos) {  
  // right bottom
  fill(c1);
  drawPattern(xPos, yPos);
  
  // left top
  fill(c2);
  pushMatrix();
  rotate(PI);
  drawPattern(xPos, yPos); 
  popMatrix();

  // right top
  fill(c3);
  pushMatrix();
  rotate(PI/2);
  drawPattern(xPos, yPos); 
  popMatrix();

  // left bottom
  fill(c4);
  pushMatrix();
  rotate(PI / -2);
  drawPattern(xPos, yPos); 
  popMatrix();
}

/*
  draw PI circle
 */
void drawPattern(float xPos, float yPos) {
  pushMatrix();
  translate(radius, radius);
  arc(0, 0, radius * 2, radius * 2, 0, HALF_PI);
  popMatrix();
}

