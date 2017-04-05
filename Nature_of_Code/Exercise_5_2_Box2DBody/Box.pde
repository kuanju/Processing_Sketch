// A rectangular box
class Box  {

  Body body;
  //1. create body definition includes position and type
  //   body type contains dynamic, static, and kinematic(user control object)
  //2. create body
  //3. create shape (polygon, circle, chain)
  //4. create fixture (glue bind shape to the body) density, ficition, restitution(elastic)
  //5. put it all together
  
  float w,h;

  // Constructor
  Box(float x, float y) {
    w = 16;
    h = 16;
    makeBody(new Vec2(x,y), w,h);
    
  }

  void killBody(){
    box2d.destroyBody(body);
  }
  
  boolean done(){
    Vec2 pos = box2d.getBodyPixelCoord(body);
    if(pos.y > height+w*h){
      killBody(); // kill the world body
      return true;
    }
    return false;
  }

  // Drawing the box
  void display() {
    // WE need body location and angle
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    
    pushMatrix();
    translate(pos.x,pos.y);    // Using the Vec2 position and float angle to
    rotate(-a);              // translate and rotate the rectangle
    fill(175);
    stroke(0);
    rectMode(CENTER);
    rect(0,0,w,h);
    popMatrix();
    
    
  }
  
  void makeBody(Vec2 center, float w_, float h_){
    //build body def
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(center));
    body = box2d.createBody(bd);
    
    //Define a polygon
    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w_/2);
    float box2dH = box2d.scalarPixelsToWorld(h_/2);
    sd.setAsBox(box2dW,box2dH);
    
    
    //Define a fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;
    
    //Attach fixture to body
    body.createFixture(fd);
    
    //Give it some initial random velocity
    body.setLinearVelocity(new Vec2(random(-5,5), random(2,5)));
    body.setAngularVelocity(random(-5,5));
  }
}