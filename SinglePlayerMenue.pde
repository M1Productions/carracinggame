class SinglePlayerMenue {
  private Button playBt, joinGameBt, backBt;

  SinglePlayerMenue() {
    this.playBt = new Button(width*2/3 - width/12, height*11/13, width/6, height/13, "PLAY", 0);
    this.backBt = new Button(width*1/3 - width/12, height*11/13, width/6, height/13, "BACK", 0);
  }

  void draw() {
    this.playBt.draw();
    this.backBt.draw();
  }

  void mousePressed() {
    if (this.playBt.mouseOver()) {
      this.playBt.select();
    }
    else if (this.backBt.mouseOver()) {
      this.backBt.select();
    }
  }

  void mouseReleased() {
    if (this.playBt.mouseOver() && this.playBt.isSelected()) {
      this.playBt.unselect();
      // todo
    }
    else if (this.backBt.mouseOver() && this.backBt.isSelected()) {
      this.backBt.unselect();
      changeMode(0);
    }
    else {
      this.playBt.unselect();
      this.backBt.unselect();
    }
  }
}
