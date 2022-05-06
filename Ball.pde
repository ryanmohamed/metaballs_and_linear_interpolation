class Ball
{
  
  //members
  PVector pos; 
  PVector speed;
  int diameter;
  int r;
  
  Ball(int x, int y){
    pos = new PVector(x, y);
    speed = PVector.random2D(); //get random unit vector
    speed.mult(random(5, 30));
    diameter = floor(random(50, maxSize));
    r = diameter/2;
  }
  
  void edges(){
    if(pos.x + speed.x < r || pos.x + speed.x > width-r)
      speed.x *= -1;
    if(pos.y + speed.y < r || pos.y + speed.y > height-r)
      speed.y *= -1;
  }
  
  void update(){
    pos.add(speed);
  }
  
  void render(){
    pushMatrix(); //for future manipulation
      translate(pos.x, pos.y);
      noStroke();
      fill(200, 120, 40);
      circle(0, 0, diameter);
    popMatrix();
  }
  
}
