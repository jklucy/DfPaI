import peasy.*;

Table table;
PeasyCam cam;
float moonRadius = 1737.1; // in km


FloatList lats;
FloatList lons;
FloatList dias;

void setup() {
  lats = new FloatList();
   lons = new FloatList();
    dias = new FloatList();
  size(640, 640, P3D);
  stroke(255);
  noFill();
table = loadTable("moon_crater_coords.csv", "header");
  cam = new PeasyCam(this, 2000);
  
  //let's load in all our data at the start into a series of FloatLists
  
  for (int i = 0 ; i < table.getRowCount(); i++) {
  
  lats.append(table.getFloat(i, "lat"));
  lons.append(table.getFloat(i, "lon"));
  dias.append(table.getFloat(i, "diameter"));
}

}
//Positive latitude is above the equator (N), and negative latitude is below the equator (S).
//Positive longitude is east, while negative longitude is west.


//values of latitude are between -90 and 90 degrees
// values of longitude are between 180 and -180
void draw() {
    //translate(0,0,-mouseY);
    stroke(255);
  background(0);
  for(int j=0; j< table.getRowCount(); j++){
    pushMatrix();
       //translate(moonRadius,0); 
       

   rotateY(radians(lats.get(j)));
    rotateZ(radians(lons.get(j)));
 
  //rotateZ(HALF_PI);
  translate(moonRadius,0); 
  //printing to check the values are coming in correctly
//  println("lat " + j +" is " + lats.get(j));
  //println("lon " + j +" is " + lons.get(j));
  //box(25);
  rotateY(HALF_PI);
  ellipse(0,0,dias.get(j),dias.get(j));
  popMatrix(); 
  }

stroke(255,50,50,150);

//SPHERE ALLOWS ME TO SEE THE POSITION OF POINTS ON THE SURFACE EASIER
sphere(moonRadius);
}


PVector getCartesian(float lat, float lon, float radius) {
  float z = cos(lon) * cos(lat) * radius;
  float y = sin(lon) * cos(lat) * radius;
  float x = sin(lat) * moonRadius;
  return new PVector(x, y, z);
}
