Balloon bn;
Wind wd;
void setup(){
  size(600,600);
  bn = new Balloon(50,90);
  wd = new Wind();
}

void draw(){
  background(250);
  bn.addForce(wd.update());
  bn.update();
  bn.show();
}