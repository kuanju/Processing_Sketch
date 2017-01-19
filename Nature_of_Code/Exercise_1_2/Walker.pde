class Walker{
  PVector location;
  PVector velocity;
  float noiseX,noiseY;
  
  Walker(){
    noiseX = 0;
    noiseY = 10000;
    
    location = new PVector(width/2,height/2);
    velocity = new PVector(0,0);

  }
  
  void step(){
    
    float speedx = map(noise(noiseX),0,1,-5,5);
    float speedy = map(noise(noiseY),0,1,-5,5);
    velocity.set(speedx, speedy);
    
    location.add(velocity);
    
    location.x = constrain(location.x,0,width-1);
    location.y = constrain(location.y,0,height-1);
    noiseX+=0.01;
    noiseY+=0.01;
    
  }
  
  void show(){
    fill(255);
    ellipse(location.x,location.y,5,5);
  }
}