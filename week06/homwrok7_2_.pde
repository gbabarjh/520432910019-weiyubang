class Cactus {
    PVector loc;
    float r;
       PVector a= new PVector(10, 0);
    PVector ac = new PVector(0, 0);
float c1 =random(-2,2);
    float c2=random(-2,2);
    PVector vl = new PVector(c1,c2);
    float min = 20;
    boolean l=false;
    color z1=#FF0303;
    int len=40;
    Cactus(PVector loc, float r) {
        this.loc=loc;
        this.r=r;
    }
    
    void run(){
         show();
       
           update();
crush();
  mouseAttraction() ;
         crossd();
    }

    void show() {
      if(key=='r'){
        len=1000;
      }
        if(mousePressed){
         fill(255,255,0);
        noStroke();
        ellipse(loc.x, loc.y, 100,100 );
      }
         pushMatrix();
        translate(loc.x,loc.y);

      for(int i=0;i<8;i++){
         
        rotate(radians(i*45));
        stroke(z1);
        strokeWeight(3);
        line(0,0,len,0);

      }
      popMatrix();
    
        fill(255);
        noStroke();
        ellipse(loc.x, loc.y, r, r);
    }
    
    void crush(){
        for (Cactus p : cactuss) { 
          float dd = PVector.dist(loc, p.loc);

      if (dd <p.r + r) {
     z1=#FF0303;
         stroke(255, 255, 0);
                line(loc.x, loc.y, p.loc.x, p.loc.y);
        PVector li=PVector.sub(loc,p.loc);
        vl.add(li);
        vl.limit(3);
        }
        else
        z1=#03FF4C;
        }
    }
     void mouseAttraction() {
       if(mousePressed){
    PVector m = new PVector(mouseX, mouseY);
    float d = PVector.dist(m, loc);
    PVector attr = PVector.sub(m, loc);
    attr.normalize();
    attr.mult(20/d);
    vl.add(attr);
  }
     }
    void update() {
        loc.add(vl);
       
    }
    
    void crossd(){
        if(loc.x > width) loc.x = 0;
        if(loc.x < 0) loc.x = width;
        if(loc.y > height) loc.y = 0;
        if(loc.y < 0) loc.y = height;
    }
}
Cactus []cactuss=new Cactus[30];
void setup() {
  size(800, 800);
  initiateParticleSystem();
}

void initiateParticleSystem() {
  for (int  i = 0; i < cactuss.length; i ++) {
    float pxx = random(width/2-200, width/2+200);
    float pyy = random(height/2-200, height/2+200);
    PVector ploc = new PVector(pxx, pyy);
    cactuss[i] = new Cactus(ploc, 30);
   
      
  }
}
void draw() {

  fill(0, 5);
  noStroke();
  rect(0, 0, width, height);
  for (int  i = 0; i < cactuss.length; i ++) {
    cactuss[i].run();
  }
}
void mousePressed() {
  initiateParticleSystem();
}
