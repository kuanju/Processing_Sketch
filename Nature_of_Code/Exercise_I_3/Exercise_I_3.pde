Walker w;

void setup(){
  background(255);
  size(400,400);
  w = new Walker();
}

void draw(){
  w.step();
  w.display();
}