import processing.core.*;
import processing.data.*;
import processing.event.*;
import processing.opengl.*;

/*
import java.text.SimpleDateFormat;
import java.util.Date;

import java.util.HashMap;
import java.util.ArrayList;
import java.io.File;
import java.io.BufferedReader;
import java.io.PrintWriter;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.IOException;
*/

public class main extends PApplet {

  // main setup function
  public void setup() {
    frameRate(30);

    surface.setTitle("Car Racing Game");
    // surface.setIcon(loadImage("Image.png"));
  }

  // main draw function
  public void draw() {
    background(0);
    rect(0, 0, 500, 500);
  }

  // This function will be executed by the main method to get the settings for the
  // Sketch
  public void settings() {
    size(700, 700);
  }

  // this is the main function, which starts the Sketch
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "main" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
