class Baton{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float angle =0;
  float aVelocity=0;
  float aAcceleration=0.01;
  
  
  float mass;
  float G;
  color CL;

  Baton(float _x, float _y, float _m){
    location = new PVector(_x,_y);
    velocity = new PVector(1,0);
    acceleration = new PVector(0,0);    
    
    mass = _m;
    G =0.4;
    colorMode(HSB,100);
    CL = color(random(45,55),100,100,50);

  }
  
  void update(){

    velocity.add(acceleration);
    location.add(velocity);

        
    //aAcceleration = acceleration.x/10.0;
    //aVelocity+=aAcceleration;
    //aVelocity = constrain(aVelocity,-0.1,0.1);
    angle=velocity.heading();

    
    acceleration.mult(0);
  }
  
  void display(){
    pushStyle();
    //noStroke();
    fill(CL);
    noStroke();
    
    pushMatrix();
    translate(location.x,location.y);
    rectMode(CENTER);
    rotate(angle);
    ////ellipse(location.x-5,location.y,mass,mass);
    rect(0,0,20,4);
    ////ellipse(location.x+5,location.y,mass,mass);
    popMatrix();
    popStyle();
  }
  
  
  void applyForce(PVector force){
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
  
  PVector attract(Baton m){
    PVector force = PVector.sub(location,m.location);
    float distance = force.mag();
    distance = constrain(distance,5.0,25.0);
    force.normalize();
    
    float strength = (G*mass*m.mass)/(distance*distance);
    force.mult(strength);
    return force;
  }
}