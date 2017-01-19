class ComplexWave{
  PVector location;
  PVector velocity;
  float speed;
  float period;
  int waveLength;
  float startAngle = 0;
  float amplitude = 50;
  ComplexWave(int ln, float sp,float pd){
    speed = sp;
    period = pd;
    waveLength = ln;
    location = new PVector(random(width),random(height));
    velocity = new PVector(1,0);
  }
  
  void update(){
    startAngle+=speed;
    location.add(velocity);
    if(location.x>width+200){
      location.x = 0;
    }else if(location.x<0){
      location.x = width;
    }
    
    if(location.y>height){
      location.y = 0;
    }else if(location.y<0){
      location.y = height;
    }

  }
  
  void display(){
    //noFill();
    pushStyle();
    noStroke();
    pushMatrix();
    translate(location.x,location.y);
    float angle = startAngle;
 
    for(int i = 0; i<waveLength; i++){
      fill(255/waveLength*i);
      float y = map(sin(angle)+2*cos(angle/3),-1,1,-amplitude/2,amplitude/2);
      ellipse(-i*5,y,8,8);
      angle-=period;
    }    
    popMatrix();
    popStyle();
  }
}