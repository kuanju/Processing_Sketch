import java.util.Iterator;
ParticleSystem ps;
  Repeller[] rs = new Repeller[10];

void setup(){
  size(500,500);
  ps=new ParticleSystem(new PVector(width/2,50));
  for(int i = 0; i < rs.length; i++){
    rs[i] = new Repeller(random(width), random(height));
  }
}

void draw(){
  background(255);
  ps.addParticle();

  PVector gravity = new PVector(0,0.1);
  ps.applyForce(gravity);
  
  for(int i = 0; i < rs.length; i++){
    ps.applyRepeller(rs[i]);
  }
  
  ps.run();

  for(int i = 0; i < rs.length; i++){
    rs[i].display();
  }
}