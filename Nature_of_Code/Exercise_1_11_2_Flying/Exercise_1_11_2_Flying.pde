Lover[] lovers = new Lover[12];
Hater[] haters = new Hater[50];
Wonderer[] wonderers = new Wonderer[20];
Tree[] trees = new Tree[100];

void setup(){
  size(640,640,P3D);

  
  noCursor();
  for(int i = 0; i<lovers.length; i++){
    lovers[i] = new Lover();
  }
  
  for(int i = 0; i<haters.length; i++){
    haters[i] = new Hater();
  }

  for(int i = 0; i<wonderers.length; i++){
    wonderers[i] = new Wonderer();
  }

  for(int i = 0; i<trees.length; i++){
    trees[i] = new Tree();
  }

}


void draw(){
  background(0,44,33);
  
  for(int i = 0 ; i < trees.length; i++){
    trees[i].update();
    trees[i].show();
  }


  pushMatrix();
  pushStyle();
  fill(250);
  noStroke();
  lights();
  translate(mouseX, mouseY, 0);
  sphere(2);
  popStyle();
  popMatrix();
  
  //noStroke();
  //noFill();
  for(int i = 0 ; i < lovers.length; i++){
    lovers[i].update();
    lovers[i].show();
  }

  
  //for(int i = 0 ; i < haters.length; i++){

  //  haters[i].update();
  //  haters[i].checkEdge();
  //  haters[i].show();
  //}
  
  //for(int i = 0 ; i < wonderers.length; i++){

  //  wonderers[i].update();
  //  wonderers[i].checkEdge();
  //  wonderers[i].show();
  //}
  
  beginShape(TRIANGLE_FAN);
  //stroke(5);
  noStroke();
  for(int i = 0 ; i < lovers.length; i++){
    vertex(lovers[i].location.x,lovers[i].location.y,lovers[i].location.z);
  }
  endShape();
  
}