class Walker{
  float x, y;
  float tx,ty;
  
  Walker(){
    tx = 0;
    ty = 10000;
    
    x = width/2;
    y = height/2;
  }
  
  void step(){
    
    float stepx = map(noise(tx),0,1,-5,5);
    float stepy = map(noise(ty),0,1,-5,5);

    x = x +stepx;
    y = y+stepy;
    
    x = constrain(x,0,width-1);
    y = constrain(y,0,height-1);
    tx+=0.01;
    ty+=0.01;
    
  }
  
  void show(){
    fill(255);
    ellipse(x,y,5,5);
  }
}