class Repeller{
  PVector location;
  float r = 10;
  float G = 100;
  Repeller(float x, float y){
    location = new PVector(x,y);
  }
  
  void display(){
    stroke(200);
    fill(200);
    ellipse(location.x,location.y, r*2, r*2);
  }
  
  PVector repel(Particle p){
    PVector dir = PVector.sub(location,p.location);
    float d = dir.mag();
    d = constrain(d,5,200);
    dir.normalize();
    float force = -1*G/(d*d);
    dir.mult(force);
    return dir;
  }
  
}