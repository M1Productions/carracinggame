int mode=0;
MainMenue mainMenue;
MultiPlayerMenue multiPlayerMenue;

// main setup function
public void setup() {
  frameRate(30);
  size(1440, 810);
  surface.setTitle("Car Racing Game");
  // surface.setIcon(loadImage("Image.png"));

  mainMenue         = new MainMenue();
  multiPlayerMenue  = new MultiPlayerMenue();
}

public void changeMode(int newMode) {
  mode = newMode;
}

// main draw function
public void draw() {
  background(100);
  switch(mode) {
   case 0: mainMenue.draw();        break; // main menu
   case 1: multiPlayerMenue.draw(); break; // when u pressed the multiplayer button in main menue
  }
}

public void mousePressed() {
  switch(mode) {
   case 0: mainMenue.mousePressed();        break; // main menu
   case 1: multiPlayerMenue.mousePressed(); break; // when u pressed the multiplayer button in main menue
  }
}

public void mouseReleased() {
  switch(mode) {
   case 0: mainMenue.mouseReleased();        break; // main menu
   case 1: multiPlayerMenue.mouseReleased(); break; // when u pressed the multiplayer button in main menue
  }
}
