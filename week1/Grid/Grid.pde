
void setup() {
  size(600, 600);
  pixelDensity(2);
}

void draw() {
  background(0);
  translate(width/20,height/20);
for(int x=0; x<width; x+=width/10){
  for(int y=0; y<height; y+=height/10){
smiley(x,y);
}
}
}

void smiley(int x, int y){
  pushMatrix();
  translate(x,y);
  rotate(radians(x+y+frameCount));
  noStroke();
  fill(255);
 ellipse(0,0,50,50); 
 stroke(0);
 fill(255,0,0);
 ellipse(-10,-5,5,5); 
   ellipse(+10,-5,5,5); 
   noFill();
   arc(0,0,20,20,radians(45),radians(135),OPEN);
popMatrix();
}