class Mover{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  Mover(float _x, float _y, float _m){
    location = new PVector(_x,_y);
    velocity = new PVector(1,0);
    acceleration = new PVector(0,0);
    mass = _m;
  }
  
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void display(){
    pushStyle();
    //noStroke();
    //fill(127,2);
    stroke(0,80);
    ellipse(location.x,location.y,mass,mass);
  }
  
  
  void applyForce(PVector force){
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
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