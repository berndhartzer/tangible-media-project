// import the TUIO library
import TUIO.*;
// declare a TuioProcessing client
TuioProcessing tuioClient;

// these are some helper variables which are used
// to create scalable graphical feedback
float cursor_size = 15;
float object_size = 60;
float table_size = 760;
float scale_factor = 1;
//PFont font;

boolean verbose = false; // print console debug messages
boolean callback = true; // updates only after callbacks




// Number of sliders on the board
int numSliders = 6;

// Avergae distance of all sliders from the centre 
float avgDistance;

// Array which holds all the sliders
Slider[] sliders = new Slider[numSliders];

void setup(){
  size(1000, 700);
  
  // Create the sliders
//  for (int i = 0; i < sliders.length; i++){
//   sliders[i] = new Slider(color(255, 0, 0), i*100, i*100);
//  }
  
  tuioClient  = new TuioProcessing(this);
  
}

void draw(){
  
  background(0, 0, 0);
  
  // Board
  fill(0);
  stroke(255);
  strokeWeight(4);
  ellipse(width/2, height/2, 650, 650);
  noStroke();

  // get the average distance of the sliders from the centre
  //avgDistance = getAverageDistances();
  
  // Map the colour values of red and green to the sliders positions
//  float maxDist = dist(0, 0, width/2, height/2);
//  float redVal = map(avgDistance, 0, maxDist, 0, 255);
//  float greenVal = map(avgDistance, 0, maxDist, 255, 0);
  
  // Centre circle - use redVal and greenVal to update the colour of the centre
  // based on the position of the sliders
  //fill(redVal, greenVal, 0);
  fill (0, 255, 0);
  ellipse(width/2, height/2, 150, 150);
  
//  if (sliders[0] != null){
//  for (int i = 0; i < sliders.length; i++){
//    sliders[i].drag(mouseX, mouseY);
//    sliders[i].display();
//  }
//  } 


float obj_size = object_size*scale_factor; 
  float cur_size = cursor_size*scale_factor;    
  ArrayList<TuioObject> tuioObjectList = tuioClient.getTuioObjectList();
  for (int i=0;i<tuioObjectList.size();i++) {
     TuioObject tobj = tuioObjectList.get(i);
     
     if (i <= numSliders){
     //stroke(0);
     //fill(0,0,0);
     //pushMatrix();
     translate(tobj.getScreenX(width),tobj.getScreenY(height));
     //rotate(tobj.getAngle());
     
     sliders[i] = new Slider(color(255, 0, 0), -obj_size/2, -obj_size/2);
     sliders[i].display(-obj_size/2, -obj_size/2);
     //rect(-obj_size/2, -obj_size/2, obj_size, obj_size);
     
     //popMatrix();
     //fill(255);
     //text(""+tobj.getSymbolID(), tobj.getScreenX(width), tobj.getScreenY(height));
     }
   }
  
  

}

// This function gets the distance of every slider from the centre of the board
// and returns the average. This is used to determine the "health" of the board
// and update the distFromCentre value of each slider
float getAverageDistances (){
  
  float totalDistances = 0;
  
  for (int i = 0; i < sliders.length; i++){
    
    if (sliders[0] != null){
    
    float distance = dist(width/2, height/2, sliders[i].getXCoord(), sliders[i].getYCoord());
    sliders[i].setDistFromCentre(distance);
    totalDistances += distance;
    }
    
  }
  
  return totalDistances / numSliders;
    
}

void mousePressed() {
  // Check each slider to see if the mouse is positioned over it
//  for (int i = 0; i < sliders.length; i++){
//    sliders[i].clicked(mouseX,mouseY);
//  }
}

void mouseReleased() {
  // Change each sliders dragging = false
//  for (int i = 0; i < sliders.length; i++){
//    sliders[i].stopDragging();
//  }
}

// --------------------------------------------------------------
// called at the end of each TUIO frame
void refresh(TuioTime frameTime) {
  if (verbose) println("frame #"+frameTime.getFrameID()+" ("+frameTime.getTotalMilliseconds()+")");
  if (callback) redraw();
}
