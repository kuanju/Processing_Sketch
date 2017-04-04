class Flys{
  PVector loc;
  PVector vel;
  PVector acc;
  float mass = 3;
  float damping = 0.98;
  PVector oppositeForce;
  
  float angle;
  float aVel;
  
  PVector anchor;
  float len;
  float k = 0.1;
  
  float minlen;
  float maxlen;
  float distance;
  
  boolean showLine;

  Flys(PVector a, float l){
    anchor = a;
    len = l;

    loc = new PVector(anchor.x+random(10),anchor.y+random(10));
    vel = new PVector(0,0);
    acc = new PVector();
    
    aVel = random(-3,3);
    
    oppositeForce = new PVector();
    
    minlen = random(3);
    maxlen = random(10,40);
    
    showLine = false;
  }
  
  void update(){
    angle += aVel;
    
    PVector force = PVector.sub(loc,anchor);
    float d = force.mag();
    float stretch = d-len;
    force.normalize();
    force.mult(-1*k*stretch);
    oppositeForce = force;

    //apply force to flys
    force.div(mass);
    acc.add(force);
    
    vel.add(acc);
    vel.mult(damping);
    loc.add(vel);
    loc.add(cos(radians(angle)),sin(radians(angle)));
    acc.mult(0);
    
    //constrain length
    PVector dir = PVector.sub(loc, anchor);
    distance = dir.mag();
    // Is it too short?
    if (distance < minlen) {
      dir.normalize();
      dir.mult(minlen);
      // Reset position and stop from moving (not realistic physics)
      loc = PVector.add(anchor, dir);
      vel.mult(0);
      // Is it too long?
    } 
    else if (distance > maxlen) {
      dir.normalize();
      dir.mult(maxlen);
      // Reset position and stop from moving (not realistic physics)
      loc = PVector.add(anchor, dir);
      vel.mult(0);
    }
    
    
    //if(loc.x<0){
    //  loc.x = width;
    //}else if(loc.x>width){
    //  loc.x = 0;
    //}
    
    
    //if(loc.y<0){
    //  loc.y = height;
    //}else if(loc.y>height){
    //  loc.y = 0;
    //}
    
  }
  
  
  PVector getForce(){
    return oppositeForce;
  }
  
  void display(){
    pushMatrix();
      rectMode(CENTER);
      if(keyPressed){
        if (key == 's' || key == 'S') {

          stroke(20);
          line(anchor.x,anchor.y,loc.x,loc.y);
        }
      }
      noStroke();
      fill(20);
      rect(anchor.x,anchor.y,3,3);
      ellipse(loc.x,loc.y,3,3);
      if(distance<maxlen+50){

      }
    popMatrix();
  }
}