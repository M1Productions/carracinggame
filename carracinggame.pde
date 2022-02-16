public int mode, changeCursor, error; // changeCursor = to change the style of the cursor // error = fade time for error message
public String errorText;
public MainMenue mainMenue;
public MultiPlayerMenue multiPlayerMenue;
public SinglePlayerMenue singlePlayerMenue;
public MapEditor mapEditor;
public SaveMapScreen saveMapScreen;
public FileManager fileManager;
public Game game;
public PVector xAxis;

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
  fileManager       = new FileManager();

  xAxis = new PVector(1, 0);

  mode = 0;
  error = 0;
  errorText = "";
}

public void changeMode(int newMode) {
  switch(newMode) {
    case 1:  singlePlayerMenue.update();       break; // reloading the content of the maps/data folder
    case 11: game = new Game();                break; // creating a new game
    case 4:  if(mode!=41){mapEditor.update();} break; // refreshing the canvas and the name of the new map
  }
  mode = newMode;
}

// main draw function
public void draw() {
  background(100);
  changeCursor = 0;

  switch(mode) {
    case 0:  mainMenue.draw();         break; // main menu
    case 2:  multiPlayerMenue.draw();  break; // when u pressed the multiplayer button in main menue
    case 1:  singlePlayerMenue.draw(); break; // when u pressed the singleplayer button in main menue
    case 11: game.draw();              break; // playing the game
    case 4:  mapEditor.draw();         break; // map editor
    case 41: saveMapScreen.draw();     break; // save a self created map
  }

  cursor(changeCursor);
  if(error > 0) {
    textSize(height/10);
    textAlign(CENTER, CENTER);
    fill(255,0,0,error);
    text(errorText, width/2, height/2);
    error--;
  }
}

public void mousePressed() {
  switch(mode) {
    case 0:  mainMenue.mousePressed();         break; // main menu
    case 2:  multiPlayerMenue.mousePressed();  break; // when u pressed the multiplayer button in main menue
    case 1:  singlePlayerMenue.mousePressed(); break; // when u pressed the singleplayer button in main menue
    case 11: game.mousePressed();              break; // playing the game
    case 4:  mapEditor.mousePressed();         break; // map editor
    case 41: saveMapScreen.mousePressed();     break; // save a self created map
  }
}

public void mouseReleased() {
  switch(mode) {
    case 0:  mainMenue.mouseReleased();         break; // main menu
    case 2:  multiPlayerMenue.mouseReleased();  break; // when u pressed the multiplayer button in main menue
    case 1:  singlePlayerMenue.mouseReleased(); break; // when u pressed the singleplayer button in main menue
    case 11: game.mouseReleased();              break;  // playing the game
    case 4:  mapEditor.mouseReleased();         break; // map editor
    case 41: saveMapScreen.mouseReleased();     break; // save a self created map
  }
}

public void mouseDragged() {
  switch(mode) {
    case 4: mapEditor.mouseDragged(); break; // map editor
  }
}

public void keyPressed() {
  switch(mode) {
    case 11: game.keyPressed();          break; // driving
    case 41: saveMapScreen.keyPressed(); break; // save a self created map
  }
}

public void keyReleased() {
  switch(mode) {
    case 11: game.keyReleased();
  }
}

public void createError(String text) {
  println(text);
  error = 400;
  errorText = text;
}
