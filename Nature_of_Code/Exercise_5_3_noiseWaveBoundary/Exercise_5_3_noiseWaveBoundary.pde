import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

ArrayList <Particle> particles;
Surface surface;

void setup(){
  size(500,500);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0,-10);
  
  particles = new ArrayList<Particle>();
  surface = new Surface();
  

}

void draw(){
  if (mousePressed) {
    float sz = random(4,8);
    particles.add(new Particle(mouseX,mouseY,sz));
  }

  box2d.step();
  
  background(255);
  
  surface.display();
  for(Particle p: particles){
    p.display();
  }
  
  for(int i = particles.size()-1; i>=0; i--){
    Particle p = particles.get(i);
    if(p.done()){
      particles.remove(i);
    }
  }
}