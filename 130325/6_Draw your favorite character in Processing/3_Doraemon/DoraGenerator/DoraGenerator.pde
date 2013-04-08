/*

 http://wonderfl.net/c/if9A/
 
 */

import controlP5.*;
ControlP5 cp5;
boolean cp5Visble = true;
RadioButton r;
int myColorBackground = color(0,0,0);

//int alphalpha = 120;
int alphalpha = 255;

color bgColor = color(255, 152, 170);
//color bgColor = color(0);
color lineColor = color(0, 255);

float headRX = 95;
float headRY = 85;
float headY = 5;
color headColor = color(25, 120, 254, alphalpha);

float faceRX = 75;
float faceRY = 65;
float faceY = 15;
color faceColor = color(255, alphalpha);

float eyeRadius = 30;
float eyeX = 15;
float eyeY = -15;
color eyeColor = color(255, alphalpha);

float eyeBallX = 0;
float eyeBallY = 0;
float eyeBallR = 5;
color eyeBallColor = color(0);
float eyeBallWeight = 3;
float eyeBallAngle = 0;
float eyeBallSpeed = 7;
float eyeBallRound = 5;

float noseR = 15;
float noseY = 3;
color noseColor = color(255, 0, 0);
float noseLineL = 28;

float mouthR = 30;
float mouthY = 24;
float mouthH = 20;

float beardW = 20;
float beardX = 10;
float beardY = 9;
float beardMarginY = 4;
float beardOffsetX = 0;
float beardAngle = 0;

int sum;  // number of D
int currentNum = 0;  // current number
int preNum = 0;  // previous number
float pos;  // current postion
int endPos;  // distanation postion
float speed = 1; // original motion speed from center to destination
float angle;  // rotation angle

int interval = 3000;
int startTime;

boolean firstTime = true;
boolean animation = false;


/*

 [0] 0 -> 1D
 [1] 15 -> 2D
 [2] 23 -> 3D
 [3] 30 -> 4D
 [4] 35 -> 5D
 [5] 40 -> 6D
 [6] 50 -> 8D
 [7] 60 -> 10D
 [8] 72 -> 12D
 [9] 100 -> 18D
 [10] 130 -> 24D
 [11] 160 -> 30D
 [12] 200 -> 40D
 
 */

//final int NUMBERS[] = {1, 2, 3, 4, 5, 6, 8, 10, 12, 18, 24, 30, 40};
//final float POSITIONS[] = {0, 15, 23, 30, 35, 40, 50, 60, 72, 100, 130, 160, 200};
final int NUMBERS[] = {
  1, 2, 3, 4, 5, 6, 8, 10, 12, 18, 20
};
final int NUMBERS_LENGTH = NUMBERS.length;
final int POSITIONS[] = {
  0, 15, 23, 30, 35, 40, 50, 60, 72, 100, 110
};

/*
  setup
 */
void setup() {
  size(600, 600);
  colorMode(RGB);
  background(bgColor);
  smooth();

  // set first time
  changeNumber();

  // setup cp5
  setupCP5();
}

/*
  loop
 */
void draw() {
  if(animation) {
    background(bgColor);
  
    // timer
    if (millis() > startTime + interval) {
      startTime = millis(); // reset start time  
        changeNumber();
    }
  }

  // position
  if (pos < endPos) {
    pos = pos + speed;
  } 
  else {
    pos = endPos;
  }

  pushMatrix();
  translate(width / 2, height / 2);  

  // Duplicate
  /*for (int i = 0; i < 360; i+=angle) {
   pushMatrix();
   rotate(radians(i));
   drawDora();
   popMatrix();
   }*/

  for (int j = 0; j < 7; j++) {    
    for (int i = 0; i < 360; i+=angle) {
      pushMatrix();
      rotate(radians(i));
      translate(0, pos);
      stroke(lineColor);

      if (j == 0) {
        noStroke();
        // head
        doraHead();
      } 
      else if ( j == 1) {
        noStroke();
        // face
        doraFace();
      } 
      else if ( j == 2) {
        // eye
        doraEye();
      } 
      else if ( j == 3) {
        // eyeBall
        doraEyeBall();
      } 
      else if ( j == 4) {
        // nose
        doraNose();
      } 
      else if ( j == 5) {
        // mouth
        doraMouth();
      } 
      else if (j == 6) {
        // beard
        doraBeard();
      }
      popMatrix();
    }
  }
  popMatrix();

  // text
  displayText();

  // dora speed
  speed = speed * 1.1;  
  // eye speed
  eyeBallAngle += eyeBallSpeed;
}


