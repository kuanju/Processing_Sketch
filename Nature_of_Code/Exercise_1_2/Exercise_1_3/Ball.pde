class Ball{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float radius;
  float boundry;
  
  float perlinInc = 0.0;
  Ball(){
    location = new PVector(0,0,0);
    velocity = new PVector(0,0,0);
    radius = 30 ;
    boundry = 190;
  }
  
  void update(){
    //acceleration = new PVector(noise(perlinInc), noise(perlinInc),noise(perlinInc));
    //perlinInc+=0.01;

    //acceleration = PVector.random3D();
    //acceleration.mult(random(2));

    // Compute a vector that points from position to mouse
    PVector mouse = new PVector(mouseX,mouseY,100);
    PVector acceleration = PVector.sub(mouse,location);
    // Set magnitude of acceleration
    acceleration.setMag(0.2);
 
    //PVector dir = PVector.sub(mouse,location);
    //dir.normalize();
    //dir.mult(0.1);
    //acceleration = dir;
    


    velocity.add(acceleration);
    velocity.limit(10);
    location.add(velocity);
    if(location.x<-1*boundry+radius||location.x>boundry-radius){
      velocity.x*=-1;
    }
    if(location.y<-1*boundry+radius||location.y>boundry-radius){
      velocity.y*=-1;
    }
    if(location.z<-1*boundry+radius||location.z>boundry-radius){
      velocity.z*=-1;
    }
  }
  
  void show(){
    pushMatrix();
    translate(location.x,location.y,location.z);
    sphere(radius);
    popMatrix();
  }
}