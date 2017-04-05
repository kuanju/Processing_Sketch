class Particle{
  Body body;
  float r;
  
  
  
  Particle(float x, float y, float r_){
    r = r_;
    makeBody(x,y,r);
    
  }

  
  
  void display(){
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    
    Fixture f = body.getFixtureList();
    PolygonShape ps = (PolygonShape) f.getShape();
    
    
    
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-a);
    fill(127);
    
    stroke(0);
    strokeWeight(2);
    
    beginShape();
    for(int i = 0; i < ps.getVertexCount(); i++){
      Vec2 v = box2d.vectorWorldToPixels(ps.getVertex(i));
      vertex(v.x, v.y);
    }
    endShape(CLOSE);
    
    popMatrix();
  }
  
  
  void makeBody(float x, float y, float r){
    BodyDef bd = new BodyDef();
    bd.position = box2d.coordPixelsToWorld(x,y);
    bd.type = BodyType.DYNAMIC;
    body = box2d.world.createBody(bd);
    
    Vec2[] vertices = new Vec2[4];
    vertices[0] = box2d.vectorPixelsToWorld(new Vec2(-15,25));
    vertices[1] = box2d.vectorPixelsToWorld(new Vec2(15,0));
    vertices[2] = box2d.vectorPixelsToWorld(new Vec2(20,-15));
    vertices[3] = box2d.vectorPixelsToWorld(new Vec2(-10,10));
    
    
    PolygonShape ps = new PolygonShape();
    ps.set(vertices, vertices.length);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.density =1;
    fd.friction = 0.5;
    fd.restitution =0.3;
    
    body.createFixture(fd);
    
    body.setLinearVelocity(new Vec2(random(-10f,10f),random(5f,10f)));
    body.setAngularVelocity(random(-10,10));

    
    
  }
  void killBody(){
    box2d.destroyBody(body);
  }
  
  boolean done(){
    Vec2 pos = box2d.getBodyPixelCoord(body);
    if(pos.y>height+r*2){
      killBody();
      return true;
    }
  return false;
  }
  
}