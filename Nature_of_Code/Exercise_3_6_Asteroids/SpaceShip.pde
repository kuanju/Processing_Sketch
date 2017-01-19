class SpaceShip{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float angle;
  float aVelocity;
  float aAcceleration;
  SpaceShip(float x, float y){
    location = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector();
    angle = 0;
    aVelocity = 0;
    aAcceleration = 0;
  }
  
  void update(){
    location.add(velocity);
    velocity.add(acceleration);
    angle+=aVelocity;
    aVelocity+=aAcceleration;
    
    if(location.x< 0){
      location.x = width;
    }else if(location.x>width){
      location.x = 0;
    }
  }

  void display(){
    pushStyle();
    fill(150);
    translate(location.x,location.y);
    rotate(radians(angle));
    triangle(0, -15, -15, 15, 15, 15);
    pushMatrix();
    rectMode(CENTER);
    rect(-8,17,5,4);
    rect(8,17,5,4);
    popMatrix();
    popStyle();
  }
  
}