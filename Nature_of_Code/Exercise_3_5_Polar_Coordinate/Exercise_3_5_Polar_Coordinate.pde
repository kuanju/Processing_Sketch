float r = 15;
float theta = 0;

void setup(){
  size(640,640);
  background(255);
}

void draw(){
  float x = r*cos(theta);
  float y = r*sin(theta);
  
  noStroke();
  fill(r);
  ellipse(width/2+x,height/2+y, 16,16);
  theta+=0.02;
  r+=0.1;
}