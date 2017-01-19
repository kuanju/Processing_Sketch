class Tree{
  float size;
  PVector location;
  PVector velocity;
  color c;
  Tree(){
    location = new PVector(random(width*1.5),random(height*1.5),-200);
    velocity = new PVector(0,1,0);
    size = random(30,50);
    c = color(0,50+random(100),random(20));
  }
  
  void update(){
    location.add(velocity);
    if(location.y>height+200){
      size = random(30,50);
    c = color(0,50+random(100),random(20));
      location.set(random(width*1.5)-100,-200-(random(20)));
    }
  }
  void show(){
    pushMatrix();
    pushStyle();
    lights();
    fill(c);
    translate(location.x,location.y,location.z);
    rotateX(radians(270));
    rotateY(size);

    drawCylinder(0,size,size*3,3);
    popStyle();
    popMatrix();
  }
  
  
  void drawCylinder(float topRadius, float bottomRadius, float tall, int sides) {
  float angle = 0;
  float angleIncrement = TWO_PI / sides;
  beginShape(QUAD_STRIP);
  for (int i = 0; i < sides + 1; ++i) {
    vertex(topRadius*cos(angle), 0, topRadius*sin(angle));
    vertex(bottomRadius*cos(angle), tall, bottomRadius*sin(angle));
    angle += angleIncrement;
  }
  endShape();
  
  // If it is not a cone, draw the circular top cap
  if (topRadius != 0) {
    angle = 0;
    beginShape(TRIANGLE_FAN);
    
    // Center point
    vertex(0, 0, 0);
    for (int i = 0; i < sides + 1; i++) {
      vertex(topRadius * cos(angle), 0, topRadius * sin(angle));
      angle += angleIncrement;
    }
    endShape();
  }

  // If it is not a cone, draw the circular bottom cap
  if (bottomRadius != 0) {
    angle = 0;
    beginShape(TRIANGLE_FAN);

    // Center point
    vertex(0, tall, 0);
    for (int i = 0; i < sides + 1; i++) {
      vertex(bottomRadius * cos(angle), tall, bottomRadius * sin(angle));
      angle += angleIncrement;
    }
    endShape();
  }
  }
}