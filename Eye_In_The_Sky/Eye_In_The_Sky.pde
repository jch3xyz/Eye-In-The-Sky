import processing.sound.*;

Eye eye;
SoundFile vivint;
float z;

void setup() {
  size(500, 500, P3D);
  eye = new Eye(width / 2, height / 2, width/8);
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
  eye.tilt = map(mouseX, 0, width, -40, 40);
}
