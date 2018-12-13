
size(600, 256);
float blueX, blueY, red, green,blue;
loadPixels();
for(int x=0; x< width; x++){
  for(int y=0; y< height; y++){
  int loc= x+y*width;
  
  blueX=map(x+y,0,width,250,50);
  blueY=map(y,0,height,150,0);
blue=blueY;


red=map(x,0,width,0,250);
green=map(y,0,height,0,250);
  

pixels[loc]=color(red,green,blue);
  }
}
// do something here!

updatePixels();