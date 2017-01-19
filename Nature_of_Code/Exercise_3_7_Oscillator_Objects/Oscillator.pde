class Oscillator{
  PVector amplitude;

  PVector angle;
  PVector aVelocity;
  PVector aAcceleration;
  
  Oscillator(){
    //angle = new PVector(0,0);

    angle = new PVector(0,20);
    //aVelocity = new PVector(random(-0.05,0.05),random(-0.05,0.05));
    aVelocity = new PVector(random(-0.05,0.05),0);

    amplitude = new PVector(random(width/2),random(height/2));
    aAcceleration = new PVector(0,0.0001);

  }
  void update(){
    angle.add(aVelocity);
    aVelocity.add(aAcceleration);
    
  }
  void display(){
    float x = sin(angle.x)*amplitude.x;
    float y = sin(angle.y)*amplitude.y;
      pushMatrix();
    translate(width/2,height/2);
    stroke(0);
    fill(175);
//Drawing the Oscillator as a line connecting a circle
    line(0,0,x,y);
    ellipse(x,y,16,16);
    popMatrix();
  }
}