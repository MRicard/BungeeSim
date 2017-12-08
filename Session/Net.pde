class Net{
 NetSpring[] springs=new NetSpring[2];
 Spring left;
 Spring right;
 Mover[] movers=new Mover[3];
 PVector Positionl=new PVector(100,height/2);
 PVector Positionm=new PVector(width/2,height/2);
 PVector Positionr=new PVector(width-100,height/2);

 int nbmovers=3;
 Net(Anchor _left,Anchor _right){
  /**
  Left et Right sont des springs qui ont un ancre alors que les autres sont ceux du milieu.
  */
    movers[0]=new Mover(Positionl,1);
    movers[1]=new Mover(Positionm,1);
    movers[2]=new Mover(Positionr,1);
    left=new Spring(movers[0],_left,100,"left");
    right=new Spring(movers[2],_right,80,"right");
    springs[0]=new NetSpring(movers[0],movers[1],200);
    springs[1]=new NetSpring(movers[1],movers[2],200);


 }
 void display()
 {
   for(int i=0;i<nbmovers;i++){
        movers[i].display();
       }
    left.display();
    right.display();
    springs[0].display();
    springs[1].display();
 }
 
  void update()
 {
   for(int i=0;i<nbmovers;i++){
        movers[i].update();
       }
       left.update();
       right.update();
           springs[0].update();
    springs[1].update();
 }
  
}