class Hater{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float radius;
  float boundry;
  
  Hater(){
    location = new PVector(width/2+random(10),height/2+random(10),0);
    velocity = new PVector(0,0,0);
    acceleration = new PVector(0,0,0);
    radius = 5 ;
    boundry = 190;
  }
  
  void update(){
     
    PVector mouse = new PVector(mouseX,mouseY,0);
    // Compute a vector that points from position to mouse
    
    //method1
    //PVector acceleration = PVector.sub(mouse,location);
    // Set magnitude of acceleration
    //acceleration.setMag(0.2);
 
    //method2
    PVector dir = PVector.sub(mouse,location);
    float mag = dir.mag();
    dir.normalize();
    if(mag < 250){
      dir.mult(-0.2);
      acceleration = dir;

    }else{
      //dir.mult(0.2);
      acceleration.set(0,0,0);
    }


    velocity.add(acceleration);
    velocity.limit(2);
    location.add(velocity);
  }
  
  void checkEdge(){
    if(location.x<0){
      location.x = width-1;
    }else if(location.x>width){
      location.x = 1;
    }
    
    
    if(location.y<0){
      location.y = height-1;
    }else if(location.y>height){
      location.y = 1;
    }
    
    //if(location.z<0){
    //  location.z = 200;
    //}else if(location.z>200){
    //  location.z = 0;
    //}
  }
  
  void show(){
    pushMatrix();
    pushStyle();
    lights();
    noStroke();
    fill(100);
    translate(location.x,location.y,location.z);
    sphere(radius);
    popStyle();
    popMatrix();
  }
}