/*
  author:chimanaco
 
 inspired:
 
 http://checkmate.wonderfl.net/fladdict.html
 
 */

import controlP5.*;
ControlP5 cp5;
RadioButton r;
boolean cp5Visble = true;

AnimationPatternSystem ps;
//PatternSystem ps;

int col = 16;  // tate
float radius;  // radius width
int sWeight = 3;  // stroke weight
int xOffset = 0;
int yOffset = 0;

char letter = 'N';


/*
  setup cp5
 */
void setup() {
  size(400, 400);
  colorMode(RGB, 255, 255, 255);
  
//  frameRate(5);
  
  // pattern system
  ps = new AnimationPatternSystem();
//  ps = new PatternSystem();
    //ps.addPattern("LINE");  // LINE, ELLIPSE, RECT, TRIANLGLE
   ps.addPattern("ELLIPSE");  // LINE, ELLIPSE, RECT, TRIANLGLE
   //ps.addPattern("RECT");  // LINE, ELLIPSE, RECT, TRIANLGLE
  // ps.addPattern("TRIANLGLE");  // LINE, ELLIPSE, RECT, TRIANLGLE
  // setup cp5
  setupCP5();
}



/*
  loop
 */
void draw() {
  // update
  ps.run(col, xOffset, yOffset, sWeight);
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
    "col", "sWeight", "xOffset", "yOffset"
  };
  int[] minList = {
    1, 1, -20, -20
  };
  int[] maxList = {
    30, 15, 20, 20
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
