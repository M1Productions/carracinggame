class SaveMapScreen {
  private Button saveBt, backBt;
  private TextBox fileNameTb;

  SaveMapScreen() {
    this.saveBt = new Button(width*2/3 - width/12, height*11/13, width/6, height/13, "SAVE", 0);
    this.backBt = new Button(width*1/3 - width/12, height*11/13, width/6, height/13, "BACK", 0);

    this.fileNameTb = new TextBox(width/3, height*3/13, width/3, height/13, "", 0, "NAME YOUR MAP");
  }

  void draw() {
    this.saveBt.draw();
    this.backBt.draw();

    this.fileNameTb.draw();
  }

  void mousePressed() {
    if (this.saveBt.mouseOver()) {
      this.saveBt.select();
    }
    else if (this.backBt.mouseOver()) {
      this.backBt.select();
    }
  }

  void mouseReleased() {
    if (this.saveBt.mouseOver() && this.saveBt.isSelected()) {
      this.saveBt.unselect();
      mapEditor.newMap.save();
    }
    else if (this.backBt.mouseOver() && this.backBt.isSelected()) {
      this.backBt.unselect();
      changeMode(4);
    }
    else {
      this.saveBt.unselect();
      this.backBt.unselect();
    }
  }
}
