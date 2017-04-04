ArrayList<ParticleSystem> systems;
//ArrayList<Particle> particles;

import java.util.Iterator;


void setup(){
  size(500,500);
  systems = new ArrayList<ParticleSystem>();
  //particles = new ArrayList<Particle>();

}

void draw(){
  background(255);  
  for(ParticleSystem ps: systems){
    ps.run();
    ps.addParticle();
  }
}


void mousePressed(){
  systems.add(new ParticleSystem(new PVector(mouseX,mouseY)));
}