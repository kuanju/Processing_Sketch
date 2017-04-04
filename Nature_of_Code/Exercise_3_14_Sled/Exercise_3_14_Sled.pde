ArrayList<Box> box =new ArrayList<Box>();

float angle;
float ln = 500;

void setup(){
  size(500,500);
  box.add(new Box());
}

void draw(){
  background(255);
  
  angle = map(height-mouseY,0,height,0,90);
  float x = ln*cos(radians(angle));
  float y = height-ln*sin(radians(angle));
  line(0,height,x,y);
  
  for(int i = 0; i < box.size(); i++ ){
    box.get(i).update();
    box.get(i).display();
    if(box.get(i).location.x<-500){
      box.remove(i);
    }
  }
  println(box.size());
}

void mouseReleased() {
  box.add(new Box());
}