class Bug{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float energyLoss;
  Flys[] flys = new Flys[10];
  
  Bug(float x, float y){
    location = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector();
    
    mass = 10;
    energyLoss = 0.99;
    
    for(int i = 0; i < flys.length; i++){
      flys[i] = new Flys(location,20);
    }
    
  }
  
  void applyForce(PVector f){
    PVector force = f;
    //force.div(mass);
    acceleration.add(force);
  }
  
  void update(){
    for(int i = 0; i < flys.length; i++){
      flys[i].update();
    }
    //PVector oF = flys.getForce();
    //applyForce(oF.div(mass/5));
    
    velocity.mult(energyLoss);
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    
    if(location.x<0||location.x>width){
      velocity.x*=-1;
    }
    
     if(location.y<0||location.y>width){
      velocity.y*=-1;
    }
    
    
  }
  
  void display(){
    fill(100);

    ellipse(location.x,location.y,mass,mass);
    for(int i = 0; i < flys.length; i++){
      flys[i].display();
    }  }
  
  
}