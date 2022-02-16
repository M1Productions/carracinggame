class Canvas {
  private PImage bg;
  private int x, y, w, h, mapIndex;
  private int[][] map;
  private Boolean painting, save;
  private Track creatingTrack;
  private ArrayList <Checkpoint> checkpoints;

  Canvas(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.painting = false;
    this.map = new int[1028][];
    this.mapIndex = 0;
    this.save = false;
    this.checkpoints = new ArrayList <Checkpoint>();
  }

  public void draw() {
    if(this.bg == null) { // draw background
      strokeWeight(0);
      fill(0,255,0);
      rect(this.x, this.y, this.w, this.h);
    }
    else {
      image(this.bg, this.x, this.y);
    }

    if(this.map[0] != null) { // draw new streets
      for(int i=0; i<this.mapIndex-1; i++) {
        strokeWeight(this.map[i][2]);
        line(this.map[i][0], this.map[i][1], this.map[i+1][0], this.map[i+1][1]);
      }
    }

    // always last
    if(this.save) { // autosave streets when tool is lifted
      this.autosave();
    }
    else {
      if(this.checkpoints.size() != 0) { // draw checkpoints
        for(Checkpoint c : this.checkpoints) {
          c.draw();
        }
      }
    }
  }

  public void paint() {
    if(mapIndex<map.length) {
      this.map[this.mapIndex] = new int[3];
      this.map[this.mapIndex][0] = mouseX;
      this.map[this.mapIndex][1] = mouseY;
      this.map[this.mapIndex][2] = 30;
      this.mapIndex++;
    }
  }

  public void autosave() {
    this.bg = get();
    this.map = new int[1028][];
    this.mapIndex = 0;
    this.save = false;

    if(this.creatingTrack == null) {
      this.creatingTrack = new Track("autosave", this.bg, this.bg);
    }
    else {
      this.creatingTrack.setTrack(this.bg);
      this.creatingTrack.setDesign(this.bg);
    }
  }

  public void painting() {
    this.painting = true;
  }

  public void stopPainting() {
    this.painting = false;
    this.save = true;
  }

  public Boolean isPainting() {
    return this.painting;
  }

  public Boolean isSave() {
    return this.save;
  }

  public void save(String name) {
    this.bg.save("data/"+name+".png");
    fileManager.saveTrack(new Track(name, this.bg, this.bg));
  }

  public void addCheckpoint() {
    this.checkpoints.add(new Checkpoint(mouseX, mouseY, width/20, height/50, 0));
  }
}
