/**
 * ControlP5 ControlWindow
 * by andreas schlegel, 2012
 */

import controlP5.*;
int translateX, translateY;
ControlP5 cp5;
Slider sliderR;
Slider sliderG;
Slider sliderB;
int myColorBackground = color(0, 0, 0);

ControlWindow controlWindow;

public int sliderValueR = 40;
public int sliderValueG = 40;
public int sliderValueB = 40;

void setup() {
  size(700, 400);  

  cp5 = new ControlP5(this);



 sliderR= cp5.addSlider("sliderValueR")
     .setRange(0, 255)
     .setPosition(40, 40)
     .setSize(200, 29)
     
     ;
     
  sliderG=cp5.addSlider("sliderValueG")
     .setRange(0, 255)
     .setPosition(40, 70)
     .setSize(200, 29)
     
     ;
   sliderB=cp5.addSlider("sliderValueB")
     .setRange(0, 255)
     .setPosition(40, 100)
     .setSize(200, 29)
     
     ;
}


void draw() {
  
 
 sliderR.setPosition(translateX,translateY+10);
  sliderG.setPosition(translateX,translateY+40);
   sliderB.setPosition(translateX,translateY+70);
  background(sliderValueR,sliderValueG,sliderValueB);
  rect(translateX,translateY,200,10);
}
void mouseDragged(){
  
  //only lets you drag from the top left corner at the moment
 if(dist(mouseX,mouseY,translateX,translateY)<20){
   
    translateX=mouseX;
  translateY=mouseY;
 }
}
void myTextfield(String theValue) {
  println(theValue);
}

void myWindowTextfield(String theValue) {
  println("from controlWindow: "+theValue);
}

void keyPressed() {
  
}
