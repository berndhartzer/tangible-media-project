// Number of sliders on the board
int numSliders = 6;

// Avergae distance of all sliders from the centre 
float avgDistance;

// Array which holds all the sliders
Slider[] sliders = new Slider[numSliders];

void setup(){
  size(500, 500);
  
  // Create the sliders
  for (int i = 0; i < sliders.length; i++){
   sliders[i] = new Slider(color(255, 0, 0), i*100, i*100);
  }
  
}

void draw(){
  background(255, 205, 0);
  
  // Board
  fill(5);
  ellipse(width/2, height/2, 475, 475);
  
  // get the average distance of the sliders from the centre
  avgDistance = getAverageDistances();
  
  // Map the colour values of red and green to the sliders positions
  float maxDist = dist(0, 0, width/2, height/2);
  float redVal = map(avgDistance, 0, maxDist, 0, 255);
  float greenVal = map(avgDistance, 0, maxDist, 255, 0);
  
  // Centre circle - use redVal and greenVal to update the colour of the centre
  // based on the position of the sliders
  fill(redVal, greenVal, 0);
  ellipse(width/2, height/2, width/5, height/5);
  
  for (int i = 0; i < sliders.length; i++){
    sliders[i].drag(mouseX, mouseY);
    sliders[i].display();
  }

}

// This function gets the distance of every slider from the centre of the board
// and returns the average. This is used to determine the "health" of the board
// and update the distFromCentre value of each slider
float getAverageDistances (){
  
  float totalDistances = 0;
  
  for (int i = 0; i < sliders.length; i++){
    float distance = dist(width/2, height/2, sliders[i].getXCoord(), sliders[i].getYCoord());
    sliders[i].setDistFromCentre(distance);
    totalDistances += distance;
  }
  
  return totalDistances / numSliders;
    
}

void mousePressed() {
  // Check each slider to see if the mouse is positioned over it
  for (int i = 0; i < sliders.length; i++){
    sliders[i].clicked(mouseX,mouseY);
  }
}

void mouseReleased() {
  // Change each sliders dragging = false
  for (int i = 0; i < sliders.length; i++){
    sliders[i].stopDragging();
  }
}
