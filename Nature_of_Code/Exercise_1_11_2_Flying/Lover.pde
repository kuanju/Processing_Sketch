class Lover{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float radius;
  float boundry;
  
  float perlinInc = 0.0;
  Lover(){
    location = new PVector(width/2,height/2,random(10));
    velocity = new PVector(0,0,0);
    radius = 3 ;
    boundry = 190;
  }
  
  void update(){
    //acceleration = new PVector(noise(perlinInc), noise(perlinInc),noise(perlinInc));
    //perlinInc+=0.01;

    //acceleration = PVector.random3D();
    //acceleration.mult(random(2));

    // Compute a vector that points from position to mouse
    PVector mouse = new PVector(mouseX,mouseY,0);
    
    //method1
    //PVector acceleration = PVector.sub(mouse,location);
    // Set magnitude of acceleration
    //acceleration.setMag(0.2);
 
    //method2
    PVector dir = PVector.sub(mouse,location);
    dir.normalize();
    PVector zForce = new PVector(0,0,random(1));
    dir.add(zForce);
    dir.mult(0.5);
    acceleration = dir;


    velocity.add(acceleration);
    velocity.limit(10);
    location.add(velocity);

  }
  
  void show(){
    pushMatrix();
    pushStyle();
    lights();
    noStroke();
    fill(100);
    translate(location.x,location.y,location.z);
    //sphere(radius);
    popStyle();
    popMatrix();
  }
}