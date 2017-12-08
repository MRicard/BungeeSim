
class Anchor { 
  PVector position;

  Anchor(float x, float y) {
    position = new PVector(x,y);
  } 

  void display() { 
    stroke(255);
    strokeWeight(2);
    fill(175);
   rect(position.x,position.y,20,20);
  } 
}