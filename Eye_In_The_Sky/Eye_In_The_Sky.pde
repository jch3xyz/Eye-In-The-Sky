import processing.sound.*;

Eye eye;
SoundFile vivint;

void setup() {
  size(1080, 1920);
  eye = new Eye(width / 2, height / 2, width/4);
  vivint = new SoundFile(this, "Vivint Camera Sound Effect.mp3");
}

void draw() {
  background(0);
  eye.display();
  eye.update();
  
  //saveFrame("/Users/johnholmes/Documents/GitHub/Eye-In-The-Sky/Eye_In_The_Sky/Captures/1/eye-######.png");
}

void keyPressed() {
  if (key == 'b' || key == 'B' || key == ' ') {
    eye.blink();
    
    if(!vivint.isPlaying()){
      vivint.play();
    }
  }
}

void mouseDragged() {
  eye.x = mouseX;
}
