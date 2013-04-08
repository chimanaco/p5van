class PatternSystem {
  int col;  // tate
  float radius;  // radius width
  //int sWeight = 3;  // stroke weight
  int xOffset = 0;
  int yOffset = 0;
  int bgColor = 0;
  int myColor = 255;
  String ShapeName; 


  //constructor
  PatternSystem() {
  }

  /*
    loop
   */
  void run(int col, int xOffset, int yOffset, int sWeight) {
    // bg reflesh
//    background(bgColor, 30);

    // radius
    radius = width / col;

    // draw circle pattern
    for (int i = 0; i < width; i += radius + xOffset) {
      for (int j = 0; j < height; j += radius + yOffset) {
        pushMatrix();
        translate(i, j);
        createPattern(0, 0);
        popMatrix();
      }
    }
  }

  /*
    display pattern
   */
  void createPattern(int xPos, int yPos) { 
    // create your pattern here.

    if (ShapeName == "LINE") {
      // create line
      createLine(xPos, yPos, radius, myColor, sWeight);
    } 
    else if (ShapeName == "ELLIPSE") {
      // create ellipse
      createEllipse(xPos, yPos, radius, myColor);
    } else if (ShapeName == "RECT") {
      // create Rect
      createRect(xPos, yPos, radius, radius, myColor);
    } 
    else if (ShapeName == "TRIANGLE") {
      // create Triangle
      createTriangle(xPos, yPos, radius, radius, myColor);
    }
  }

  /*
    addPattern
   */
  void addPattern(String str) {
    println(ShapeName);
    ShapeName = str;
  }

  /*
    createLine
   */
  void createLine(int x, int y, float r, color c, int w) {
    stroke(c);
    strokeWeight(w);
    line(x, y, x + r, y + r);
  }

  /*
    createEllipse
   */
  void createEllipse(int x, int y, float r, color c ) {
    fill(c);
    ellipse(x, y, r, r);
  }

  /*
    createRect
   */
  void createRect(int x, int y, float rx, float ry, color c ) {
    fill(c);
    rect(x, y, rx, ry);
  }

  /*
    createTriangle
   */
  void createTriangle(int x, int y, float rx, float ry, color c ) {
    fill(c);
    triangle(x, y, rx, ry, rx, y);
  }
}

