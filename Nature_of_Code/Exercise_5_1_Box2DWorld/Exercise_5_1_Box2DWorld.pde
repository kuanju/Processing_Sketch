import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

// A list for all of our rectangles
ArrayList<Box> boxes;
Box2DProcessing box2d;

void setup() {
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  
  size(400,300);
  smooth();
  // Create ArrayLists
  boxes = new ArrayList<Box>();
}

void draw() {
  box2d.step();
  background(255);

  // When the mouse is clicked, add a new Box object
  if (mousePressed) {
    Box p = new Box(mouseX,mouseY);
    boxes.add(p);
  }

  // Display all the boxes
  for (Box b: boxes) {
    b.display();
  }
}