/*
  changeNumber
 */
void changeNumber() { 
  pos = 0;
  speed = 1;

  if (firstTime) {
    sum = 1;
    firstTime = false;
  } 
  else {
    sum = int(random(1, NUMBERS_LENGTH + 1));
  }

  // set destination postion
  endPos = POSITIONS[sum - 1];

  // set current number
  currentNum = NUMBERS[sum - 1];

  // set angle
  angle = 360 / currentNum;

  // set offset
  switch(currentNum) {
  case 6: 
    beardOffsetX = 6;
    beardAngle = 30;
    mouthR = 30;
    break;
  case 8: 
    beardOffsetX = 4;
    beardAngle = 25;
    mouthR = 28;
    break;
  case 10:
    beardOffsetX = 3;
    beardAngle = 20;
    mouthR = 25;
    break;
  case 12:
    beardOffsetX = 3;
    beardAngle = 15;
    mouthR = 24;
    break;
  case 18:
    beardOffsetX = 0;
    beardAngle = 10;
    mouthR = 20;
    break;
  case 20:
    beardOffsetX = 0;
    beardAngle = 5;
    mouthR = 20; 
    break;
  default: 
    beardOffsetX = 0;
    beardAngle = 0;
    mouthR = 30;
    break;
  }
}

//  Head
void doraHead() {
  fill(headColor);
  ellipse(0, headY, headRX, headRY);
}

//  Face
void doraFace() {
  fill(faceColor);
  ellipse(0, faceY, faceRX, faceRY);
}

//  Eye
void doraEye() {
  fill(eyeColor);
  ellipse(eyeX, eyeY, eyeRadius, eyeRadius);
  if (sum < 2) {
    ellipse(-eyeX, eyeY, eyeRadius, eyeRadius);
  }
}

//  EyeBall
void doraEyeBall() {
  strokeWeight(eyeBallWeight);
  noFill();
  ellipse(eyeX + eyeBallX + eyeBallRound * cos(radians(eyeBallAngle)), eyeY + eyeBallY + eyeBallRound * sin(radians(eyeBallAngle)), eyeBallR, eyeBallR);
  if (sum < 2) {
    ellipse(-eyeX -( eyeBallX + eyeBallRound * cos(radians(eyeBallAngle))), eyeY + eyeBallY + eyeBallRound * sin(radians(eyeBallAngle)), eyeBallR, eyeBallR);
  }
}

//  Nose 
void doraNose() {
  strokeWeight(1);
  fill(noseColor);
  ellipse(0, noseY, noseR, noseR);

  line(0, noseY + noseR / 2, 0, noseY + noseR / 2 + noseLineL);
}

//  Mouth
void doraMouth() {
  noFill();
  bezier(-mouthR, mouthY, -mouthR + (mouthR / 3), mouthY + mouthH, mouthR - (mouthR / 3), mouthY + mouthH, mouthR, mouthY);
}

//  Beard
void doraBeard() {
  pushMatrix();
  translate(0, beardY);

  for (int i = 0; i < 3; i++) {
    float by = beardMarginY * i;    

    pushMatrix();
    translate(beardX + beardOffsetX, 0);
    rotate(radians( - beardAngle));
    line(0, by, beardW, by);
    popMatrix();

    if (currentNum < 6) {
      pushMatrix();
      translate( -beardX, 0);
      line(0, by, - beardW, by);
      popMatrix();
    }
  }
  popMatrix();
}

//  text
void displayText() {
  int n;

  fill(headColor);
  textAlign(RIGHT);

  if (preNum == currentNum) {
    n = currentNum;
  } 
  else {
    if (preNum < currentNum) {
      preNum++;
    } 
    else {
      preNum--;
    }
    n = preNum;
  }

  text(n + "D", 580, 20);
}

