import java.util.Iterator;
ParticleSystem ps;
PImage img;

void setup(){
  size(640, 360, P2D);

  img = loadImage("texture.png");
  ps=new ParticleSystem(new PVector(width/2,50));
}

void draw(){
  blendMode(EXCLUSION);

  background(0);
  ps.addParticle();

  PVector gravity = new PVector(0,0.1);
  ps.applyForce(gravity);
  
  
  ps.run();

}