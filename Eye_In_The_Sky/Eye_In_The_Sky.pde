
int x = 200;
boolean closing = true;

void setup(){
  size(640, 360);
  frameRate(20);
}

void draw(){
  background(0);
  ellipse(width/2, height/2, 300, x);
  if (x > 0 && closing){
    x -= 10;
  }
  if (x <= 0) {
    closing = false;
  }
  
  if (x < 210 && !closing){
    x += 10;
  }
  
  if (x >= 210){
    closing = true;
  }
}
