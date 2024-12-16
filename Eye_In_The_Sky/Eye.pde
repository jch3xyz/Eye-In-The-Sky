class Eye {
  float x, y, radius, tilt;
  boolean isBlinking;
  int blinkFrame;

  Eye(float x, float y, float radius) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.isBlinking = false;
    this.blinkFrame = 0;
    this.tilt = 0;
  }

  void display() {
    pushMatrix();
    translate(x, y); // Move to the eye's center
    rotateY(radians(tilt));
    
    // Modulate eye height during blinking
    float eyeHeight = radius;
    if (isBlinking) {
      float blinkProgress = map(blinkFrame, 0, 20, 1, 0); // Blink progress (1 to 0 and back to 1)
      if (blinkFrame > 10) { // Reverse direction after halfway point
        blinkProgress = map(blinkFrame, 10, 20, 0, 1);
      }
      eyeHeight = radius * blinkProgress; // Scale eye height
    }

    // Draw the sclera (white part of the eye)
    fill(255);
    stroke(0);
    strokeWeight(2);
    ellipse(0, 0, radius * 2, eyeHeight);

    // Draw the iris
    fill(50, 100, 200); // Blueish iris color
    //noFill();
    ellipse(0, 0, radius * .65, eyeHeight * 0.65); // Scale iris height proportionally

    // Draw the pupil
    fill(0);
    noStroke();
    ellipse(0, 0, radius * 0.25, eyeHeight * 0.25); // Scale pupil height proportionally
   
    popMatrix(); // Restore the original coordinate system
  }

  void blink() {
    if (!isBlinking) {
      isBlinking = true;
      blinkFrame = 0;
    }
  }

  void update() {
    if (isBlinking) {
      blinkFrame++;
      if (blinkFrame > 20) {
        isBlinking = false;
        blinkFrame = 0;
      }
    }
  }
}
