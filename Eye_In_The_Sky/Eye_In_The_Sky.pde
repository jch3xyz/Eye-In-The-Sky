import processing.sound.*;

Eye eye;
SoundFile vivint;

void setup() {
  size(800, 800, P3D);
  eye = new Eye(width / 2, height / 2, width/8);
  vivint = new SoundFile(this, "Vivint Camera Sound Effect.mp3");
}

void draw() {
  background(0);
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
  eye.tilt = map(mouseX, 0, width, -40, 40);
}
