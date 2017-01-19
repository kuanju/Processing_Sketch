class Mover{
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float mass;
  Mover(float m, float x, float y){
    mass = m;
    location = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }
  
  
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  void display(){
    pushStyle();
    noStroke();
    fill(16,100);
    //ellipse(location.x,location.y,mass,mass);
    rect(location.x,location.y,mass,mass);
    popStyle();
  }
  void checkEdges(){
    if(location.x>width){
      location.x = width;
      velocity.x*=-1;
    }else if(location.x<0){
      location.x = 0;
      velocity.x*=-1;
    }
    
    if(location.y>height){
      velocity.y*=-1;
      location.y= height;
    }


    
  } 
  void applyForce(PVector force){
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
  
  boolean isInside(Air l){
    //if(location.x>l.x && location.x<l.x+l.w && location.y>l.y&&location.y<l.y+l.h){
    if(location.x>l.x && location.x<l.x+l.w ){

      println("inside");

      return true;
    }else{
            println("outside");

      return false;
    }
  }
  
  
  void drag(Air l){
    float speed = velocity.mag();
    float dragMagnitude = l.c*speed*speed*mass;
    
    PVector drag = velocity.get();
    //drag.mult(-1);
    drag.rotate(-1*HALF_PI);
    drag.normalize();
    drag.mult(dragMagnitude);
    
    applyForce(drag);
  }
}