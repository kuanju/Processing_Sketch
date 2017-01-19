Landscape land;

float angle = 0.0;;
void setup(){
  //fullScreen(P3D);

  size(600,600,P3D);
  land = new Landscape(20,20,500,500,300);

  //land = new Landscape(20,300,300);
  smooth(8);
}

void draw(){
  land.update();
  background(0,30,55);
  pushMatrix();

  translate(width/2,height/2+20,-260);

  rotateX(PI/3);
  rotateZ(angle);
  land.show();

  popMatrix();
  
  angle+=0.0025;
}





//// The Nature of Code
//// Daniel Shiffman
//// http://natureofcode.com

//// Landscape with height values according to Perlin noise

//Landscape land;    
//float theta = 0.0;

//void setup() {

//  size(800,200,P3D);

//  // Create a landscape object
//  land = new Landscape(20,800,400);
//}

//void draw() {

//  // Ok, visualize the landscape space
//  background(255);
//  pushMatrix();
//  translate(width/2,height/2+20,-160);
//  rotateX(PI/3);
//  rotateZ(theta);
//  land.render(); 
//  popMatrix();

//  land.calculate();
  
//  theta += 0.0025;
//}