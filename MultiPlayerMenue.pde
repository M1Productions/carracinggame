class MultiPlayerMenue {
  private Button hostGameBt, joinGameBt, backBt;

  MultiPlayerMenue() {
    this.hostGameBt = new Button(width/3, height/13, width/3, height/13, "HOST GAME", 0);
    this.joinGameBt = new Button(width/3, height*3/13, width/3, height/13, "JOIN GAME", 0);
    this.backBt     = new Button(width/3, height*11/13, width/3, height/13, "BACK", 0);
  }

  void draw() {
    this.hostGameBt.draw();
    this.joinGameBt.draw();
    this.backBt.draw();
  }

  void mousePressed() {
    if (this.hostGameBt.mouseOver()) {
      this.hostGameBt.select();
    }
    else if (this.joinGameBt.mouseOver()) {
      this.joinGameBt.select();
    }
    else if (this.backBt.mouseOver()) {
      this.backBt.select();
    }
  }

  void mouseReleased() {
    if (this.hostGameBt.mouseOver() && this.hostGameBt.isSelected()) {
      this.hostGameBt.unselect();
      // todo
    }
    else if (this.joinGameBt.mouseOver() && this.joinGameBt.isSelected()) {
      this.joinGameBt.unselect();
      // todo
    }
    else if (this.backBt.mouseOver() && this.backBt.isSelected()) {
      this.backBt.unselect();
      changeMode(0);
    }
    else {
      this.hostGameBt.unselect();
      this.joinGameBt.unselect();
      this.backBt.unselect();
    }
  }
}
