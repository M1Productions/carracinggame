class MainMenue{
  private Button singlePlayerBt, multiPlayerBt, garageBt, mapEditorBt, settingsBt, aboutBt;

  MainMenue() {
    this.singlePlayerBt   = new Button(width/3, height/13, width/3, height/13, "SINGLEPLAYER", 0);
    this.multiPlayerBt    = new Button(width/3, height*3/13, width/3, height/13, "MULTIPLAYER", 0);
    this.garageBt         = new Button(width/3, height*5/13, width/3, height/13, "GARAGE", 0);
    this.mapEditorBt      = new Button(width/3, height*7/13, width/3, height/13, "MAP EDITOR", 0);
    this.settingsBt       = new Button(width/3, height*9/13, width/3, height/13, "SETTINGS", 0);
    this.aboutBt          = new Button(width/3, height*11/13, width/3, height/13, "ABOUT", 0);
  }

  void draw() {
    this.singlePlayerBt.draw();
    this.multiPlayerBt.draw();
    this.garageBt.draw();
    this.mapEditorBt.draw();
    this.settingsBt.draw();
    this.aboutBt.draw();
  }

  void mousePressed() {
    if(this.singlePlayerBt.mouseOver()) {
      this.singlePlayerBt.select();
    }
    else if(this.multiPlayerBt.mouseOver()) {
      this.multiPlayerBt.select();
    }
    else if(this.garageBt.mouseOver()) {
      this.garageBt.select();
    }
    else if(this.mapEditorBt.mouseOver()) {
      this.mapEditorBt.select();
    }
    else if(this.settingsBt.mouseOver()) {
      this.settingsBt.select();
    }
    else if(this.aboutBt.mouseOver()) {
      this.aboutBt.select();
    }
  }

  void mouseReleased() {
    if(this.singlePlayerBt.mouseOver() && this.singlePlayerBt.isSelected()) {
      this.singlePlayerBt.unselect();
      changeMode(2);
    }
    else if(this.multiPlayerBt.mouseOver() && this.multiPlayerBt.isSelected()) {
      this.multiPlayerBt.unselect();
      changeMode(1);
    }
    else if(this.garageBt.mouseOver() && this.garageBt.isSelected()) {
      this.garageBt.unselect();
      // todo
    }
    else if(this.mapEditorBt.mouseOver() && this.mapEditorBt.isSelected()) {
      this.mapEditorBt.unselect();
      changeMode(4);
    }
    else if(this.settingsBt.mouseOver() && this.settingsBt.isSelected()) {
      this.settingsBt.unselect();
      // todo
    }
    else if(this.aboutBt.mouseOver() && this.aboutBt.isSelected()) {
      this.aboutBt.unselect();
      // todo
    }
    else {
      this.singlePlayerBt.unselect();
      this.multiPlayerBt.unselect();
      this.garageBt.unselect();
      this.mapEditorBt.unselect();
      this.settingsBt.unselect();
      this.aboutBt.unselect();
    }
  }
}
