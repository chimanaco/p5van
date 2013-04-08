/*
  CirclePatternMaker
 author:chimanaco
 
 */
class SquarePatternMaker extends PatternMaker { 
  float angle;
  int xOffset;
  int yOffset;
  float myWidth;
  float speed;
  float speedValue;

  // Vancouver color
  color c1 = color(0, 90, 157);
  color c2 = color(0, 131, 199);
  color c3 = color(0, 159, 214);
  color c4 = color(0, 183, 227);
  color c5 = color(105, 188, 70);
  color c6 = color(0, 166, 84);
  color c7 = color(0, 112, 118);
  color [] colors = {c1, c2, c3, c4, c5, c6, c7};
  
  //constructor
  SquarePatternMaker(int xo, int yo, String cap) {
    super(cap);
    xOffset = xo;
    yOffset = yo;

    strokeWeight(1);
  }

  /*
    display pattern
   */
  void createPattern() { 
    // create your pattern here.
    noFill();
    
    float myHeight = sin(radians(speed));
    float m = map(myHeight, -1, 1, 0, 1);
    // m = 1;
    
    angle = 360 / number;
    point(radius /2, radius /2);        
    
    // color
    int colorNum = number % colors.length;    
    color myColor = colors[colorNum];
    stroke(myColor);
    
    // orbital
    for (int i = 0; i < 360; i+=angle) {
    //stroke(number, 100, 100);

      pushMatrix();
      translate(radius /2, radius /2);
      rotate(radians(i / 2));
      rect(-(radius - xOffset) * myWidth / 2, - ((radius - xOffset) * m) / 2, (radius - xOffset) * myWidth, (radius - xOffset) * m);
      popMatrix();
    }
    speed += speedValue;
  }
}

