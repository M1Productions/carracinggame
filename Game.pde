class Game {
  ArrayList <Car> cars;
  Car player;

  Game() {
    this.cars = new ArrayList <Car>();

    this.player = new Car(width/2, height/2, width/20, height/20, #FF0000);
    this.cars.add(this.player);
  }

  public void draw() {
    for(Car c : this.cars) {
      c.draw();
    }

    stroke(0);
    strokeWeight(4);
    point(width/2, height/2);
  }

  public void mousePressed() {
  }

  public void mouseReleased() {
  }

  public void keyPressed() {
    if(key == 'w' || key == 'W') {
      this.player.drive(1);
    }
    else if(key == 'a' || key == 'A') {
      this.player.rotateMe(-0.5);
    }
    else if(key == 'd' || key == 'D') {
      this.player.rotateMe(0.5);
    }
    else if(key == 's' || key == 'S') {
      this.player.drive(-1);
    }
  }
}
