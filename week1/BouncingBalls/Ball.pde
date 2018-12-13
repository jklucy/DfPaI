class Ball { 
  float radius;
  float x, y;
  PVector pos;
  PVector vel;
  int r, g, b;





  Ball( float x, float y, float _radius) {
    pos = new PVector(x, y);
    vel = new PVector(random(-1, 1), random(-1, 1));
    radius = _radius;
    r= int (random(255));
    g = int (random(255));
    b = int (random(255));
  }

  void update() {

    pos.add (vel);


    //checking for walls
    if (pos.x < radius || pos.x > width - radius) {
      vel.x *= -1;
    }
    if (pos.y < radius || pos.y > height - radius) {
      vel.y *= -1;
    }
  }
  
  
void moveToMouse(){
  if(pos.x<mouseX){
    pos.x+=1;
  }
  if(pos.x>mouseX){
    pos.x-=1;
  }
 if(pos.y<mouseY){
    pos.y+=1;
  }
  if(pos.y>mouseY){
    pos.y-=1;
  }
}
 //double loop
  
  void handleCollisions(Ball[] balls) {
    for (Ball b : balls) {
      if (b != this) {
        if (pos.dist(b.pos) < radius + b.radius)
        {
          PVector reaction = PVector.sub(pos, b.pos);
          float len = vel.mag();
          reaction.setMag(len);
          vel.x = reaction.x;
          vel.y = reaction.y;
        }
      }
    }
  }

  void draw() {
    ellipse(pos.x, pos.y, radius*2, radius*2);
    fill(r, g, b);
  }
}
