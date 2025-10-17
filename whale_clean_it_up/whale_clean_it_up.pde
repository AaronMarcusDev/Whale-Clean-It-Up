BG backgroundScene;
ArrayList<Trash> trashList;
PImage[] trashSprites = new PImage[3];
Decoration dcr;
Whale player;

int lastSpawnTime = 0;
int spawnInterval = 5000;
int trashCount = 0;
int activeTrash = 0;

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
  activeTrash++;
  //                                       ^-- so that it starts just above the screen
}

void keyPressed() {
  if ((key == 'a' || key == 'A') && player.x > 0) {
    moveDirX = -1;
  } else if ((key == 'd' || key == 'D') && player.x < width) {
    moveDirX = 1;
  } else if ((key == 'w' || key == 'W') && player.y > 180) {
    moveDirY = -1;
  } else if ((key == 's' || key == 'S') && player.y < height) {
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

  float playerX = player.getPosX();
  float playerY = player.getPosY();
  if((playerX > 0 && playerX < width) || (playerX <= 0 && moveDirX == 1) || (playerX >= width && moveDirX == -1)) {
    player.move(moveDirX, 0);
  } 
  if((playerY > 150 && playerY < height-50) || (playerY <= 150 && moveDirY == 1) || (playerY >= height-50 && moveDirY == -1)) {
    player.move(0, moveDirY);
  }
  
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

    if (t.active && player.collidesWith(t)) {
      t.active = false;
      trashCount++;
      activeTrash--;
    }

    // Count only trash that is active and still on screen
    if (t.active && t.y < height) {
      // activeTrash++;
    }
  }

  fill(0);
  textSize(25);
  text("trash counter: " + trashCount, 800, 40);

  // Game over condition
  if (activeTrash >= 6) {
    fill(255, 0, 0);
    textSize(50);
    textAlign(CENTER, CENTER);
    text("Game Over", width/2, height/2);
    noLoop(); // stop the game
  }
}

