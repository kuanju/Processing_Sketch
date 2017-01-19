class Balloon{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float w,h;
  
  
  Balloon(float _w, float _h){
    location = new PVector(width/2, height/2);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    w = _w;
    h = _h;
  }
  
  void update(){
    if(location.y<0){
      acceleration.y=10;
    }
    if(location.x<0){
      acceleration.x=10;;
    }else if(location.x > width){
      acceleration.x=-10;;
    }


    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);//clear acceleration
  }
  
  void addForce(PVector force){
    acceleration.add(force);
  }
  
  void show(){
    pushStyle();
    fill(100,32,55,80);
    noStroke();
    ellipse(location.x,location.y,w,h);
    stroke(0);
    noFill();
    beginShape();
    curveVertex(location.x,location.y);
    curveVertex(location.x,location.y+h/2);
    curveVertex(location.x-10,location.y+h);
    curveVertex(location.x-50,location.y+h*3);
    curveVertex(location.x-30,location.y+h*5);

    endShape();
    popStyle();

  }
  
}