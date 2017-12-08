
class Mover { 
  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;
  boolean touched=false;
  ParticleSystem ps;
  boolean net=false;
  // Arbitrary damping to simulate friction / drag 
  float damping = 0.95;
  
  Mover(){};
  Mover(PVector pos,float _mass){
  position=pos;
  acceleration=new PVector();
  velocity = new PVector();
  mass=_mass;
  net=true;
}
  Mover(float x, float y,float mass_) {
    position = new PVector(x,y);
    velocity = new PVector();
    acceleration = new PVector();
    mass=mass_;

  } 

  // Standard Euler integration
  void update() { 
    velocity.add(acceleration);
    velocity.mult(damping);
    position.add(velocity);
    acceleration.mult(0);
  }

  void applyForce(PVector force) {
   PVector f = PVector.div (force, mass);
   
    this.acceleration.add(f);
  }
   void applyHit(PVector force,float _mass) {
   PVector f = PVector.div (force, _mass);
   
    this.acceleration.add(f);
  }
  
  void display() { 
    if(net){
          stroke(255);
        noFill();
    ellipse(position.x,position.y,20,20);
    }
    else{
        stroke(255);
    fill(255,218,185);
    ellipse(position.x,position.y,50,50);
    }

  } 
  void checkEdges() {

    if (position.y+25 > height) {
      velocity.y *= -0.9;
      position.y = height;
     touched=true;
      ps = new ParticleSystem(new PVector(width/2,height-10));   
      this.mass=0;
    }
      else if(position.y <=0){
      velocity.y*=-0.9;
      position.y=0;
    }
  }

boolean isInside(Net l) {
  
  if (position.y>=l.movers[1].position.y )
    return true;
   
   return false;
  }
  
}