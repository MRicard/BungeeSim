
class Spring implements sFactory{ 

  // position
  Anchor anchor=null;
  Mover anc;
  String name;
  // Rest length and spring constant
  float len;
  float k = 0.2;
  
  Mover mov;
  
Spring(){};
  Spring(Mover _mov,Anchor _anchor,int l,String _name) {
    anchor=_anchor;
    mov = _mov;
    len = l;
    name=_name;
  } 

  // Calculate spring force
  void update() {
 
    if(!mov.touched)
    {
             PVector force= PVector.sub(mov.position, anchor.position);
    // What is distance
    float d = force.mag();
    // Stretch is difference between current distance and rest length
    float stretch = d-len;
    // F = k * stretch
    force.normalize();
    force.mult(-1 * k * stretch);
    mov.applyForce(force);      

    }
 
   
  }
 // Constrain the distance between bob and anchor between min and max
  void constrainLength(Mover b, float minlen, float maxlen) {
    PVector dir = PVector.sub(b.position, anchor.position);
    float d = dir.mag();
    // Is it too short?
    if (d < minlen) {
      dir.normalize();
      dir.mult(minlen);
      // Reset position and stop from moving (not realistic physics)
      b.position = PVector.add(anchor.position, dir);
      b.velocity.mult(0);
      // Is it too long?
    } 
    else if (d > maxlen) {
      dir.normalize();
      dir.mult(maxlen);
      // Reset position and stop from moving (not realistic physics)
      b.position = PVector.add(anchor.position, dir);
      b.velocity.mult(0);
    }
  }

  void display() {
    strokeWeight(2);
    stroke(255);
    if(name=="top")
   line(anchor.position.x+10, anchor.position.y+20, mov.position.x, mov.position.y);
   else if(name=="left")
     line(anchor.position.x+20, anchor.position.y+10, mov.position.x, mov.position.y);
    else
    line(anchor.position.x, anchor.position.y+10, mov.position.x, mov.position.y);

  }
}