class ParticleSystem{
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(PVector position){
    origin = position;
    particles = new ArrayList<Particle>();
  }
  
  
  
  
  void addParticle(){
    particles.add(new Particle(origin));
  }
  
  void run(){
    //Iterator<Particle> it = particles.iterator();
    //while(it.hasNext()){
    //  Particle p = it.next();
    //  p.applyForce(new PVector(0,0.05));
    //  p.run();
    //  if(p.isDead()){
    //    it.remove();
    //  }
    //}
        
    //counting backward to avoid skipping.
    for(int i = particles.size()-1; i >=0 ; i--){
      Particle p = particles.get(i);
      p.applyForce(new PVector(0,0.05));
      p.run();
      if(p.isDead()){
        particles.remove(i);
      }
    }
    
    
  }
  
}