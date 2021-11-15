  PFont font;
  String a="寻寻觅觅冷冷清清";
  int angle;

void setup(){
   size(600,600);
   font=createFont("微软雅黑",24,true);
}
int value=1;
void mouseClicked() {
  if(value == 0) {
    value = 1;
  }else {
    value=0;
  }
}
void draw(){
  pushMatrix();
 fill(map(mouseX,0,width,255,0),249,248,60);
 rect(0,0,width,height);
 popMatrix();
 
 textAlign(CENTER);
 textSize(48);
 textFont(font);
 if (value==1)
 {
 pushMatrix();
  translate(mouseX,mouseY);
 rotate(radians(angle));
 angle+=3;
// rotateX(4);
fill(map(mouseX,0,width,0,255),249,248);

 for(int i=0;i<a.length();i++){
    textSize(random(20,40));
   rotate(radians(-i*45));
 text(a.charAt(i),60,0);
 }
 for(int i=0;i<a.length();i++){
    textSize(random(35,60));
   rotate(radians(i*45));
 text(a.charAt(i),120,0);
 }
  for(int i=0;i<a.length();i++){
    textSize(random(5,20));
   rotate(radians(i*45));
 text(a.charAt(i),23,0);
 }
 popMatrix();
 } else
 { fill(map(mouseX,0,width,0,255),249,248);
   for(int i=0;i<a.length();i++){
    textSize(random(35,60));
 text(a.charAt(i),random(0,width),random(0,height));}
 }


 
}
