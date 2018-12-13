PImage hand;

void setup(){
size(500,500);
hand = loadImage("hand.jpg");
 noStroke();
 for(int x=0; x<25; x++){
 for(int y=0; y<25; y++){  
   color c= hand.get(x*20,y*20);
  fill(c);
   rect(x*20,y*20,20,20);
   
 }
 }
  saveFrame("hand-pixProcessing");
}

void draw(){
 exit();
}
