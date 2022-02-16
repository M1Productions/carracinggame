class SinglePlayerMenue {
  private int indexMap;
  private Button playBt, backBt, rightSelectBt, leftSelectBt, currentMapBt;
  private ArrayList <Track> maps;
  private PImage previewImg;

  SinglePlayerMenue() {
    this.playBt        = new Button(width*13/24, height*11/13, width*3/24, height/13, "PLAY", 0);
    this.backBt        = new Button(width*8/24, height*11/13, width*3/24, height/13, "BACK", 0);
    this.leftSelectBt  = new Button(width*3/13, height/13, width/13, height/13, "<", 0);
    this.currentMapBt  = new Button(width*5/13, height/13, width*3/13, height/13, "", 0);
    this.rightSelectBt = new Button(width*9/13, height/13, width/13, height/13, ">", 0);
  }

  public void update() {
    this.indexMap = 0;
    this.maps = new ArrayList <Track>();
    this.listTracks();

    this.nextMap();
  }

  public void nextMap() {
    if(this.indexMap >= this.maps.size()) {
      this.indexMap = 0;
    }
    else if(this.indexMap < 0) {
      this.indexMap = this.maps.size() -1;
    }
    this.previewImg = this.maps.get(this.indexMap).getDesign();
    this.currentMapBt.changeText(this.maps.get(this.indexMap).getName());
  }

  public PImage getPreviewImg() {
    return this.previewImg;
  }

  public void listTracks() {
    File folder = new File(sketchPath("./data"));
    File[] files = folder.listFiles();

    Track t;
    String fileName;
    for(File f : files) {
      fileName = f.toString();
      t = new Track(fileName, loadImage(fileName), loadImage(fileName));
      this.maps.add(t);
    }
  }

  public File[] listFiles() {
    File saveFile = new File(sketchPath("./data"));
    File[] files = saveFile.listFiles();
    return files;
  }

  public void draw() {
    this.playBt.draw();
    this.backBt.draw();
    this.leftSelectBt.draw();
    this.rightSelectBt.draw();
    this.currentMapBt.draw();

    image(this.previewImg, width*3/13, height*3/13, width*7/13, height*7/13);
  }

  public void mousePressed() {
    if (this.playBt.mouseOver()) {
      this.playBt.select();
    }
    else if (this.backBt.mouseOver()) {
      this.backBt.select();
    }
    else if (this.leftSelectBt.mouseOver()) {
      this.leftSelectBt.select();
    }
    else if (this.rightSelectBt.mouseOver()) {
      this.rightSelectBt.select();
    }
  }

  public void mouseReleased() {
    if (this.playBt.mouseOver() && this.playBt.isSelected()) {
      this.playBt.unselect();
      changeMode(11);
    }
    else if (this.backBt.mouseOver() && this.backBt.isSelected()) {
      this.backBt.unselect();
      changeMode(0);
    }
    else if (this.leftSelectBt.mouseOver() && this.leftSelectBt.isSelected()) {
      this.leftSelectBt.unselect();
      this.indexMap--;
      this.nextMap();
    }
    else if (this.rightSelectBt.mouseOver() && this.rightSelectBt.isSelected()) {
      this.rightSelectBt.unselect();
      this.indexMap++;
      this.nextMap();
    }
    else {
      this.playBt.unselect();
      this.backBt.unselect();
      this.leftSelectBt.unselect();
      this.rightSelectBt.unselect();
    }
  }
}
