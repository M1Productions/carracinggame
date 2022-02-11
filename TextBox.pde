class TextBox {
  // bg = background, st = stroke, hv = hover
  private int x, y, w, h, stWeight, rounding, maxLetters;
  private String text, spaceHolder;
  private Boolean selected, changable;
  private color bgColor, stColor, hvColor, textColor;

  TextBox(int x, int y, int w, int h, String text, color textColor, String spaceHolder, int maxLetters) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.text = text;
    this.textColor = textColor;
    this.spaceHolder = spaceHolder;
    this.maxLetters = maxLetters;
    this.stWeight = 5;
    this.rounding = 10;
    this.bgColor = 255;
    this.stColor = 0;
    this.hvColor = 200;
    this.selected = false;
    this.changable = true;
  }

  TextBox(int x, int y, int w, int h, String text, color textColor, String spaceHolder, Boolean changable, int maxLetters) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.text = text;
    this.textColor = textColor;
    this.spaceHolder = spaceHolder;
    this.maxLetters = maxLetters;
    this.stWeight = 5;
    this.rounding = 10;
    this.bgColor = 255;
    this.stColor = 0;
    this.hvColor = 200;
    this.selected = false;
    this.changable = changable;
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

    textSize(this.h/2);
    fill(this.textColor);
    textAlign(CENTER, CENTER);
    if(this.text == "") {
      text(this.spaceHolder, this.x+this.w/2, this.y+this.h/2);
    }
    else {
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

  public void addLetter(char letter, int keycode) {
    if(keycode == 8) { // delete
      this.removeLetter();
    }
    else if(this.text.length() < this.maxLetters) {
      this.text += letter;
    }
  }

  public void removeLetter()
  {
    if(this.text.length() > 0) {
      this.text = this.text.substring(0, this.text.length() - 1);
    }
  }

  public String getText() {
    return this.text;
  }
}
