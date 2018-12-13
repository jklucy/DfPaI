Table table;

FloatList lats;
FloatList lons;
StringList names;
Particle part;
class Particle{
  float x, y;
  int xPos, yPos, xPosNext, yPosNext;
  float percent;
 Particle(){
 percent=0;
 }
  void update(){
    percent+=0.2;

    
    
    
    
    if(percent<33){
      float xPos=map(lons.get(0),-0.02,0.004,100,width-100);
    float yPos=map(lats.get(0),51.542,51.50,100,height-100);
    float xPosNext = map(lons.get(1),-0.02,0.004,100,width-100);
    float yPosNext = map(lats.get(1),51.542,51.50,100,height-100);
    x=lerp(xPos,xPosNext,map(percent,0,33,0,1));
     y=lerp(yPos,yPosNext,map(percent,0,33,0,1));
    } 
    
    else if(percent>=33 && percent<66){
      float xPos=map(lons.get(1),-0.02,0.004,100,width-100);
    float yPos=map(lats.get(1),51.542,51.50,100,width-100);
    float xPosNext = map(lons.get(2),-0.02,0.004,100,width-100);
    float yPosNext = map(lats.get(2),51.542,51.50,100,width-100);
    x=lerp(xPos,xPosNext,map(percent,33,66,0,1));
     y=lerp(yPos,yPosNext,map(percent,33,66,0,1));
    }
    
    else if(percent>=66 && percent<100){
      float xPos=map(lons.get(2),-0.02,0.004,100,width-100);
    float yPos=map(lats.get(2),51.542,51.50,100,width-100);
    float xPosNext = map(lons.get(3),-0.02,0.004,100,width-100);
    float yPosNext = map(lats.get(3),51.542,51.50,100,width-100);
    x=lerp(xPos,xPosNext,map(percent,66,100,0,1));
     y=lerp(yPos,yPosNext,map(percent,66,100,0,1));
    }
      
  if(percent>=100){
   percent=0; 
  }
  
  }
  void draw(){
    fill(255,0,0,160);
    ellipse(x,y,10,10);
  }
}
void setup() {
  lats = new FloatList();
   lons = new FloatList();
    names = new StringList();
  size(640, 640);
  stroke(255);
  noFill();
part = new Particle();
table = loadTable("tube_stops.csv", "header");
  
  
  //let's load in all our data at the start into a series of FloatLists
  
  for (int i = 0 ; i < table.getRowCount(); i++) {
  
  lats.append(table.getFloat(i, "lat"));
  lons.append(table.getFloat(i, "lon"));
  names.append(table.getString(i, "name"));
}


}
//Positive latitude is above the equator (N), and negative latitude is below the equator (S).
//Positive longitude is east, while negative longitude is west.



void draw() {
    //translate(0,0,-mouseY);
    stroke(255);
  background(0);
 fill(255,0,0);
  for(int j=0; j< table.getRowCount(); j++){
     fill(255,0,0,100);
    float xPos=map(lons.get(j),-0.02,0.004,100,width-100);
    float yPos=map(lats.get(j),51.542,51.50,100,width-100);
    
    
    float xPosNext = map(lons.get(constrain(j+1,0,3)),-0.02,0.004,100,width-100);
    float yPosNext = map(lats.get(constrain(j+1,0,3)),51.542,51.50,100,height-100);
    
    
    if(j==0){
    println("canary wharf xPos is "+ xPos);
    println("canary wharf yPos is " + yPos);
    }
    if(dist(part.x,part.y,xPos,yPos)<20){
      
  fill(255);
}
    rectMode(CENTER);
    rect(xPos,yPos,20,20);
    line(xPos,yPos,xPosNext,yPosNext);
    fill(255);
    text(names.get(j),xPos+-10,yPos-19);
  }

part.update();
part.draw();
}
