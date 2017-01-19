
Walker w;
void setup(){
  size(500,500);
  w = new Walker();
}

void draw(){
  w.step();
  w.show();
}