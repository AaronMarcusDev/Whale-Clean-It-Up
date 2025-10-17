class Whale {
  float x, y;
  float t = 0;
  float flipperAngle = 0;
  int f = 1; //faceDirection: determines whether whale faces left or right

  Whale(float initX, float initY) {
    x = initX;
    y = initY;
  }

  void display() {
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
    vertex(f*-10,20);
    vertex(f*-30,25);
    vertex(f*-45,40);
    vertex(0,30);
    vertex(f*10,20);
    endShape();
    
    fill(#000000);
    circle(f*40,0,6);
    rect(f*30,-29,20,5);
    rect(f*34,-39,12,10);

    translate(f*-90, 32/4);
    rotate(0.5*sin(5*flipperAngle));
    fill(#519FCE);
    //noStroke();
    circle(0, 0, 38);
    stroke(#000000);
    beginShape();
    vertex(0, -19);
    vertex(f*-40, -15);
    vertex(f*-50, -13);
    vertex(f*-70,-18);
    vertex(f*-90,-20);
    vertex(f*-60, -5);
    vertex(f*-40,5);
    vertex(0, 19);
    endShape();
    
    flipperAngle += PI/180;
    if (flipperAngle >= 2*PI) {
     flipperAngle = 0; 
    }
  }

  void move(float dx, float dy) {
    x += dx;
    y += dy;
  }
  
  void setF(int input) {
   f = input; 
  }
}
