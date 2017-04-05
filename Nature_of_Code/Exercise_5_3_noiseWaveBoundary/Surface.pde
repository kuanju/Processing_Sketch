class Surface{
  
  ArrayList<Vec2> surface;
  
  Surface(){
    surface = new ArrayList<Vec2>(); 
    // Here we keep track of the screen coordinates of the chain

    ChainShape chain = new ChainShape();
    
    // Perlin noise argument
    float xoff = 0.0;

    // This has to go backwards so that the objects  bounce off the top of the surface
    // This "edgechain" will only work in one direction!
    for (float x = width+10; x > -10; x -= 5) {

      // Doing some stuff with perlin noise to calculate a surface that points down on one side
      // and up on the other
      float y;
      if (x > width/2) {
        y = 50 + (width - x)*1.1 + map(noise(xoff),0,1,-80,80);
      } 
      else {
        y = 50 + x*1.1 + map(noise(xoff),0,1,-40,40);
      }

      // Store the vertex in screen coordinates
      surface.add(new Vec2(x,y));

      // Move through perlin noise
      xoff += 0.1;

    }
    
    Vec2[] vertices = new Vec2[surface.size()];
    for(int i = 0; i<vertices.length; i++){
      Vec2 edge = box2d.coordPixelsToWorld(surface.get(i));
      vertices[i] = edge;
    }


    
    
    chain.createChain(vertices, vertices.length);
    
    BodyDef bd = new BodyDef();
    
    Body body = box2d.world.createBody(bd);
    body.createFixture(chain, 1);

  }
  
  void display(){
    strokeWeight(1);
    stroke(0);
    noFill();
    beginShape();
    for (Vec2 v: surface){
      vertex(v.x,v.y);
    }
    endShape();
  }
  
}