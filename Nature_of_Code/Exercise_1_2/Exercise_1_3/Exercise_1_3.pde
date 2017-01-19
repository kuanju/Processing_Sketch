Ball b;

void setup(){
  size(640,640,P3D);
  b = new Ball();
}


void draw(){
  background(255);
  //noStroke();
  noFill();
  lights();
  pushMatrix();
  translate(width/2,height/2, 0);
  box(380);
  b.update();
  b.show();
  popMatrix();
  
}