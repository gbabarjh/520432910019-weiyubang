PVector b=new PVector(mouseX,mouseY);
PVector asl=new PVector (500,height/2);
PVector als=new PVector(50,50);
PVector lsa=new  PVector(950,50);
PVector abc=new PVector(random(0,width),random(0,height));
PImage img;
int lonm=1000;
float angle;
int r=150;
int r2= 75;
float speed=10;

Star []star=new Star[50];
Moon []moon= new Moon[40];
float long1;
float long2;
float long3;
float c2;
int va=0;
int mouse1;
int mouse2;
boolean lia3;
boolean lia2;
boolean lia;
float cl=map(mouseX,0,width,0,255);
void setup(){
  frameRate(10);
background(0);
// mousepressed();
  size(1000,1000);
   img=loadImage("dfmz.jpg");
  img.resize(width,height);
intate();
 intate2();


  }

void intate(){
    for(int i = 0; i < 30; i++){
    star[i] = new Star(asl.x,asl.y, random(20) + 5, random(0.3) + 0.4);
    }
}
void intate2(){
  for(int i = 0; i < 30; i++){
    moon[i]= new Moon(random(0,width),random(0,height),50.0);
  }
}

  
void draw(){
  PVector abc=new PVector(random(0,width),random(0,height));
 lone();
  lone2();
  lone3();
  PVector b=new PVector(mouseX,mouseY);
  image(img,0,0);
   if (lia3==true){
   float llom =map(mouseX,0,width,2,255);
 filter(POSTERIZE,llom);
   }
    if (lia==true){
   float llom =map(mouseX,0,width,0,1);
 filter(THRESHOLD,llom);
   }
       if (lia2==true){
   //float llom =map(mouseX,0,width,0,2);
 filter(ERODE);
   }
      PVector g=new PVector (b.x+r2*cos(radians(angle)),b.y-r2+r2*sin(radians(angle)));
  PVector h=new PVector (b.x+r2*cos(radians(angle)),b.y-r2-r2*sin(radians(angle)));
  PVector l=new PVector (b.x+r2+r2*cos(radians(angle)),b.y+r2*sin(radians(angle)));
   PVector j =new PVector (b.x-r2+r2*cos(radians(angle)),b.y+r*sin(radians(angle)));
    PVector c=new PVector (b.x+r*cos(radians(angle)),b.y-r+r*sin(radians(angle)));
  PVector d=new PVector (b.x+r*cos(radians(angle)),b.y-r-r*sin(radians(angle)));
  PVector e=new PVector (b.x+r+r*cos(radians(angle)),b.y+r*sin(radians(angle)));
   PVector f =new PVector (b.x-r+r*cos(radians(angle)),b.y+r*sin(radians(angle)));
  img.loadPixels();
 // int xx=floor( random(width));
   // int yy=floor( random(height));
   int xx= mouseX;
   int yy =mouseY;
  color caaa=img.get(xx,yy);
  float ba=brightness(caaa);
  float zsize =map (ba,0,255,5,50);
  float antize =map (ba,0,255,50,5);
    float c2=map (ba,0,width,200,240);

  
   intate2();

 cl=map(mouseX,0,width,0,5);
//long1=random(115*zsize,120*zsize);
long1=zsize*40;
long2 =20*zsize;
long3 =100*antize;
//fill(0);


  fill(cl,c2);
  rect(0,0,1000,1000);
     drawLight(als,8000);
          drawLight(lsa,8000);
  drawLight(asl,8000);
  if(mousePressed){
     drawLight(b,lonm);
     lonm+=200;
  }else
  lonm=1000;
  if(lia3==true){
         drawLight(abc,5*long1);
  }
 // }
    
  if(lia2==true){
     drawLight(b,2*long3);
  }
if(lia==true){

  drawLight(b,long1);
  angle+=speed;
  drawLight(d,long2);
    drawLight(c,long2);
     drawLight(e,long2);
     drawLight(f,long2);
       drawLight(g,long2);
    drawLight(h,long2);
     drawLight(l,long2);
     drawLight(j,long2);
}
keypressed();
//if(mousePressed){
  // for(int i = 0; i < 30; i++){
   //  moon[i].display();
 //  }
//}
 //intate();

   
  for(int i = 0; i < 30; i++){
    
  star[i].drawStar();
  star[i].update();
//  star[i].init();
//  star[i].checkMouse();
  

}
}

     
void drawLight(PVector lightPos,float lon){
  loadPixels();
  float distance;
  int c;
  for(int i = 0; i < height; i++){
    for(int j = 0; j < width; j++){
      distance = dist(i, j, lightPos.y, lightPos.x);
      distance =lon/ distance;
      if(distance > 1){
        c = pixels[i * width + j];
        pixels[i * width + j] = color(distance + red(c), distance + green(c), blue(c), 200);
      }
    }
  }
  updatePixels();
}
class Star{
  float xOriginal;
  float  yOriginal;
  float r;
  float size;
  float rotateSpeed= random(60);
  float  x ,y, xSpeed, ySpeed, yHeight, isReached,deg,force;
  
