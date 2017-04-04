class Particle{
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  float angle;
  float aVel;
  float aAcc;
  
  Particle(PVector l){
    acceleration = new PVector(0,0.05);
    velocity = new PVector(random(-1,1),random(-2,0));
    // have to use l.get so that it doesn't overwrite the original location
    // when the next l is created.
    position = l.get();
    lifespan = 255;
    
    angle = 0;
    aVel = 0;
    aAcc = random(-5,5);
  }
  
  void applyForce(PVector f){
    acceleration.add(f);
  }
  

  void run(){
    update();
    display();
  }
  
  void update(){
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
    lifespan -=2.0;
    aVel+=aAcc;
    angle+=aVel;
    aAcc = 0;
  }
  
  void display(){
    noStroke();
    fill(0,lifespan);
    pushMatrix();
    translate(position.x,position.y);
    rotate(radians(angle));
    rect(0,0,8,8);
    popMatrix();
  }
  

  
  boolean isDead(){
    if(lifespan <0.0){
      return true;
    }else{
      return false;
    }
  }

}


//=========================================//


//class Particle {
//  PVector position;
//  PVector velocity;
//  PVector acceleration;
//  float lifespan;

//  Particle(PVector l) {
//    acceleration = new PVector(0,0.05);
//    velocity = new PVector(random(-1,1),random(-2,0));
//    position = l.get();
//    lifespan = 255.0;
//  }

//  void run() {
//    update();
//    display();
//  }

//  // Method to update position
//  void update() {
//    velocity.add(acceleration);
//    position.add(velocity);
//    lifespan -= 2.0;
//  }

//  // Method to display
//  void display() {
//    stroke(0,lifespan);
//    strokeWeight(2);
//    fill(127,lifespan);
//    ellipse(position.x,position.y,12,12);
//  }
  
//  // Is the particle still useful?
//  boolean isDead() {
//    if (lifespan < 0.0) {
//      return true;
//    } else {
//      return false;
//    }
//  }
//}