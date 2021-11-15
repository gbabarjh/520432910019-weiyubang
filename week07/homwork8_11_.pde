
class DNA {
  char[] genes;
 float fitness;
  DNA(int num) {
    genes=new char[num];
    for (int i = 0; i < genes.length; i++) {
      genes[i] = (char)random(32,128);
    }
  }
  String getPhrase(){
    return new String(genes);
  }
   void calcFitness(String target){
      int score=0;
      for(int i=0;i<genes.length;i++){
        if(genes[i]==target.charAt(i)) score++;
      }
      fitness=float(score)/target.length();
   }
     DNA crossover(DNA partner) {
    DNA child = new DNA (genes.length);
    int crossover = int(random(genes.length));
    for (int i = 0; i < genes.length; i++) {
      if (i > crossover) child.genes[i] = genes[i];
      else               child.genes[i] = partner.genes[i];
    }
    return child;
}
 void mutate(float mutationRate) {
    for (int i = 0; i < genes.length; i++) {
      if (random(1) < mutationRate) {
         genes[i] = (char)random(32,128);
      }
    }
  }
}
float mutationRate=0.01;
int totalPoulation=150;
DNA[] population;
ArrayList<DNA> matingPool;
String target="processing";
PFont f;
int len=10;
void setup(){
  
  size(800,200);
   population=new DNA[totalPoulation];
  for(int i=0;i<population.length; i++){
    population[i]=new DNA(target.length());
  }
  f=createFont("Courier",40,true);
}
void draw(){
   for(int i=0;i<population.length; i++){
     population[i].calcFitness(target);
   }
   ArrayList<DNA>matingPool= new ArrayList<DNA>();
  for(int i=0;i<population.length; i++){
    int n=int(population[i].fitness*100);
    for(int j=0;j<n;j++){
      matingPool.add(population[i]);
    }
  }
    for(int i=0;i<population.length; i++){
      int a=int(random(matingPool.size()));
         int b=int(random(matingPool.size()));
         DNA partnerA =matingPool.get(a);
           DNA partnerB =matingPool.get(b);
           DNA child=partnerA.crossover(partnerB);
           child.mutate(mutationRate);
           population[i]=child;
}
fill(0,10);
rect(0,0,800,200);
fill(random(0,255),random(0,255),random(0,255));
String everything="";
 for(int i=0;i<population.length; i++){
   everything+=population[i].getPhrase()+"   ";
 }
 if(len<150)
 len+=1;

  textAlign(CENTER);
 textFont(f,len);
// textAlign(CENTER);
 text(everything,0,0,width,height);

}
