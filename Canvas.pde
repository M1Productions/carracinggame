class Canvas {
  private PImage bg;
  private int x, y, w, h, mapIndex;
  private int[][] map;
  private Boolean painting, save;

  Canvas(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.painting = false;
    this.map = new int[1028][];
    this.mapIndex = 0;
    this.save = false;
  }

  void draw() {
    if(this.bg == null) {
      strokeWeight(0);
      fill(0,255,0);
      rect(this.x, this.y, this.w, this.h);
    }
    else {
      image(this.bg, this.x, this.y);
    }

    if(this.map[0] != null) {
      for(int i=0; i<this.mapIndex-1; i++) {
        strokeWeight(this.map[i][2]);
        line(this.map[i][0], this.map[i][1], this.map[i+1][0], this.map[i+1][1]);
      }
    }

    if(this.save) {
      this.autosave();
    }
  }

  void paint() {
    if(mapIndex<map.length) {
      this.map[this.mapIndex] = new int[3];
      this.map[this.mapIndex][0] = mouseX;
      this.map[this.mapIndex][1] = mouseY;
      this.map[this.mapIndex][2] = 30;
      this.mapIndex++;
    }
  }

  void autosave() {
    this.bg = get();
    this.map = new int[1028][];
    this.mapIndex = 0;
    this.save = false;
  }

  void painting() {
    this.painting = true;
  }

  void stopPainting() {
    this.painting = false;
    this.save = true;
    // todo : save image
  }

  Boolean isPainting() {
    return this.painting;
  }

  Boolean isSave() {
    return this.save;
  }

  void save() {
    this.bg.save("data/autosave.png");
  }
}
