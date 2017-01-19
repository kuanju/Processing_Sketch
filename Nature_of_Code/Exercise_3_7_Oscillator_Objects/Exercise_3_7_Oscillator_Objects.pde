Oscillator[] os = new Oscillator[5];
void setup(){
  size(500,590);
  for(int i = 0; i < os.length; i++){
    os[i] = new Oscillator();
  }
}

void draw(){
  pushStyle();
  fill(255,3);
  //fill(255);

  rect(0,0,width,height);
  popStyle();
  for(int i = 0; i < os.length; i++){
    os[i].update();
    os[i].display();

  }  
}