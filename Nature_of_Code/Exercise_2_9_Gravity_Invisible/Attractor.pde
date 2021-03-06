class Attractor{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float G;
  
  Attractor(float x, float y){
    location = new PVector(x, y);
    velocity = new PVector(1,0);
    acceleration = new PVector(0,0);
    mass = 20;
    G =0.4;
    
  }
  
  void setSpin(){
      PVector center = new PVector(width/2,height/2);
      PVector force = PVector.sub(center,location);
      float dis = force.mag();
      dis = constrain(dis,10.0,25.0);

      force.normalize();
      float strength = G*mass*1000/(dis*dis);
      force.mult(strength);
      applyForce(force);
  }
  
  void applyForce(PVector force){
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
  
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
 
  void display(){
    pushStyle();
    fill(20);
    ellipse(location.x,location.y,mass,mass);
    popStyle();
  }
  
  PVector attract(Mover m){
    PVector force = PVector.sub(location,m.location);
    float distance = force.mag();
    distance = constrain(distance,5.0,25.0);
    
    force.normalize();
    float dir=1;
    //if(distance<10){
    //  dir = -1;
    //}else{
    //  dir = 0.5;
    //}
    float strength = 5*dir*(G*mass*m.mass)/(distance*distance);
    force.mult(strength);
    return force;
    
  }
}


//class Attractor {
//  float mass;
//  PVector location;
//  float G;
 
//  Attractor() {
//    location = new PVector(width/2,height/2);
//    mass = 20;
//    G = 0.4;
//  }
 
//  PVector attract(Mover m) {
//    PVector force = PVector.sub(location,m.location);
//    float distance = force.mag();
////Remember, we need to constrain the distance so that our circle doesn’t spin out of control.
//    distance = constrain(distance,5.0,25.0);
 
 
//    force.normalize();
//    float strength = (G * mass * m.mass) / (distance * distance);
//    force.mult(strength);
//    return force;
//  }
 
//  void display() {
//    stroke(0);
//    fill(175,200);
//    ellipse(location.x,location.y,mass*2,mass*2);
//  }
//}