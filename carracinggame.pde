int mode=0, changeCursor; // changeCursor = to change the style of the cursor
MainMenue mainMenue;
MultiPlayerMenue multiPlayerMenue;
SinglePlayerMenue singlePlayerMenue;
MapEditor mapEditor;
SaveMapScreen saveMapScreen;

// main setup function
public void setup() {
  frameRate(30);
  size(1440, 810);
  surface.setTitle("Car Racing Game");
  // surface.setIcon(loadImage("Image.png"));

  mainMenue         = new MainMenue();
  multiPlayerMenue  = new MultiPlayerMenue();
  singlePlayerMenue = new SinglePlayerMenue();
  mapEditor         = new MapEditor();
  saveMapScreen     = new SaveMapScreen();
}

public void changeMode(int newMode) {
  mode = newMode;
}

// main draw function
public void draw() {
  background(100);
  changeCursor = 0;

  switch(mode) {
    case 0:  mainMenue.draw();         break; // main menu
    case 1:  multiPlayerMenue.draw();  break; // when u pressed the multiplayer button in main menue
    case 2:  singlePlayerMenue.draw(); break; // when u pressed the singleplayer button in main menue
    case 4:  mapEditor.draw();         break; // map editor
    case 41: saveMapScreen.draw();     break; // save an self created map
  }

  cursor(changeCursor);
}

public void mousePressed() {
  switch(mode) {
    case 0:  mainMenue.mousePressed();         break; // main menu
    case 1:  multiPlayerMenue.mousePressed();  break; // when u pressed the multiplayer button in main menue
    case 2:  singlePlayerMenue.mousePressed(); break; // when u pressed the singleplayer button in main menue
    case 4:  mapEditor.mousePressed();         break; // map editor
    case 41: saveMapScreen.mousePressed();     break; // save an self created map
  }
}

public void mouseReleased() {
  switch(mode) {
    case 0:  mainMenue.mouseReleased();         break; // main menu
    case 1:  multiPlayerMenue.mouseReleased();  break; // when u pressed the multiplayer button in main menue
    case 2:  singlePlayerMenue.mouseReleased(); break; // when u pressed the singleplayer button in main menue
    case 4:  mapEditor.mouseReleased();         break; // map editor
    case 41: saveMapScreen.mouseReleased();     break; // save an self created map
  }
}

public void mouseDragged() {
  switch(mode) {
    case 4: mapEditor.mouseDragged(); break; // map editor
  }
}
