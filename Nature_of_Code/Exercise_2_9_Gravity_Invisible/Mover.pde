class Mover{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float G;
  color CL;

  Mover(float _x, float _y, float _m){
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
    acceleration.mult(0);
  }
  
  void display(){
    pushStyle();
    //noStroke();
    fill(CL);

    noStroke();
    ellipse(location.x,location.y,mass,mass);
    popStyle();
  }
  
  
  void applyForce(PVector force){
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
  
  PVector attract(Mover m){
    PVector force = PVector.sub(location,m.location);
    float distance = force.mag();
    distance = constrain(distance,5.0,25.0);
    force.normalize();
    
    float strength = (G*mass*m.mass)/(distance*distance);
    force.mult(strength);
    return force;
  }
}


//class Mover {

//  PVector location;
//  PVector velocity;
//  PVector acceleration;
//  float mass;

//  Mover() {
//    location = new PVector(400,50);
//    velocity = new PVector(1,0);
//    acceleration = new PVector(0,0);
//    mass = 1;
//  }
  
//  void applyForce(PVector force) {
//    PVector f = PVector.div(force,mass);
//    acceleration.add(f);
//  }
  
//  void update() {
//    velocity.add(acceleration);
//    location.add(velocity);
//    acceleration.mult(0);
//  }

//  void display() {
//    stroke(0);
//    strokeWeight(2);
//    fill(127);
//    ellipse(location.x,location.y,16,16);
//  }

//  void checkEdges() {

//    if (location.x > width) {
//      location.x = 0;
//    } else if (location.x < 0) {
//      location.x = width;
//    }

//    if (location.y > height) {
//      velocity.y *= -1;
//      location.y = height;
    //}

  //}
//
//}