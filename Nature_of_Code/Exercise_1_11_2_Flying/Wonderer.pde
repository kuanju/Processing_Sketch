class Wonderer{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float radius;
  float boundry;
  PVector noiseOff;
  
  Wonderer(){
    location = new PVector(width/2,height/2,0);
    velocity = new PVector(0,0,0);
    radius = 5;
    boundry = 190;
    noiseOff = new PVector(random(1000),random(1000),random(1000));
    acceleration = new PVector();
  }
  
  void update(){
    acceleration.x = map(noise(noiseOff.x), 0, 1, -1, 1);
    acceleration.y = map(noise(noiseOff.y), 0, 1, -1, 1);
    
    //acceleration.z = map(noise(noiseOff.z), 0, 1, -1, 1);

    acceleration.mult(0.1);

    noiseOff.add(0.01, 0.01, 0);


    velocity.add(acceleration);
    velocity.limit(1);
    location.add(velocity);
    
  }
  
  void checkEdge(){
    if(location.x<0){
      location.x = width;
    }else if(location.x>width){
      location.x = 0;
    }
    
    
    if(location.y<0){
      location.y = height;
    }else if(location.y>height){
      location.y = 0;
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
    fill(200,34,50);
    translate(location.x,location.y,location.z);
    sphere(radius);
    popStyle();
    popMatrix();
  }
}