class Decoration {

  void starfish(int xLocation, int yLocation,color starfish) {
    noStroke();
    beginShape();
    fill(starfish);  
    vertex(xLocation+ width*0.105, yLocation+height*0.906);
    vertex(xLocation+ width*0.118, yLocation+height*0.89);
    vertex(xLocation+ width*0.106, yLocation+height*0.875);
    vertex(xLocation+ width*0.125, yLocation+height*0.885);
    vertex(xLocation+ width*0.142, yLocation+height*0.871);
    vertex(xLocation+ width*0.132, yLocation+height*0.89);
    vertex(xLocation+ width*0.147, yLocation+height*0.904);
    vertex(xLocation+ width*0.13, yLocation+height*0.899);
    vertex(xLocation+ width*0.125, yLocation+height*0.922);
    vertex(xLocation+ width*0.121, yLocation+height*0.9);
    endShape();
  }
  
}
