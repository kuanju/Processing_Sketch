import java.util.Random;

Random generator;
Brush br;

void setup(){
  size(400,400);
  generator = new Random();
  br = new Brush();
}

void draw(){
  
  if(mousePressed){
    br.paint(mouseX,mouseY);
  }
}

class Brush{
  int x;
  int y;
  Brush(){
  }
  
  void paint(int _x, int _y){
    noStroke();
    x = _x;
    y = _y;
    ellipse(x,y,5,5);
    for(int i = 0; i <20; i++){
      float num1 = (float)generator.nextGaussian();
      float num2 = (float)generator.nextGaussian();
      float num3 = (float)generator.nextGaussian();
      
      float sd = 10;
      colorMode(HSB, 100);
      fill(num3*sd+50,100,100);

      ellipse(x+num1*sd, y+num2*sd, random(3,5),random(3,5));  
    }
  }
}