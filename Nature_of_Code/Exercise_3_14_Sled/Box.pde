class Box{
  
  float angle;
  PVector velocity;
  PVector location;
  PVector acceleration;
  PVector friction;
  float gravity = 0.4;
  float coefficient = 0.1;
  
  
  Box(){
    location = new PVector(0,0);
    velocity = new PVector(0,0);
    friction = new PVector(0,0);
    acceleration = new PVector(0,0);
  }
  void reset(){
    location.set(0,0);
    velocity.set(0,0);
    acceleration.set(0,0);
  }
  
  void update(){
    angle = map(height-mouseY,0,height,0,90);
    acceleration.set(-gravity*sin(radians(angle)),0);
    
    if(velocity.x<0){
      friction.set(gravity*cos(radians(angle))*coefficient,0);
    }else{
      friction.set(0,0);
    }
    acceleration.add(friction);
    velocity.add(acceleration);
    location.add(velocity);
  }
  
  void display(){
    float x = ln*cos(radians(angle));
    float y = height-ln*sin(radians(angle));
    //line(0,height,x,y);
    pushMatrix();
    translate(x,y);
    rotate(-radians(angle));
    
    rect(location.x,location.y,-10,-10);
    popMatrix();
  }
}