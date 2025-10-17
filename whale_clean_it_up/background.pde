class BG {
  float phase = 0;

  void display() {
    // Sky
    background(135, 206, 235); // light sky blue

    // Ocean surface as sine wave
    noStroke();
    fill(37, 150, 190); // ocean color
    beginShape();

    for (float x = 0; x <= width; x += 10) {
      float waveHeight = 20;
      float waveLength = 100;
      float yDownwards = 100;

      // Simple mathematical sine wave at the top
      float y = (yDownwards + sin(frameCount * 0.04) * 15) + waveHeight * sin((x / waveLength) + phase);
      //                                ^-- For up and down movement
      vertex(x, y);
    }


    vertex(width, height); // bottom right
    vertex(0, height);     // bottom left
    endShape(CLOSE);

    // Ocean floor
    fill(194, 178, 128); // sandy color
    rect(0, height * 0.75, width, height * 0.25);

    phase += 0.02;
  }
}
