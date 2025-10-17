// Defining variables and class initialisations
BG backgroundScene;
ArrayList<Trash> trashList;
PImage[] trashSprites = new PImage[3];

int lastSpawnTime = 0;
int spawnInterval = 5000;

void setup() {
  size(1000, 800);
  backgroundScene = new BG();

  trashList = new ArrayList<Trash>();

  // Load assets
  trashSprites[0] = loadImage("trash1.png");
  trashSprites[0].resize(60, 60);
  trashSprites[1] = loadImage("trash2.png");
  trashSprites[1].resize(60, 60);
  trashSprites[2] = loadImage("trash3.png");
  trashSprites[2].resize(60, 60);
}

void spawnTrash() {
  int index = int(random(trashSprites.length)); // select random trash object from list
  PImage selectedImg = trashSprites[index]; // get that object
  trashList.add(new Trash(random(width), -20, selectedImg));
  //                                       ^-- so that it starts just above the screen
}

void draw() {
  backgroundScene.display();

  if (millis() - lastSpawnTime > spawnInterval) {
    spawnTrash();
    lastSpawnTime = millis();
  }

  // Update and display all trash
  for (Trash t : trashList) {
    t.update();
    t.display();
  }
}