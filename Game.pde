class Game {
  ArrayList <Car> cars;
  Car player;
  Boolean wPressed, aPressed, sPressed, dPressed;
  Track track;

  Game() {
    this.cars = new ArrayList <Car>();

    this.player = new Car(width/2, height/2, width/20, height/20, #FF0000);
    this.cars.add(this.player);

    this.wPressed = false;
    this.aPressed = false;
    this.sPressed = false;
    this.dPressed = false;

    this.track = fileManager.loadDataForTrack();
  }

  public void draw() {
    this.track.draw();

    for(Car c : this.cars) {
      c.draw();
    }

    this.checkKeys();
  }

  private void checkKeys() {
    if(this.wPressed) {
      this.player.drive(1);
    }
    if(this.aPressed) {
      this.player.rotateMe(-0.2);
    }
    if(this.dPressed) {
      this.player.rotateMe(0.2);
    }
    if(this.sPressed) {
      this.player.drive(-1);
    }
  }

  public void mousePressed() {
  }

  public void mouseReleased() {
  }

  public void keyPressed() {
    if(key == 'w' || key == 'W') {
      this.wPressed = true;
    }
    else if(key == 'a' || key == 'A') {
      this.aPressed = true;
    }
    else if(key == 'd' || key == 'D') {
      this.dPressed = true;
    }
    else if(key == 's' || key == 'S') {
      this.sPressed = true;
    }
  }

  public void keyReleased() {
    if(key == 'w' || key == 'W') {
      this.wPressed = false;
    }
    else if(key == 'a' || key == 'A') {
      this.aPressed = false;
    }
    else if(key == 'd' || key == 'D') {
      this.dPressed = false;
    }
    else if(key == 's' || key == 'S') {
      this.sPressed = false;
    }
  }
}
