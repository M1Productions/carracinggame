class Button {
  // bg = background, st = stroke, hv = hover
  private int x, y, w, h, stWeight, rounding;
  private String text;
  private Boolean selected;
  private color bgColor, stColor, hvColor, textColor;

  Button(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.stWeight = 5;
    this.rounding = 10;
    this.bgColor = 255;
    this.stColor = 0;
    this.hvColor = 200;
    this.selected = false;
  }

  Button(int x, int y, int w, int h, String text, color textColor) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.text = text;
    this.textColor = textColor;
    this.stWeight = 5;
    this.rounding = 10;
    this.bgColor = 255;
    this.stColor = 0;
    this.hvColor = 200;
    this.selected = false;
  }

  public void draw() {
    strokeWeight(this.stWeight);
    stroke(this.stColor);
    if(this.selected || this.mouseOver()) {
      changeCursor = 12;
      fill(this.hvColor);
    }
    else {
      fill(this.bgColor);
    }
    rect(this.x, this.y, this.w, this.h, this.rounding);

    if(this.text != null) {
      textSize(this.h/2);
      fill(this.textColor);
      textAlign(CENTER, CENTER);
      text(this.text, this.x+this.w/2, this.y+this.h/2);
    }
  }

  public Boolean mouseOver() { //if the mouse is over this element
    return ((this.x<=mouseX&&this.x+this.w>=mouseX)&&(this.y<=mouseY&&this.y+this.h>=mouseY));
  }

  public void select() {
    this.selected = true;
  }

  public void unselect() {
    this.selected = false;
  }

  public Boolean isSelected() {
    return this.selected;
  }

  public void changeText(String text) {
    this.text = text;
  }
}
