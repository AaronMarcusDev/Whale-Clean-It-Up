class Trash {
  float x, y;
  float speed;
  PImage image;

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

