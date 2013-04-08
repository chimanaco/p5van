/*
  author:chimanaco
  
  referemce:
  http://woodenbooks.com/
 */

import controlP5.*;
ControlP5 cp5;
boolean cp5Visble = true;

int radius = 100;
int offset = 0;
float angle = 0;
int number = 0;
int strokeColor = 1;
int weight = 1;

float centerX;
float centerY;

int myNumber = 0;
int maxColor = 360;

String[][] cpArray = {
    {"radius","0","200"},
    {"offset","-50","50"},
    {"number","0","10"},
    {"strokeColor","0","360"},
    {"weight","0","100"}
  };

void setup() {
  size(400, 400);
  colorMode(HSB, maxColor, 100, 100);
  
  centerX = width/2;
  centerY = height/2;
  
  // setup cp5
  setupCP5(cpArray);
}

void draw() {
  background(0);
  
  // center
  createCircle(centerX, centerX, radius);
  
  // reset
  angle = 0;
  
  // orbital
  for (int i = 0; i < number; i++) {
    float xp = centerX + cos(angle) * radius /2 ;
    float yp = centerY + sin(angle) * radius /2;

    angle += TWO_PI / number;    
    createCircle(xp, yp, radius);
  }
}

void createCircle(float x, float y, float r) {
  noFill();
  strokeWeight(weight);
  stroke(strokeColor, 100, 100);
  ellipse(x, y, r, r);
  ellipse(x, y, r + offset, r + offset);
}

/**
* sets up cp5.
* @param myArray required var, min value, max value
* @return void
*/ 
void setupCP5(String[][] myArray) {
  // cp5 position
  int xPos = 10;
  int yPos = 10;  
  int yMargin = 15;
  int len = myArray.length;

  // cp5 
  cp5 = new ControlP5(this);
  
  for (int i = 0; i < len; i++) {
    cp5.addSlider(myArray[i][0])
      .setPosition(xPos, yPos + yMargin * i )
        .setRange(float(myArray[i][1]), float(myArray[i][2]));
    ;
  }
}

/**
* toggles cp5 visibility.
* @return void
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


