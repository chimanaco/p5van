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

import processing.opengl.*;

// color
color bgColor = color(0);
color drawColor = color(20, 50, 70);
float _bgAlpha = 1;

float _s = 18;
float _t = 1;
float _radius = 100; 
float _width = 180; 
float _rotatez = 0.01; 
float _rotatey = 0.01; 

float xstart, xnoise, ystart, ynoise, zstart, znoise;

int sideLength = 200;
int spacing = 5;

String[][] cpArray = {
    {"_t","0.01","1"},
    {"_s","1","100"},
    {"_radius","1","200"},
    {"_width","1","540"},
    {"_rotatez","0.01","1"},
    {"_rotatey","0.01","1"}
};

/*
  setup
 */
void setup() {
    // Screen
    size(500, 300, OPENGL);
    background(bgColor);

    // setup cp5
    setupCP5(cpArray);
    stroke(drawColor);
    //noLoop();
}

/*
  loop
 */
void draw() {
    // Background
    background(bgColor);
    //fadeBackground(bgColor, _bgAlpha); 

    pushMatrix();
    translate(width / 2, height / 2, 0);
    rotateZ(frameCount * _rotatez);
    rotateY(frameCount * _rotatey);
    
    float s = 0;
    float t = 0;
    float lastx = 0;
    float lasty = 0;
    float lastz = 0;

    while( t < _width) {
        s += _s;
        t += _t;

        float radianS = radians(s);
        float radianT = radians(t);
        float thisx = 0 + (_radius * cos(radianS) * sin(radianT));
        float thisy = 0 + (_radius * sin(radianS) * sin(radianT));
        float thisz = 0 + (_radius * cos(radianT));

        if(lastx != 0) {
            //line(thisx, thisy, thisz, lastx, lasty, lastz);
            point(thisx, thisy, thisz);
            box(thisx, thisy, thisz);
        }

        lastx = thisx;
        lasty = thisy;
        lastz = thisz;

    }
    popMatrix();
}

void drawPoint(float x, float y, float z, float noiseFactor) {
    pushMatrix();
    translate(x, y, z);
    float grey = noiseFactor * 255;
    fill(grey, 10);
    box(spacing, spacing, spacing);
    popMatrix();
}

/**
* fades background.
* @param c color for background
* @param a alpha for background
* @return void
*/ 
void fadeBackground(color c, float a) {
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
