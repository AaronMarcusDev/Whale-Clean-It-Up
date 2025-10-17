class Bin {
  float x, y;
  float arrowAngle; 
  color col;
  
  //Bin(float x, float y, float arrowAngle) {
  //  this.x = x;
  //  this.y = y;
  //  this.arrowAngle = arrowAngle;
  //}

  void display() {
    pushMatrix();
    translate(x, y); 


    fill(#059142);
    stroke(0);
    quad(95, 192, 195, 192, 180, 344, 100, 344);


    pushMatrix();
    translate(130, 255); 
    rotate(arrowAngle);  

    fill(#FFFFFF);
    noStroke();
    beginShape();
    vertex(10, -20);  
    vertex(0, -20);
    vertex(0, -25);
    vertex(-10, -10);
    vertex(0, 5);
    vertex(0, 0);
    vertex(10, 0);
    endShape(CLOSE);

    popMatrix(); 
    popMatrix();
  }
}

// need it to move back and forth horizontally
// need a sinwave that follows the wave from the BG
