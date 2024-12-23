import processing.sound.*;
import processing.net.*;

Eye eye;
SoundFile vivint;
Client myClient;
float hiptx;

void setup() {
  size(1920, 1080, P3D);
  eye = new Eye(width / 2, height / 2, width/8);
  vivint = new SoundFile(this, "Vivint Camera Sound Effect.mp3");
  myClient = new Client(this, "127.0.0.1", 7000);
}

void draw() {
  
  background(0);
  eye.display();
  eye.update();
  //textSize(128);
  //text(hiptx, 40, 240);
  
}

void keyPressed() {
  if (key == 'b' || key == 'B' || key == ' ') {
    eye.blink();
    
    if(!vivint.isPlaying()){
      vivint.play();
    }
  }
}

/*void mouseDragged() {
  eye.x = mouseX;
  eye.tilt = map(mouseX, 0, width, -40, 40);
}*/

void clientEvent (Client c) {
 String input = c.readString();
 if (input.startsWith("slice")) {
   //input = input + " ";
   String [] parts = input.split(" ");
   //println(parts[1].length());
   if (parts[1].length() < 60) {
   //println(parts[1]);
   float x = Float.parseFloat(parts[1]);
   
   eye.x = map(x, -1, 1, 0, width);
   eye.tilt = map(x, -1, 1, -30, 30);
   }
 }

 //String [] parts = input.split(" ");

 
 
 if(c.available() > 0){
   String data = c.readString(); 
     data = data.trim(); //remove trailing whitespaces
     //print(data);
     //String [] parts = data.split(" "); //split into key/value pair
     //float sliceValue = Float.parseFloat(parts[1]);
       //println("Slice value: " + sliceValue);
     //print(data.split(" "));
  } 
}
