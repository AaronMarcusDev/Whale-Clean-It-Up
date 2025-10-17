class Whale {
  float x, y;
  float t = 0;
  float flipperAngle = 0;
  float moveSpeed = 3; //whale move speed
  int f = 1; //faceDirection: determines whether whale faces left or right
  // purely for collision checking


  Whale(float initX, float initY) {
    x = initX;
    y = initY;
  }

  boolean collidesWith(Trash t) {
    float whaleW = 160;  // total horizontal span (from -90 to +75)
    float whaleH = 60;  // vertical span (from top fin to belly)
    return isColliding(x - whaleW/2, y - whaleH/2, whaleW, whaleH,
      t.x - t.image.width/2, t.y - t.image.height/2, t.image.width, t.image.height);
  }

  void display() {
    // MAIN BODY
    pushMatrix();
    stroke(0);
    translate(x, y);
    beginShape();
    fill(#519FCE);
    vertex(f*75, 0);
    vertex(f*65, -20);
    vertex(f*45, -29);
    vertex(f*10, -28);
    vertex(f*-5, -25);
    vertex(f*-45, -15);
    vertex(f*-60, -11);
    vertex(f*-90, -11);
    vertex(f*-90, 15);
    vertex(f*35, 10);
    endShape();

    beginShape();
    fill(#DDDDDD);
    vertex(f*75, 0);
    vertex(f*35, 10);
    vertex(f*-90, 15);
    vertex(f*-90, 27);
    vertex(f*-10, 31);
    vertex(f*45, 27);
    vertex(f*67, 18);
    endShape();

    beginShape();
    fill(#519FCE);
    vertex(f*-10, 20);
    vertex(f*-30, 25);
    vertex(f*-45, 40);
    vertex(0, 30);
    vertex(f*10, 20);
    endShape();

    //BAG
    fill(#DEC59D);
    beginShape();
    vertex(f*-20, 30);
    vertex(f*-5, 40);
    vertex(0, 55);
    vertex(f*-5, 65);
    vertex(f*-20, 70);
    vertex(f*-35, 65);
    vertex(f*-40, 55);
    vertex(f*-35, 40);
    endShape();
    circle(f*-20,30,10);


    fill(#000000);
    // EYE
    circle(f*40, 0, 6);
    // TOP HAT
    pushMatrix();
    translate(f*30,-29);
    rotate(f*PI/24);
    rect(0, 0, f*20, 5);
    rect(f*4, -10, f*12, 10);
    popMatrix();

    // FLIPPER
    translate(f*-90, 32/4);
    rotate(0.5*sin(5*flipperAngle));
    fill(#519FCE);
    circle(0, 0, 38);
    beginShape();
    vertex(0, -19);
    vertex(f*-40, -15);
    vertex(f*-50, -13);
    vertex(f*-70, -18);
    vertex(f*-90, -20);
    vertex(f*-60, -5);
    vertex(f*-40, 5);
    vertex(0, 19);
    endShape();
    popMatrix();

    flipperAngle += PI/180;
    if (flipperAngle >= 2*PI) {
      flipperAngle = 0; //resets when gone through a full period to prevent overflow
    }
  }

  void move(float dx, float dy) {
    x += dx*moveSpeed;
    y += dy*moveSpeed;
  }
  
  void setPos(float setX, float setY) {
   x = setX;
   y = setY;
  }

  void setF(int input) {
    f = input; //changes face direction
  }
  
  float getPosX() {
    return x;
  }
  
  float getPosY() {
   return y; 
  }
}
