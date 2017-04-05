import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

// A list for all of our rectangles
ArrayList<Box> boxes;
ArrayList<Boundary> boundaries;

Box2DProcessing box2d;


void setup() {
  size(400,300);
  smooth();
  // Create ArrayLists
  boxes = new ArrayList<Box>();
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0,-10);
  
  boundaries = new ArrayList<Boundary>();
  boundaries.add(new Boundary(width/4,height-5,width/2-50,10));
  boundaries.add(new Boundary(3*width/4,height-50,width/2-50,10));

}

void draw() {
  background(255);

  box2d.step();

  // randomly create new box
  if (random(1)<0.2) {
    Box p = new Box(width/2,30);
    boxes.add(p);
  }

  // Display all the boxes
  for (Box b: boxes) {
    b.display();
  }
  
  // Display all the boundaries

  for (Boundary wall: boundaries) {
    wall.display();
  }

  
  
  //remove out of screen boxes.
  for(int i = boxes.size()-1; i>=0; i--){
    Box b = boxes.get(i);
    if(b.done()){
      boxes.remove(i); // remove from the list
    }
  }
}