
class Walker{
  float x;
  float y;
  float prevX, prevY;

  
  Walker(){
    x = width/2;
    y = height/2;
  }
  
  float exponentiallyProbability(){
    while(true){
      float stepsize = random(0,10);
      float probability = sq(stepsize);
      float r2 = random(100);
      if(r2 < probability){
        return stepsize;
      }
    }
  }
  
  void step(){
    
    prevX = x;
    prevY = y;

    float stepsize = exponentiallyProbability();
    float stepx = random(-stepsize,stepsize);
    float stepy = random(-stepsize,stepsize);
    
    println(stepx,stepy);
    x+=stepx;
    y+=stepy;
    x = constrain(x,0,width);
    y = constrain(y,0,height);
  }
  
  void display(){
    stroke(255);
    line(prevX,prevY,x, y);
  }
  
}





/*
// Daniel Shiffman
// The Nature of Code
// http://natureofcode.com

// A random walker object!

class Walker {
  float x, y;
  
  float prevX, prevY;

  Walker() {
    x = width/2;
    y = height/2;
  }

  void display() {
    stroke(255);
    line(prevX,prevY,x, y);
  }

  // Randomly move according to floating point values
  void step() {
    prevX = x;
    prevY = y;
    
    float stepx = random(-1, 1);
    float stepy = random(-1, 1);
    
    float stepsize = montecarlo()*50;
    stepx *= stepsize;
    stepy *= stepsize;
    
    x += stepx;
    y += stepy;
    x = constrain(x, 0, width-1);
    y = constrain(y, 0, height-1);
  }
}


float montecarlo() {
  while (true) {  

    float r1 = random(1);  
    float probability = pow(1.0 - r1,8);  

    float r2 = random(1);  
    if (r2 < probability) {  
      return r1;
    }
  }
}
*/