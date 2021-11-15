int angle=0;
int value=0;
void setup(){
  size(600,600,P3D);
  smooth();
  frameRate(30);
}

void draw(){
    background(0);
if(value==0){
//  for(int i=0;i<6;i++){
   babay(random(width),random(height),100,10);
//}
}
  PVector a = new PVector(0,height/2);
  PVector b = new PVector(width,height/2);
  avoid(a,b,10);
}
void babay(float x,float y,float z,int aiz){
  if(aiz>0){
    noFill();
  stroke( map(mouseX,0,width,10,150),map(mouseX,0,width,10,75),map(mouseX,0,width,60,125));


  ellipse(x,y,z,z);
  babay(x,y,z*0.8,aiz-1);
}
}
void avoid( PVector a1, PVector a2, int rcd){
  if(rcd>0){
    PVector mp = PVector.add(a1,a2);
    mp.mult(0.5);
    PVector dd = PVector.sub(a1,a2);
   float distance = dd.mag();
//   float distance = random(0,10）;
    pushMatrix();
   translate(mp.x,mp.y);
      angle+=1;
      if(value==1){
       rotateX(radians(angle));
      }else
        rotateY(radians(angle));
   // noFill();
    stroke( map(mouseX,0,width,10,150),map(mouseX,0,width,10,75),map(mouseX,0,width,60,125));
    strokeWeight(2);
    fill( map(mouseX,0,width,0,41),map(mouseX,0,width,230,242),map(mouseX,0,width,190,221));
    ellipse(20,0,distance/10,distance);
    popMatrix();
    avoid(a1,mp,rcd-1);
    avoid(a2,mp,rcd-1);
      // recursion(a2,mp,rcd);
  }
}
void mouseClicked() {
  if(value == 0) {
    value = 1;
  }else {
    value=0;
  }
}
