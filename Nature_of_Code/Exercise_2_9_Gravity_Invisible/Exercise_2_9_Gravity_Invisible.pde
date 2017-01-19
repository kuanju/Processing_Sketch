Mover[] movers = new Mover[150];
Attractor[] attractors = new Attractor[10];

void setup(){
  size(500,500);
  for(int i = 0; i< movers.length; i++){
    movers[i] = new Mover(random(width),random(height), random(1,5));
  }
  
  for(int j = 0; j<attractors.length; j++){
    attractors[j] = new Attractor(random(width),random(height));
  }
  
}

void draw(){
  //background(255,1);
  pushStyle();
  noStroke();
  rectMode(CENTER);
  
  fill(0,0,0,10);
  rect(width/2,height/2,width,height);
  popStyle();
  for(int i = 0 ; i < movers.length; i++){
    
    for(int j = 0; j<movers.length;j++){
      if(i!=j){
        PVector peerforce = movers[j].attract(movers[i]);
        movers[i].applyForce(peerforce);
      }
    }
    
    for(int k = 0; k<attractors.length; k++){
      PVector force = attractors[k].attract(movers[i]);
      movers[i].applyForce(force);
    }


    movers[i].update();
    movers[i].display();

  }

//  attractor.setSpin();
//  attractor.update();
  //attractor.display();

  //attractor2.setSpin();
  //attractor2.update();
  //attractor2.display();

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