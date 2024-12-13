import processing.sound.*;

Eye eye;
SoundFile vivint;

void setup() {
  size(1080, 400);
  eye = new Eye(width / 2, height / 2, width/4);
  vivint = new SoundFile(this, "Vivint Camera Sound Effect.mp3");
}

void draw() {
  background(200);
  eye.display();
  eye.update();
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
