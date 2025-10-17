class Decoration {
  void starfish(int xLocation) {
    noStroke();
    beginShape();
    fill(#E6E6FA);
    vertex(xLocation*0.105, height*0.906);
    vertex(xLocation*0.118, height*0.89);
    vertex(xLocation*0.106, height*0.875);
    vertex(xLocation*0.125, height*0.885);
    vertex(xLocation*0.142, height*0.871);
    vertex(xLocation*0.132, height*0.89);
    vertex(xLocation*0.147, height*0.904);
    vertex(xLocation*0.13, height*0.899);
    vertex(xLocation*0.125, height*0.922);
    vertex(xLocation*0.121, height*0.9);
    endShape();
  }
}
