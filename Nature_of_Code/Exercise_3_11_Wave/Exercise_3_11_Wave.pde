BasicWave[] bws = new BasicWave[15];
ComplexWave[] cws = new ComplexWave[2];
 
void setup() {
  size(400,400);
  for(int i=0;i<bws.length;i++){
    bws[i] = new BasicWave(50,random(0.05,0.1),random(0.1,0.5));
  }
  for(int j = 0;j<cws.length;j++){
    cws[j] = new ComplexWave(50,random(0.05,0.1),random(0.1,0.5));
  }
}
 
void draw() {
  background(255);
   for(int i=0;i<bws.length;i++){
    bws[i].update();
    bws[i].display();
  }
  for(int j = 0;j<cws.length;j++){
    cws[j].update();
    cws[j].display();
  }
}