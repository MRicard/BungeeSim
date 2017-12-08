class NetSpring extends Spring implements sFactory{
  Mover left;
  Mover right;
  int len;
   NetSpring(){super();} 
   NetSpring(Mover _left,Mover _right,int _len){
     left=_left;
     right=_right;
     len=_len;
   }

   void update() {
 
    if(right.touched)
    {
      
       PVector force= PVector.sub(right.position, left.position);
    // What is distance
    float d = force.mag();
    // Stretch is difference between current distance and rest length
    float stretch = d-len;
    // F = k * stretch
    force.normalize();
    force.mult(-1 * k * stretch);
    right.applyForce(force);
    }
   
  }
 // Constrain the distance between bob and anchor between min and max
  void constrainLength(Mover b, float minlen, float maxlen) {
   
  }

  void display() {
    strokeWeight(2);
    stroke(255);
   line(left.position.x, left.position.y, right.position.x, right.position.y);
  }
   
}