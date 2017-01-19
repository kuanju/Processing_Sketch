class BasicWave{
  PVector location;
  PVector velocity;
  float speed;
  float period;
  int waveLength;
  float startAngle = 0;
  float amplitude = 50;
  int brightness;
  BasicWave(int ln, float sp,float pd){
    speed = sp;
    period = pd;
    waveLength = ln;
    location = new PVector(random(width),random(height));
    velocity = new PVector(1,0);
    brightness = int(random(100));
  }
  
  void update(){
    startAngle+=speed;
    location.add(velocity);
    if(location.x>width+50){
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
    pushStyle();
    pushMatrix();
    //noFill();

    //stroke(brightness);
    
    translate(location.x,location.y);
    rotate(startAngle/10);
    float angle = startAngle;
 
    for(int i = 0; i<waveLength; i++){
      float y = map(sin(angle),-1,1,-amplitude/2,amplitude/2);
      noStroke();
      fill(brightness);
      ellipse(-i*5,y,8/(i+1),8/(i+1));
      angle-=period;
    }    
    popMatrix();
    popStyle();

  }
}