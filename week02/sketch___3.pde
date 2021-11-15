
 
Yuan d[][];
int n=100,m=100;
 
void setup() {
  size(20,40);
  d = new Yuan[n][m];
  for(int i = 0; i<n; i++) {
    for(int j = 0; j<m; j++) {
      d[i][j] = new Yuan((i+1)*100,(j+1)*100,10,(i+2)+(j+1));
    }
  }
  fullScreen();
  frameRate(80);
}
int value=1,a=0,b=0;
void mouseClicked() {
  if(value == 0) {
    value = 1;
  }else {
    value=0;
  }
}
void draw() {
  background(5);
  for(int j =a;j<n;j++) {
    for(int i = b;i<m;i++) { 
      d[i][j].chang();
      d[i][j].update();
      if(value == 0)
      d[i][j].display();
      else 
      d[i][j].display2();
   
    }
  }
}
class Yuan {
  float x,y;
  float r,a;//banjing  secai bianhua 
  Yuan(float x, float y, float r,float a) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.a = a;
  }
  void chang(){
    this.a +=0.1;
    this.r +=0.3;
 if(r>170)
    {r=10;
    }
  }  
  void update()
  {
    x+=random(-4,4);
    y+=random(-4,4);
    r+=random(-4,4);
  }
  void display() {
    noStroke();
    fill(150+120*sin(a), 40 + 40 * sin(a), 255 + 255*cos(a),150+105*sin(a));
    circle(x,y,r);
  }
  void display2() {
    stroke(#F5DE2F);
    strokeWeight(random(0,4));
    fill(252+3*sin(a),239 +16 * tan(a), 112 + 143*cos(a),150+105*sin(a));
    circle(x,y,r);
  }
}
