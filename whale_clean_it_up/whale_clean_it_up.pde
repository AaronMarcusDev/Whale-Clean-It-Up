BG backgroundScene;
ArrayList<Trash> trashList;
PImage[] trashSprites = new PImage[3];
Decoration dcr;
Whale player;

int lastSpawnTime = 0;
int spawnInterval = 5000;

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
  if (key == 'w') {
    if (player.y - 10 >= 180) { // prevent going above water
      player.y -= 10;
    }
  } else if (key == 's') {
    if (player.y + 10 <= height - 80) {
      player.y += 10;
    }
  } else if (key == 'a') {
    if (player.x - 10 >= 0) {
      player.x -= 10;
      player.setF(-1);
    }
  } else if (key == 'd') {
    if (player.x + 10 <= width) {
      player.x += 10;
      player.setF(1);
    }
  }
}


void draw() {
  backgroundScene.display();
  dcr.starfish(600);
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