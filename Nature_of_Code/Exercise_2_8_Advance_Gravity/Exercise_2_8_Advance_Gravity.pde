Mover[] movers = new Mover[100];
Attractor attractor;

void setup(){
  size(500,500);
  for(int i = 0; i< movers.length; i++){
    movers[i] = new Mover(random(width),random(height), random(0.1,1));
  }
  
  attractor = new Attractor();
}

void draw(){
  //background(255,1);
  pushStyle();
  noStroke();
  rectMode(CENTER);
  fill(255,5);
  rect(width/2,height/2,width,height);
  popStyle();
  for(int i = 0 ; i < movers.length; i++){
    PVector force = attractor.attract(movers[i]);
    movers[i].applyForce(force);
    
    movers[i].update();
    movers[i].display();

  }
  
  //attractor.display();
}



//Mover m;
//Attractor a;
 
//void setup() {
//  size(640,360);
//  m = new Mover();
//  a = new Attractor();
//}
 
//void draw() {
//  background(255);
 
////Apply the attraction force from the Attractor on the Mover.
//  PVector force = a.attract(m);
//  m.applyForce(force);
//  m.update();
 
//  a.display();
//  m.display();
//}