
class Spring implements sFactory{ 

  Anchor anchor=null;
  Mover anc;
  String name;
  // Longeur de l'élastique
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

  // Calcul de la force du spring
  void update() {
 
    if(!mov.touched)
    {
             PVector force= PVector.sub(mov.position, anchor.position);
    float d = force.mag();
    float stretch = d-len;
    // F = k * stretch
    force.normalize();
    force.mult(-1 * k * stretch);
    mov.applyForce(force);      

    }
 
   
  }
 //Vérifie si l'élastique est soit trop court ou trop long
  void constrainLength(Mover b, float minlen, float maxlen) {
    PVector dir = PVector.sub(b.position, anchor.position);
    float d = dir.mag();
    if (d < minlen) {
      dir.normalize();
      dir.mult(minlen);
      //teleport l'élastique à la position initiale
      b.position = PVector.add(anchor.position, dir);
      b.velocity.mult(0);
      // Is it too long?
    } 
    else if (d > maxlen) {
      dir.normalize();
      dir.mult(maxlen);
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