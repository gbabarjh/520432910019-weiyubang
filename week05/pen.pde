int ijk=4000;
boolean a=false;
boolean b=false;
boolean c=false;
boolean d=false;
color r=#BDF0E8;
color o=#47E9FC;
color j=#8BFC14;
color p=#FAEB42;
color back=255;
int angle=0;
int ban=0;
void setup(){
  size(800,800);
  background(back);

}
void draw(){
//fill(255,10);
 // rect(0,0,800,800);
  pushMatrix();
  strokeWeight(5);
  stroke(r);
  fill(0);
  rect(0,0,50,50);
   fill(o);
  rect(0,80,100,150);
   fill(p);
  rect(0,570,100,150);
   fill(j);
    rect(0,325,100,150);
   lone();
    ltwo();
    lthree();
 lfour();
if(a==true){
  if(mousePressed){
fill(o);
noStroke();
translate(mouseX,mouseY);
rotate(radians(ban));
ban+=5;
pushMatrix();
ellipse(0,0,10,10);

for(int i=0;i<8;i++){
  angle+=45;
  rotate(radians(angle));
ellipse(10,0,5,5);
  }
  popMatrix();
  }
}
if(b==true){
  if(mousePressed){
fill(j);
noStroke();
translate(mouseX,mouseY);
for(int i=0;i<10;i++){
rotate(random(0,1));
ellipse(0,0,random(0,50),random(0,6));
  }
  }
}
pushMatrix();
if(c==true){
  if(mousePressed){
fill(j);
stroke(p);
  strokeWeight(1.5);
  line(mouseX,mouseY,pmouseX,pmouseY);
   line(mouseX-12,mouseY-12,pmouseX-12,pmouseY-12);
for(int i=0;i<4;i++){

ellipse(mouseX+i*-3,mouseY+i*-4,4,i+2);
}
  }
}
popMatrix();
if(d==true){
  noStroke();
 fill(back);
 rect(100,0,800,800);
}
popMatrix();

}
void lone() {
 if((mouseX<100)&&(mouseX>0)&&(mouseY>80)&&(mouseY<230)){
 if(mousePressed==true)
 a=true;
 b=false;
 c=false;
 d=false;
 }
}
void ltwo() {
 if((mouseX<100)&&(mouseX>0)&&(mouseY>325)&&(mouseY<475)){
 if(mousePressed==true)
 b=true;
 a=false;
 c=false;
 d=false;
 }
}
void lthree() {
 if((mouseX<100)&&(mouseX>0)&&(mouseY>570)&&(mouseY<720)){
 if(mousePressed==true)
c=true;
a=false;
b=false;
d=false;
 }
}
void lfour() {
 if((mouseX<50)&&(mouseX>0)&&(mouseY>0)&&(mouseY<50)){
 if(mousePressed==true)
d=true;
a=false;
b=false;
c=false;
 }
}
void keyPressed(){
if(key=='s')
save("sketch"+year()+"-"+month()+"_"+day()+"_"+hour()+"_"+minute()+"_"+second());
}
