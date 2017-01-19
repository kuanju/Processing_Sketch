SpaceShip sp;
void setup(){
  size(600,600);
  sp = new SpaceShip(width/2,height/2);
  smooth();
}

void draw(){
  background(255);
  sp.update();
  sp.display();
}

void keyPressed(){
  if(key == 'z'){
    sp.acceleration.set(0,-1); 
  }
  
  if(key == CODED){
    if(keyCode == LEFT){
      sp.aVelocity=-1;
    }else if(keyCode == RIGHT){
      sp.aVelocity=1;
    }
  }
}

void keyReleased(){
      sp.aVelocity=0; 
      sp.acceleration.set(0,0); 

}