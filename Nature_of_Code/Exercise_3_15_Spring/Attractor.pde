class Attractor{
  PVector location;
  float mass;
  float G;
  
  Attractor(){
    location = new PVector(random(width),random(height));
    mass = 10;
    G = 0.4;
  }
  
  void update(){
    location.set(mouseX,mouseY);
  }
  
  void display(){
    fill(100);
    ellipse(location.x,location.y, mass*4,mass*4);

    fill(150);
    ellipse(location.x,location.y, mass*3,mass*3);

    fill(200);
    ellipse(location.x,location.y, mass*2,mass*2);

}
  
  PVector attract(Bug b){
    PVector force = PVector.sub(location, b.location);
    float distance = force.mag();
    distance = constrain(distance,5.0,500.0);
    force.normalize();
    float strength = G*mass*b.mass/(distance*distance);
    force.mult(strength);
    if(distance<50){
      force.mult(-1);
    }
    
    return force;
  }
  
}