class Wind{
  PVector force;
  float perlinIncX = 0.0;
  float perlinIncY = 10000.0;
  
  Wind(){
    force = new PVector(0,0);
  }
  
  PVector update(){
    perlinIncX+=0.01;
    perlinIncY+=0.01;
    float fx = map(noise(perlinIncX),0,1,-0.3,0.3);
    float fy = map(noise(perlinIncY),0,1,-0.3,0.3);
    force.set(fx,fy);
    println(fx,fy);
    return force;
  }
  
}