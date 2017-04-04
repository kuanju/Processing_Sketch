class Particle{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  
  float mass =1;

  Particle(PVector l){
    acceleration = new PVector(0,0);
    velocity = new PVector(random(-1,1),random(-2,0));
    location = l.get();
    lifespan = 255;

  }
  
  void run(){
    update();
    display();
  }
  
  void applyForce(PVector force){
    PVector f = force.get();
    f.div(mass);
    acceleration.add(f);
  }
  
  
  void update(){
    lifespan -=2.0;

    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void display(){
    fill(0);
    ellipse(location.x,location.y,8,8);
  }
  
    
  boolean isDead(){
    if(lifespan <0.0){
      return true;
    }else{
      return false;
    }
  }

}