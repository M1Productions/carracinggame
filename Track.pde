class Track {
  private PImage designImg, trackImg;
  private String name;
  private ArrayList <Checkpoint> checkpoints;

  Track(String name, PImage design, PImage track) {
    this.name = name;
    this.designImg = design;
    this.trackImg = track;
  }

  Track(String name, PImage design, PImage track, ArrayList<Checkpoint> newCheckpoints) {
    this.name = name;
    this.designImg = design;
    this.trackImg = track;
    this.checkpoints = newCheckpoints;
  }

  public void draw() {
    background(this.bg);

    if(this.checkpoints.size() > 0) {
      for(Checkpoint c : this.checkpoints) {
        if(c.getIndex() == this.player.getCheckpointIndex()+1) {
          c.draw();
        }
      }
    }

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
