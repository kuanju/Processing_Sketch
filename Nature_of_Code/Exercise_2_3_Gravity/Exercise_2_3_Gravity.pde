Mover[] movers = new Mover[5];

void setup(){
  size(500,500);
  for(int i = 0; i <movers.length; i++){
    movers[i] = new Mover(random(5,50),0,300);
  }
}
void draw(){
  background(255);
  for(int i = 0; i < movers.length; i++){
    PVector wind = new PVector(0.001,0);
    PVector gravity = new PVector(0,0.1*movers[i].mass);

    float c = 0.01;
    PVector friction = movers[i].velocity.get();
    friction.mult(-1);
    friction.normalize();
    friction.mult(c);

    movers[i].applyForce(friction);
    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);
    
    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }
}