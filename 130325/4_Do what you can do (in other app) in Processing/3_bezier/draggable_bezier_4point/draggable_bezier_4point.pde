/*
  author:chimanaco
 
 inspired:
 my socks
 
 Generic methods for dashed lines- OpenProcessing
 http://www.openprocessing.org/sketch/7013
 
 */

import controlP5.*;
ControlP5 cp5;
ColorPicker cp;

// pattern
int lineNumber = 4;
int lineWeight = 7;

boolean cp5Visble = true;
ArrayList particles;
// particles[] pArray; 

float[] xArray = { 85, 10, 90, 15 };
float[] yArray = { 20, 10, 90, 80 };

float[] xPos = { 85, 10, 90, 15 };
float[] yPos = { 20, 10, 90, 80 };


/*
  setup cp5
 */
void setup() {
  size(400, 400);
  colorMode(RGB);
  smooth();
    
  // createArray
  particles = new ArrayList();
  for (int i = 0; i < 4; i++) {
    particles.add(new Draggable(xArray[i], yArray[i], 10, 10));
  }
  
  // setup cp5
  setupCP5();
}

/*
  setup cp5
 */
void setupCP5() {
  int xPos = 10;
  int yPos = 100;

//  // cp5 
//  cp5 = new ControlP5(this);
//
//  // color
//  //  cp = cp5.addColorPicker("picker")
//  //    .setPosition(xPos, yPos)
//  //      //      .setColorValue(color(15, 31, 106, 255))
//  //      .setColorValue(color(180, 15, 15, 255))
//  //        ;
//
//  // slider
//  String[] slides = {
//    "x1", "y1", "x2", "y2", "x3", "y3", "x4", "y4"
//  };
//  int[] minList = {
//    0, 0, 0, 0, 0, 0, 0, 0
//  };
//  int[] maxList = {
//    200, 200, 200, 200, 200, 200, 200, 200
//  };
//
//  int yMargin = 15;
//  int len = slides.length; 
////  yPos = 10;
//
//  for (int i = 0; i < len; i++) {
//    cp5.addSlider(slides[i])
//      .setPosition(xPos, yPos + yMargin * i )
//        .setRange(minList[i], maxList[i]);
//    ;
//  }
}

/*
  loop
 */
void draw() {
  background(168, 100, 60);
  
  createBG();
  
  for (int i = particles.size()-1; i >= 0; i--) {
    Draggable d = (Draggable) particles.get(i);
    d.rollover(mouseX,mouseY);
    d.drag(mouseX,mouseY);
    d.display();
    xPos[i] = d.x;
    yPos[i] = d.y;
  }

//  pushMatrix();
//  translate(width/2, height/2);
//popMatrix();

  noFill();
 
  stroke(255, 255, 255);
  line(xPos[0], yPos[0], xPos[1], yPos[1]);
  line(xPos[2], yPos[2], xPos[3], yPos[3]);
  stroke(0, 0, 0);
  
  bezier(xPos[0], yPos[0], xPos[1], xPos[1], xPos[2], xPos[2], xPos[3], yPos[3]);
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
  change pattern
 */
void createBG() { 
  int cellWidth = width/20;
  int cellHeight = height/30;
  stroke(255);
  //vertical lines
  for (int i=cellWidth; i<width; i+=cellWidth) {
    for (int j=0; j<height; j++) {
      point(i, j);
    }
  }
  //horizontal lines
  for (int i=cellHeight; i<height; i+=cellHeight) {
    for (int j=0; j<width; j++) {
      point(j, i);
    }
  }
}

void mousePressed() {  
  for (int i = particles.size()-1; i >= 0; i--) {
    Draggable d = (Draggable) particles.get(i);
     d.clicked(mouseX,mouseY);
  }
}

void mouseReleased() {  
  for (int i = particles.size()-1; i >= 0; i--) {
    Draggable d = (Draggable) particles.get(i);
     d.stopDragging();
  }
}
