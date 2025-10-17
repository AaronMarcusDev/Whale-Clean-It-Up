BG backgroundScene;
ArrayList<Trash> trashList;
PImage[] trashSprites = new PImage[3];
Decoration dcr;
Whale player;

int lastSpawnTime = 0;
int spawnInterval = 5000;

int moveDirX = 0;
int moveDirY = 0;

void setup() {
  size(1000, 800);
  backgroundScene = new BG();
  dcr = new Decoration();
  player = new Whale(width/2, height/2);
  trashList = new ArrayList<Trash>();

  // Load and resize trash images
  trashSprites[0] = loadImage("trash1.png");
  trashSprites[1] = loadImage("trash2.png");
  trashSprites[2] = loadImage("trash3.png");

  for (int i = 0; i < trashSprites.length; i++) {
    trashSprites[i].resize(60, 60);
  }
}

void spawnTrash() {
  int index = int(random(trashSprites.length)); // select random trash object from list
  PImage selectedImg = trashSprites[index]; // get that object
  trashList.add(new Trash(random(width), -20, selectedImg));
  //                                       ^-- so that it starts just above the screen
}

void keyPressed() {
  if (keyCode == 'a' || keyCode == 'A') {
    moveDirX = -1;
  } else if (keyCode == 'd' || keyCode == 'D') {
    moveDirX = 1;
  } else if (keyCode == 'w' || keyCode == 'W') {
    moveDirY = -1;
  } else if (keyCode == 's' || keyCode == 'S') {
    moveDirY = 1;
  }
}

void keyReleased() {
  if (keyCode == 'a' || keyCode == 'A' || keyCode == 'd' || keyCode == 'D') {
    moveDirX = 0;
  } else if (keyCode == 'w' || keyCode == 'W' || keyCode == 's' || keyCode == 'S') {
    moveDirY = 0;
  }
}

void draw() {
  backgroundScene.display();
  dcr.starfish(600, -50, #E6E6FA);
  dcr.starfish(200, 0, #FFB347);
  dcr.starfish(100, 70, #D8BFD8);
  dcr.starfish(840, -20, #8FDDE7);
  dcr.starfish(20, -40, #FFCBA4);
  dcr.starfish(-10, 10, #FA8072);
  dcr.starfish(450, -60, #FFDAB9);
  dcr.starfish(430, 35, #FF9966);

  player.move(moveDirX, moveDirY);
  if (moveDirX != 0) {
    player.setF(moveDirX);
  }
  player.display();

  if (millis() - lastSpawnTime > spawnInterval) {
    spawnTrash();
    lastSpawnTime = millis();
  }

  for (Trash t : trashList) {
    t.update();
    t.display();

    if (player.collidesWith(t)) {
      println("Whale collided with trash");
      t.active = false;
    }
  }
}
