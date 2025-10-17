class Trash {
  float x, y;
  float speed;
  PImage image;

  boolean isColliding(float x1, float y1, float w1, float h1,
    float x2, float y2, float w2, float h2) {
    return !(x1 + w1 < x2 || x1 > x2 + w2 ||
      y1 + h1 < y2 || y1 > y2 + h2);
  }


  Trash(float x, float y, PImage image) {
    this.x = x;
    this.y = y;
    this.image = image;
    this.speed = random(1, 3);
  }

  void update() {
    if (y < height * 0.75 - image.height / 2) { // if id hasn't touched the ocean floor yet, keep going down
      y += speed;
    }
  }

  void display() {
    imageMode(CENTER);
    image(image, x, y);
  }
}

