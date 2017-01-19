Mover[] movers = new Mover[5];
Liquid liquid;

void setup(){
  size(500,500);
  for(int i = 0; i <movers.length; i++){
    movers[i] = new Mover(random(5,50),random(width), 0);
  }
  liquid = new Liquid(0, height/2, width, height/2, 0.1);
}
void draw(){
  background(255);
  liquid.display();
  
  for(int i = 0; i < movers.length; i++){
    
    
    if(movers[i].isInside(liquid)){
      movers[i].drag(liquid);
    }
    
    
    //PVector wind = new PVector(0.001,0);
    float m = 0.1*movers[i].mass;
    PVector gravity = new PVector(0,m);

    //float c = 0.01;
    //PVector friction = movers[i].velocity.get();
    //friction.mult(-1);
    //friction.normalize();
    //friction.mult(c);

    //movers[i].applyForce(friction);
    //movers[i].applyForce(wind);
    movers[i].applyForce(gravity);
    
    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }
}