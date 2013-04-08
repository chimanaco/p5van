/*
  Author:
 chimanaco
 
 Created:
 2013.03.19
 
 Inspired:
 
 
 */

// cp5
import controlP5.*;
ControlP5 cp5;
boolean cp5Visble = true;

// color
color bgColor = color(0);
color drawColor = color(255, 255, 255);
int bgAlpha = 10;
int sWeight = 1;

float myHue = 0;
int maxHue = 360;
int hueSpeed = 1;

float step = 1;
float lastx = -999;
float lasty = -999;
float seed = 10;  

int offsetY = 80;
int angle = 0;

int _number = 1;
int _innnerRadius = 100;
int _outerRadius = 150;

String[][] cpArray = {
    {"_number","1","20"},
    // {"_ySpeed","0","0.1"},
    // {"_lineStrokeWeight","1","100"},
    // {"_innnerSpeed","1","30"},
    {"_innnerRadius","1","300"},
    {"_outerRadius","1","400"}
  };


/*
  setup
 */
void setup() {
  // Screen
  size(400, 400);
  background(bgColor);
  colorMode(HSB, maxHue, 100, 100);

  smooth();

  // setup cp5
    setupCP5(cpArray);
}

/*
  loop
 */
void draw() {
  // Background
  //background(bgColor);
  fadeBackground(bgColor, bgAlpha);
  
  strokeWeight(sWeight);
  
  float ynoise = random(10);

  angle++;


  stroke(0, 255);
  stroke(myHue, 100, 100);
  
  int n = _number;
  float firstx = 0;  
  float firsty = 0;  
  float lastx = _innnerRadius;
  float lasty = 0;

  for (int i = 0; i < n + 1; i ++){
    float c = cos(radians(i * 360 / n));
    float s = sin(radians(i * 360 / n));
    
    float xPos;
    float yPos;

    if(i % 2 == 0 ) {
      xPos = c * _innnerRadius;
      yPos = s * _innnerRadius;
      fill(255);
    } else {
      xPos = c * _outerRadius;
      yPos = s * _outerRadius;
      fill(0);
    }

    pushMatrix();
    translate(width / 2, height / 2);
    point(xPos, yPos);
  
     if(i == 0 ) {
       stroke(255,0 ,255);
       strokeWeight(10); 
    }
  
    if(i == 1 ) {
        firstx = lastx;
        firsty = lasty;
    }

    if(i > 0 ) {
      stroke(255,0 ,0);
       strokeWeight(2);
        // line(lastx, lasty, xPos, yPos);
        // vertex(0, 0);
        // vertex(lastx, lasty);

        // ellipse(lastx, lasty, 30, 30);
        // vertex(xPos, yPos);
        // ellipse(xPos, yPos, 10, 10);

        triangle(0, 0, lastx, lasty, xPos, yPos);

    }

    if( i == n - 1 ) {
        // stroke(200, 100, 100);
        // // line(xPos, yPos, firstx, firsty);
        // vertex(0, 0);
        // vertex(xPos, yPos);
        // vertex(lastx, lasty);
    }
    // endShape();

    popMatrix();

    lastx = xPos;
    lasty = yPos;
  }
}

/*
  fade background
 */
void fadeBackground(color c, int a) {
  noStroke();
  fill(c, a);
  rectMode(CORNER);
  rect(0, 0, width, height);
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
