/*
  PatternMaker
  
  author:chimanaco
 
 */

class PatternMaker {
  float radius;  // radius width
  int number;
  int txtSize = 10;
  int capXoffset = 5;
  int capYoffset = 5;
  color fadeColor = color(255, 60);
  color txtColor = color(0);
  String caption;
  
  //constructor
  PatternMaker(String cap) {
    caption = cap;
  }

  /*
    loop
   */
  void run(int myCol) {
    // fade background
//    fader();
    // update background
    background(255);
    
    // radius
    radius = width / myCol;
    
    // sum
    number = 0;

    // draw circle pattern
    for (int i = 0; i < height; i += radius) {
      for (int j = 0; j < width; j += radius) {
        number++;
        pushMatrix();
        translate(j, i);
        createPattern();
        createCaption();
        popMatrix();
      }
    }
  }
  
  /*
    fade Background
   */
  void fader() { 
    fill(fadeColor);
    rectMode(CORNER);
    rect(0,0,width,height);
  }
  
  /*
    display caption
   */
  void createCaption() { 
    textSize(txtSize);
    fill(txtColor);
    text(caption + ": " + number, capXoffset, radius - capYoffset);
  }

  /*
    display pattern
   */
  void createPattern() { 
    // create your pattern here.
  }  
}
