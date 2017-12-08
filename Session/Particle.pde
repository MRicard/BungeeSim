class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  float mass = 1;

  Particle(PVector l) {
    super();
    acceleration = new PVector(0,0);
    velocity = new PVector(random(-1,1),random(-2,0));
    location = l.copy();
    lifespan = 100.0;
  }

  void run() {
    update();
    display();
  }
  void applyForce(PVector force) {
    PVector f = force.copy();
    f.div(mass);
    acceleration.add(f);
  }
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    lifespan -= 2.0;
  }
  void display() {
    stroke( 255,218,185,lifespan);
    fill( 138,7,7,lifespan);
    ellipse(location.x,location.y,8,8);
  }
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }

}