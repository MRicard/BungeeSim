
 PVector gravity = new PVector(0,0.2);
 Anchor anchor;
 Mover mov;
 Net net;
 
 Anchor left;
 Anchor right;
static State state;
static State current=state.Splash;
sFactory springs=null;
sFactory netSpr=null;
 int start;
 float time;
boolean exploded=false;

void setup() {
  size(800,600);
  //fullScreen();

  anchor=new Anchor(width/2,40);
  left= new Anchor(0,height/2-10);
  right= new Anchor(width-20,height/2-10);
  mov=new Mover(width/2,40,random(30,60));
  net=new Net(left,right);
   springs=new NetSpring();
   netSpr=springs;
  springs=new Spring(mov,anchor,height-150,"top");

  start=millis();
}

void draw() {
  //Si l'état est en splash screen
  if(current==current.Splash){
    background(255);
    fill(0);
    textSize(64);
    text("BUNGEE SIMULATOR",0,height/2-64);
      textSize(32);
     text("Par: Martin Ricard",width/2,height/2-32);
  }
  else
  {
    //boucle d'affichage de l'animation
      background( 0);
  anchor.display();
  left.display();
  right.display();
  update();
  display();
  }
  time=millis()-start;
if(time>=5000 && current!=current.Splash){
  setup();
 } 
 else if(time>=5000 && current==current.Splash){
     current=current.Animation;
     start=millis();
 }
}

void update(){
    mov.applyForce(gravity);
  springs.constrainLength(mov,10,height+100);
 
    mov.update();
    springs.update();
     if(mov.mass!=0){
    net.update();
  }
  mov.checkEdges();
  //si le mover qui tombe touche le mover du milieu du filet, ce dernier suit le mover
  if(mov.isInside(net)){
  net.movers[1].applyHit(mov.velocity,mov.mass);
  net.movers[1].mass=mov.mass;
  net.movers[1].acceleration=mov.acceleration;
  net.movers[1].velocity=mov.velocity;

  }


}
void display(){
          net.display();
  //si le mover a toucher le bas de l'écran
  if(mov.touched  )
  {
       mov.ps.addParticle();
  mov.ps.run();  
   net.movers[1].mass=1;
  net.movers[1].acceleration.mult(0);
  net.movers[1].velocity.mult(0);
  }
  else{
      springs.display();
      mov.display();
  }
    

}

 void keyPressed(){
  switch(key){
   case 'r':setup();
             break;
  }
 }