class FileManager {
  private String content;
  private String[] readContent;

  FileManager() {
    this.content = "";
    this.readContent = new String[3];
  }

  public void saveTrack(Track trackToSave) { // writing everything into one file //todo : work with .zip
    trackToSave.getDesign().save(sketchPath("./tracks/temp/design.png"));
    trackToSave.getTrack().save(sketchPath("./tracks/temp/track.png"));

    this.readFile("design.png");
    this.readFile("track.png");

    // todo : add properties to file

    this.createFile(trackToSave.getName());
  }

  public void openTrack(String nameToOpen) { // throw away!!
    BufferedReader reader = createReader(sketchPath("./tracks/"+nameToOpen+".track")); // open a file

    String line = null;
    int index = 0;
    try {
      while ((line = reader.readLine()) != null) {
        if(line.equals("--------------------")) {
          index++;
        }
        else {
          this.readContent[index] += line +"\n";
        }
      }
    }
    catch (IOException e) {
      e.printStackTrace();
    }
    this.savePicture("design", this.readContent[0]);
    this.savePicture("track", this.readContent[0]);
  }

  private void readFile(String fileName) { // read the png files + write the ---- spacer
    BufferedReader reader = createReader(sketchPath("./tracks/temp/"+fileName)); // open a file

    String line = null;
    try {
      while ((line = reader.readLine()) != null) {
        this.content += line +"\n";
      }
    }
    catch (IOException e) {
      e.printStackTrace();
    }

    content += "--------------------\n";
  }

  private void createFile(String name) { // writing text into a .track file
    PrintWriter toSave;
    toSave = createWriter(sketchPath("./tracks/"+name+".track"));
    toSave.println(content);
    toSave.flush(); // writes the remaining data to the file
    toSave.close(); // finishes the file
  }

  private void savePicture(String name, String writeIn) { // create a png out of only text // todo : throw away because it does not work this way
    PrintWriter toSave;
    toSave = createWriter(sketchPath("./tracks/temp/"+name+".png"));
    toSave.println(writeIn);
    toSave.flush(); // writes the remaining data to the file
    toSave.close(); // finishes the file
  }

  public Track loadDataForTrack() { // create a Track object out of the content of a file
    Track track = new Track();
    return track;
  }
}
