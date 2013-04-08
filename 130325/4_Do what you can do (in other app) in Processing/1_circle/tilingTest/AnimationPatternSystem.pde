class AnimationPatternSystem extends PatternSystem {

  //constructor
  AnimationPatternSystem() {
    super();
  }
  
  /*
    display pattern
   */
  void createPattern(int xPos, int yPos) { 
    // create your pattern here.

    color from = color(204, 102, 0);
    color to = color(0, 102, 153);
    color interA = lerpColor(from, to, random(1));
    color interB = lerpColor(from, to, random(1));

    float scaleX = random(0, 2); 
    float scaleY = random(0, 2); 

    if (ShapeName == "LINE") {
      // create line
      createLine(xPos, yPos, radius, interA, sWeight);
    } 
    else if (ShapeName == "ELLIPSE") {
      // create ellipse
      createEllipse(xPos, yPos, radius * scaleX, interB);
    } else if (ShapeName == "RECT") {
      // create Rect
      createRect(xPos, yPos, radius * scaleX, radius * scaleY, interB);
    } 
    else if (ShapeName == "TRIANGLE") {
      // create Triangle
      createTriangle(xPos, yPos, radius * scaleX, radius * scaleY, interB);
    }
  }
  
  /*
    createLine
   */
  void createLine(int x, int y, float r, color c, int w ) {
    stroke(c);
    strokeWeight(w);
    //      pushMatrix();
    //      translate(0, 0);
    //      rotate(random(TWO_PI));
    line(x, y, x + r, y + r);
    //      popMatrix();
  }

  /*
    createEllipse
   */
  void createEllipse(int x, int y, float r, color c ) {
    fill(c, random(255));
    ellipse(x, y, r, r);
  }

  /*
    createRect
   */
  void createRect(int x, int y, float rx, float ry, color c ) {
    fill(c, random(255));
    rect(x, y, rx, ry);
  }

  /*
    createTriangle
   */
  void createTriangle(int x, int y, float rx, float ry, color c ) {
    fill(c, random(255));
    rect(x, y, rx, ry);

    fill(c, random(255));
    pushMatrix();
    translate(0, 0);
    rotate(random(TWO_PI));
    triangle(x, y, rx, ry, rx, y);
    popMatrix();
  }
}

