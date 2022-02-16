class MapEditor {
  private Boolean mirrored;
  private Button saveMapBt, backBt, bridgesBt, streetsBt, eraserBt, checkpointBt, finishLineBt, changeButtonsPositionsBt;
  private Canvas newMap;

  MapEditor() {
    this.bridgesBt                = new Button(width/20, height/13, width/20, height/13, "BRIDGE", 0);
    this.streetsBt                = new Button(width/20, height*3/13, width/20, height/13, "STREET", 0);
    this.eraserBt                 = new Button(width/20, height*5/13, width/20, height/13, "ERASE", 0);
    this.checkpointBt             = new Button(width/20, height*7/13, width/20, height/13, "CHECKPOINT", 0);
    this.finishLineBt             = new Button(width/20, height*9/13, width/20, height/13, "FINISH LINE", 0);
    this.backBt                   = new Button(width*8/24, height*11/13, width/12, height/13, "BACK", 0);
    this.saveMapBt                = new Button(width*11/24, height*11/13, width/12, height/13, "SAVE", 0);
    this.changeButtonsPositionsBt = new Button(width*14/24, height*11/13, width/12, height/13, "->", 0);

    this.streetsBt.select();

    this.newMap                   = new Canvas(0, 0, width, height);

    this.mirrored = false;
  }

  public void update() {
    this.newMap = new Canvas(0, 0, width, height);
    saveMapScreen.update();
  }

  public void draw() {
    this.newMap.draw();

    if(!this.newMap.isSave()) {
      this.bridgesBt.draw();
      this.streetsBt.draw();
      this.eraserBt.draw();
      this.checkpointBt.draw();
      this.finishLineBt.draw();
      this.saveMapBt.draw();
      this.backBt.draw();
      this.changeButtonsPositionsBt.draw();
    }
  }

  public void mousePressed() {
    if (this.saveMapBt.mouseOver()) {
      this.saveMapBt.select();
    }
    else if (this.backBt.mouseOver()) {
      this.backBt.select();
    }
    else if (this.bridgesBt.mouseOver()) {
      this.bridgesBt.select();
    }
    else if (this.streetsBt.mouseOver()) {
      this.streetsBt.select();
    }
    else if (this.eraserBt.mouseOver()) {
      this.eraserBt.select();
    }
    else if (this.checkpointBt.mouseOver()) {
      this.checkpointBt.select();
    }
    else if (this.finishLineBt.mouseOver()) {
      this.finishLineBt.select();
    }
    else if (this.changeButtonsPositionsBt.mouseOver()) {
      this.changeButtonsPositionsBt.select();
    }
    else {
      this.clickMap(); // decide which tool to use
    }
  }

  private void clickMap() {
    if(this.streetsBt.isSelected()) {
      this.newMap.painting();
      this.newMap.paint();
    }
    else if(this.checkpointBt.isSelected()) {
      this.newMap.addCheckpoint();
    }
  }

  public void mouseReleased() {
    if (this.saveMapBt.mouseOver() && this.saveMapBt.isSelected()) {
      this.saveMapBt.unselect();
      changeMode(41);
    }
    else if (this.backBt.mouseOver() && this.backBt.isSelected()) {
      this.backBt.unselect();
      mapEditor.newMap.save("autosave");
      changeMode(0);
    }
    else if (this.bridgesBt.mouseOver() && this.bridgesBt.isSelected()) {
      this.unselectTools();
      this.bridgesBt.select();
    }
    else if (this.streetsBt.mouseOver() && this.streetsBt.isSelected()) {
      this.unselectTools();
      this.streetsBt.select();
    }
    else if (this.eraserBt.mouseOver() && this.eraserBt.isSelected()) {
      this.unselectTools();
      this.eraserBt.select();
    }
    else if (this.checkpointBt.mouseOver() && this.checkpointBt.isSelected()) {
      this.unselectTools();
      this.checkpointBt.select();
    }
    else if (this.finishLineBt.mouseOver() && this.finishLineBt.isSelected()) {
      this.unselectTools();
      this.finishLineBt.select();
    }
    else if (this.changeButtonsPositionsBt.mouseOver() && this.changeButtonsPositionsBt.isSelected()) {
      this.rearrangeButtons();
    }
    else {
      this.saveMapBt.unselect();
      this.backBt.unselect();
    }
    this.newMap.stopPainting();
  }

  private void unselectTools() {
    this.bridgesBt.unselect();
    this.streetsBt.unselect();
    this.eraserBt.unselect();
    this.checkpointBt.unselect();
    this.finishLineBt.unselect();
  }

  public void mouseDragged() {
    if(this.newMap.isPainting()) {
      this.newMap.paint();
    }
  }

  public void rearrangeButtons() {
    if(this.mirrored) {
      this.bridgesBt                = new Button(width/20, height/13, width/20, height/13, "BRIDGE", 0);
      this.streetsBt                = new Button(width/20, height*3/13, width/20, height/13, "STREET", 0);
      this.eraserBt                 = new Button(width/20, height*5/13, width/20, height/13, "ERASE", 0);
      this.checkpointBt             = new Button(width/20, height*7/13, width/20, height/13, "CHECKPOINT", 0);
      this.finishLineBt             = new Button(width/20, height*9/13, width/20, height/13, "FINISH LINE", 0);
      this.backBt                   = new Button(width*8/24, height*11/13, width/12, height/13, "BACK", 0);
      this.saveMapBt                = new Button(width*11/24, height*11/13, width/12, height/13, "SAVE", 0);
      this.changeButtonsPositionsBt = new Button(width*14/24, height*11/13, width/12, height/13, "->", 0);
    }
    else {
      this.bridgesBt                = new Button(width*18/20, height/13, width/20, height/13, "BRIDGE", 0);
      this.streetsBt                = new Button(width*18/20, height*3/13, width/20, height/13, "STREET", 0);
      this.eraserBt                 = new Button(width*18/20, height*5/13, width/20, height/13, "ERASE", 0);
      this.checkpointBt             = new Button(width*18/20, height*7/13, width/20, height/13, "CHECKPOINT", 0);
      this.finishLineBt             = new Button(width*18/20, height*9/13, width/20, height/13, "FINISH LINE", 0);
      this.backBt                   = new Button(width*8/24, height/13, width/12, height/13, "BACK", 0);
      this.saveMapBt                = new Button(width*11/24, height/13, width/12, height/13, "SAVE", 0);
      this.changeButtonsPositionsBt = new Button(width*14/24, height/13, width/12, height/13, "<-", 0);
    }

    this.mirrored = !this.mirrored;
  }
}
