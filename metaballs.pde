Ball balls[];
int numBalls = 4;
int maxSize = 200;
int maxRadius = maxSize / 2;

void initBalls(){
  for(int i = 0; i < numBalls; i++){
    int x = (int) random(maxRadius, width-maxRadius);
    int y = (int) random(maxRadius, height-maxRadius);
    balls[i] = new Ball(x, y);
  }
}

void settings(){
  fullScreen(2);
}

void setup(){
  balls = new Ball[numBalls];
  initBalls();
  frameRate(90);
}

void draw(){
  
  loadPixels();
  colorMode(HSB);
  for(int x = 0; x < width; x++){
    for(int y = 0; y < height; y++){
      
      int index = x + y * width;
      float dis;
      int clr = 0;
      
      
      for(int i = 0; i < balls.length; i++){
        dis = (int) dist(x, y, balls[i].pos.x, balls[i].pos.y);
        if(dis == 0) println(dis);
        clr += 100 * balls[i].r / dis; //color should increase for each nearby ball
      }
      
      clr = constrain(clr, 0, 255);
      pixels[index] = color(clr, 255, 255);
      
    }
  }
  updatePixels();
  
  for(Ball b : balls){
    b.edges();
    b.update();
  }
  
}

void keyPressed(){
  for(int i = 0; i < numBalls; i++){
    balls[i] = new Ball((int) random(0, width), (int) random(0, height));
  }
}