  Star(float tempX, float tempY, float tempR, float tempSize){
    xOriginal = tempX;
    yOriginal = tempY;
    r = tempR;
    size = tempSize;
    rotateSpeed = random(60);
    init();
  }
    void init(){
    x = xOriginal;
    y = yOriginal;
    xSpeed = random(30)-20;
    ySpeed = random(15);
    yHeight = random(500);
    isReached = 0;
    deg = 0;
    force = 0;
  }
    void drawStar(){
    deg += rotateSpeed;
    noStroke();
    fill(#ffda2b);
      if(va==0){
    beginShape();
    for(int i = 0; i < 360; i += 72){
      vertex(x + r * cos(radians(i + deg)), y + r * sin(radians(i + deg)));
      vertex(x + r * cos(radians(i + deg + 36)) * size, y + r * sin(radians(i + deg + 36)) * size);
      vertex(x + r * cos(radians(i + deg + 72)), y + r * sin(radians(i + deg + 72)));
    }
    endShape();
  }
    else{
    fill(#ffda2b,50);
      ellipse(x,y,100,100);
    }
    }

  void update(){
   checkMouse();
    if(isReached == 0){
      x += (y + yHeight - yOriginal) / yHeight * xSpeed;
      y -= (y + yHeight - yOriginal) / yHeight * ySpeed + force;
      if(y < yOriginal - yHeight * 0.5){
        isReached = 1;
        y += ySpeed;
      }
      drawStar();
    }
    else{
      x += (y + yHeight - yOriginal) / yHeight * xSpeed;
      y += (y + yHeight - yOriginal) / yHeight * ySpeed - force;
      if((y < 0) || (y > height) || (x < 0) || (x > width)){
        init();
      }
      else{
        drawStar();
      }
    }
  }
 void checkMouse(){
  if(force > 0){
     force -= 4;
    }
   if(dist(x, y, mouseX, mouseY) < r * 1.5){
     force += 40;
    }
 }
}
void keypressed(){
  if((key=='r')&&(va==0))
  va=1;
  else
  va=0;
}
class Moon{
  float xx1;
  float yy1;
  float rr1;
  Moon(float x, float y, float r){
    xx1=x;
    yy1=y;
    rr1=r;
  }
  void display(){
    fill(#ffda2b,70);
    ellipse(xx1,yy1,rr1,rr1/5);
        ellipse(xx1,yy1,rr1/5,rr1);
  }
}
void lone() {
 if((mouseX<100)&&(mouseX>0)&&(mouseY>0)&&(mouseY<100)){
lia2=false;
lia=true;
lia3=false;
 }
 }
 void lone2() {
 if((mouseX<width/2+100)&&(mouseX>width/2-100)&&(mouseY>0)&&(mouseY<100)){
lia3=false;
lia=false;
lia2=true;
 }
 }
  void lone3() {
 if((mouseX<width)&&(mouseX>width-100)&&(mouseY>0)&&(mouseY<100)){
lia2=false;
lia=false;
lia3=true;
 }
 }
 void keyPressed(){
if(key=='s')
save("sketch"+year()+"-"+month()+"_"+day()+"_"+hour()+"_"+minute()+"_"+second());
}
