float toff=0.0;
void setup(){
  size(400,400);
}


void draw(){
  loadPixels();
  float xoff = 0.0;
  for (int x = 0; x < width; x++) {
    float yoff = 0.0;
    for (int y = 0; y < height; y++) {
      //float bright = random(255);
      float bright = map(noise(xoff,yoff,toff),0,1,0,255);
      pixels[x+y*width] = color(bright);
      yoff+=0.01;
    }
    xoff+=0.01;
  }
  toff+=0.001;
  updatePixels();
}

/*
float noiseVal;
float noiseScale=0.02;

void draw() {
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width/2; x++) {
      noiseDetail(3,0.5);
      noiseVal = noise((mouseX+x) * noiseScale, (mouseY+y) * noiseScale);
      stroke(noiseVal*255);
      point(x,y);
      noiseDetail(8,0.65);
      noiseVal = noise((mouseX + x + width/2) * noiseScale, 
                       (mouseY + y) * noiseScale);
      stroke(noiseVal * 255);
      point(x + width/2, y);
    }
  }
}*/