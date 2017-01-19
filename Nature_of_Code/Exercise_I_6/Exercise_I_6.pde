Walker w;
void setup(){
  size(400,400);
  w = new Walker();
}

void draw(){
  w.step();
  w.display();
}