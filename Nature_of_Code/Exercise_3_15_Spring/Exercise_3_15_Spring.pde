Attractor attractor;
Bug[] bugs = new Bug[100];

void setup(){
  noCursor();
  size(600,600);
  attractor = new Attractor();
  for(int i = 0 ; i < bugs.length; i++){
    bugs[i] = new Bug(width/2+random(-20,20),height/2+random(-20,20));
  }
}

void draw(){
  background(255);
  attractor.update();
  attractor.display();
  
  for(int i = 0 ; i < bugs.length; i++){
    PVector attracting = attractor.attract(bugs[i]);  
    bugs[i].applyForce(attracting);
    bugs[i].update();
    bugs[i].display();
    
  }
  
}