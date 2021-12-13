//Jason Ji
//Click the buttons to paly the songs
//Drag left mouse across screen to make additional sounds
ArrayList<Stroke> strokes;
int marktime = 0;
int timeout = 1000;
PImage background;
PFont title, regular;
String header = "Music Player By: Jason Ji";
import processing.sound.*;
SoundFile file;
Button Button1, Button2, Button3, Button4, Button5, Button6;

void setup() {
  size(800, 800, P2D);
  setupXYscope();
  background = loadImage("space.jpg");
  background.resize(width, height);

  title = createFont("Candara", 25);
  regular = createFont("Candara", 13);

  strokes = new ArrayList<Stroke>();

  Button1 = new Button(200, 150, 400, 60, "Higher Ground: Martin Garrix ft. John Martin", 0, 128, 255);
  Button2 = new Button(200, 250, 400, 60, "Lost: Illenium ft. Emilie Brandt", 0, 128, 255);
  Button3 = new Button(200, 350, 400, 60, "Afterlife: Illenium ft. ECHOS", 0, 128, 255);
  Button4 = new Button(200, 450, 400, 60, "High On Life: Illenium ft. Bonn", 0, 128, 255);

  file = new SoundFile(this, "higherground.wav");
  file.play();
}

void draw() {
  background(background);
  textAlign(CENTER);
  fill(153, 204, 255);
  textFont(title);
  text(header, 400, 100);
  textFont(regular);
  updateXYscope();

  for (int i=strokes.size()-1; i >= 0; i--) {
    Stroke stroke = strokes.get(i);
    stroke.run();
    if (!stroke.alive) strokes.remove(i);
  }

  if (millis() > marktime + timeout) {
    xy.clearWaves();
  }

  if (Button1.isClicked()) {
    if (file.isPlaying()) {
      file.pause();
    }
    file = new SoundFile(this, "higherground.wav");
    file.play();
  }
  if (Button2.isClicked()) {
    if (file.isPlaying()) {
      file.pause();
    }
    file = new SoundFile(this, "lost.wav");
    file.play();
  }
  if (Button3.isClicked()) {
    if (file.isPlaying()) {
      file.pause();
    }
    file = new SoundFile(this, "afterlife.wav");
    file.play();
  }
  if (Button4.isClicked()) {
    if (file.isPlaying()) {
      file.pause();
    }
    file = new SoundFile(this, "highonlife.wav");
    file.play();
  }

  Button1.update();
  Button1.render();
  Button2.update();
  Button2.render();
  Button3.update();
  Button3.render();
  Button4.update();
  Button4.render();

  surface.setTitle("" + frameRate);
}
