class Track {
  private PImage designImg, trackImg;
  private String name;

  Track(String name, PImage design, PImage track) {
    this.name = name;
    this.designImg = design;
    this.trackImg = track;
  }

  public String getName() {
    return this.name;
  }

  public PImage getDesign() {
    return this.designImg;
  }

  public PImage getTrack() {
    return this.trackImg;
  }

  public void setDesign(PImage newDesign) {
    this.designImg = newDesign;
  }

  public void setTrack(PImage newTrack) {
    this.trackImg = newTrack;
  }
}