/*
  drawPetal
 */
void drawDora() {
  pushMatrix();
  translate(0, pos);  

  // head
  doraHead();
  // face
  doraFace();
  // eye
  doraEye();
  // eyeBall
  doraEyeBall();
  // nose
  doraNose();
  // mouth
  doraMouth();
  // beard
  doraBeard();

  popMatrix();
}

//  guide
void guideShape() {
  // shepe
  stroke(255, 0, 0);

  if (sum == 3) {
    triangle(width/2 -15, height/2 + 20, width/2, height/2 -10, width/2 + 15, height/2 +20);
  }

  if (sum == 4) {
    rectMode(CENTER);
    rect(width/2, height/2, 30, 30);
  }

  if (sum == 5) {
    pentagon(width/2, height/2, 60);
  }

  if (sum == 6) {
    hexagon(width/2, height/2, 60);
  }
}

//  五角形の描画
void pentagon(float centerX, float centerY, float size) {
  final float COS[] = {
    0.95105654, 0.5877853, -0.5877852, -0.95105654, 0
  };
  final float SIN[] = {
    -0.309017, 0.809017, 0.809017, -0.30901697, -1
  };

  final float RADIUS = size / 2;
  beginShape();
  for (int i = 0; i < 5; i++) {
    float tx = COS[i] * RADIUS + centerX;
    float ty = SIN[i] * RADIUS + centerY;
    vertex(tx, ty);
  }
  endShape(CLOSE);
}

//  六角形の描画
void hexagon(float centerX, float centerY, float size) {
  final float COS[] = {
    1, 0.5, -0.5, -1, -0.5, 0.5
  };
  final float SIN[] = {
    0, 0.8660254, 0.8660254, 0, -0.86602524, -0.86602524
  };

  final float RADIUS = size / 2;
  beginShape();
  for (int i = 0; i < 6; i++) {
    float tx = COS[i] * RADIUS + centerX;
    float ty = SIN[i] * RADIUS + centerY;
    vertex(tx, ty);
  }
  endShape(CLOSE);
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
    "headRX", "headRY", "headY", "faceRX", "faceRY", "faceY", "eyeRadius", "eyeX", "eyeBallR", "eyeBallX", 
    "eyeBallY", "noseR", "noseY", "noseLineL", "mouthR", "mouthY", "mouthH", "beardW", "beardX", "beardY", 
    "beardMarginY", "beardA", "beardB", "eyeBallSpeed", "eyeBallRound", "num"
  };

  int len = slides.length; 
  int minValue = -10;
  int[] minList = new int[len];
  for (int i = 0; i < len; i++) {
    if (i == len -1 ) {
      minList[i] = 1;
    } 
    else {
      minList[i] = minValue;
    }
  }

  int maxValue = 200;
  int[] maxList = new int[len];
  for (int i = 0; i < len; i++) {
    if (i == len -1 ) {
      maxList[i] = NUMBERS_LENGTH;
    } 
    else {
      maxList[i] = maxValue;
    }
  }

  int yMargin = 15;

  for (int i = 0; i < len; i++) {
    cp5.addSlider(slides[i])
      .setPosition(xPos, yPos + yMargin * i )
        .setRange(minList[i], maxList[i]);
    ;
  }
  
  r = cp5.addRadioButton("radioButton")
         .setPosition(10,400)
         .setSize(15,15)
         .setItemsPerRow(2)
         .setSpacingColumn(20)
         .addItem("ON",1)
         .addItem("OFF",2)
         ;
  }
  


/*
  cp5 visible
 */
// void mouseClicked() {
//   if (cp5Visble) {
//     cp5.hide();
//   } 
//   else {
//     cp5.show();
//   }
//   cp5Visble = !cp5Visble;
// }

void keyPressed() {
  switch(key) {
    case('0'): r.deactivateAll(); break;
    case('1'): r.activate(0); break;
    case('2'): r.activate(1); break;
  }
  
}

void radioButton(int a) {
  println("a radio Button event: "+a);
  if(a == 1) {
    animation = true;
  }else {
    animation = false;
  }
}
