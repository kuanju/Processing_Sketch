Baton[] batons = new Baton[1];
Attractor[] attractors = new Attractor[10];

void setup(){
  size(500,500);
  for(int i = 0; i< batons.length; i++){
    batons[i] = new Baton(random(width),random(height), random(1,5));
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
  for(int i = 0 ; i < batons.length; i++){
    
    for(int j = 0; j<batons.length;j++){
      if(i!=j){
        PVector peerforce = batons[j].attract(batons[i]);
        batons[i].applyForce(peerforce);
      }
    }
    
    for(int k = 0; k<attractors.length; k++){
      PVector force = attractors[k].attract(batons[i]);
      batons[i].applyForce(force);
    }


    batons[i].update();
    batons[i].display();

  }

//  attractor.setSpin();
//  attractor.update();
  //attractor.display();

  //attractor2.setSpin();
  //attractor2.update();
  //attractor2.display();

}