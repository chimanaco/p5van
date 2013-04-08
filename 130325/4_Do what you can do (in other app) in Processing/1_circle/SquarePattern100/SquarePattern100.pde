/*
  author:chimanaco
 
 inspired:
 http://checkmate.wonderfl.net/fladdict.html
 
 TRIANGLE_STRIP, Bezier Ellipse
 
 */

import controlP5.*;
ControlP5 cp5;
RadioButton r;
boolean cp5Visble = true;

//PatternMaker pm;
SquarePatternMaker pm;

int col = 1;  // tate
int xOffset = 15;
int yOffset = 15;
String caption = "SQUARE";
float w = 0.4;
float s = 0.1;

/*
  setup
 */
void setup() {
  size(400, 400);
  //colorMode(HSB, 100, 100, 100, 100);
  colorMode(RGB);
  
  // pattern system
  pm = new SquarePatternMaker(xOffset, yOffset, caption);
  
  // setup cp5
  setupCP5();

  // noLoop
//  noLoop();
}

/*
  loop
 */
void draw() {
  // update
  pm.myWidth = w;
  pm.speedValue = s;
  pm.run(col);
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
    "col", "w", "s"
  };
  float[] minList = {
    1, 0, 0.1
  };
  int[] maxList = {
    10, 1, 5
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

