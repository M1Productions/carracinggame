class Checkpoint {
  private int x, y, w, h, index;
  private color mainColor;

  Checkpoint(int x, int y, int w, int h, int index) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.index = index;
    this.mainColor = color(#0000FF);
  }

  public void draw() {
    fill(this.mainColor);
    noStroke();
    rect(this.x, this.y, this.w, this.h);
  }

  public int getIndex() {
    return this.index;
  }
}
