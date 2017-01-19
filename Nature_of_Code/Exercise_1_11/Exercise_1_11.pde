Lover[] lovers = new Lover[8];

void setup(){
  size(640,640,P3D);
  for(int i = 0; i<lovers.length; i++){
    lovers[i] = new Lover();
  }
}


void draw(){
  background(255);
  //noStroke();
  //noFill();
  for(int i = 0 ; i < lovers.length; i++){
    lovers[i].update();
    lovers[i].show();
    //if(i>0){
    //  line(lovers[i-1].location.x,lovers[i-1].location.y,lovers[i-1].location.z,lovers[i].location.x,lovers[i].location.y,lovers[i].location.z);
    //}else{
    //  line(lovers[0].location.x,lovers[0].location.y,lovers[0].location.z,lovers[lovers.length-1].location.x,lovers[lovers.length-1].location.y,lovers[lovers.length-1].location.z);
    //}
  }
  
  beginShape(TRIANGLE_FAN);
  //stroke(5);
  noStroke();
  for(int i = 0 ; i < lovers.length; i++){
    vertex(lovers[i].location.x,lovers[i].location.y,lovers[i].location.z);
  }
  endShape();
  
}