class Slider {
  // position and size variables
  float xpos;
  float ypos;
  int sliderWidth;
  int sliderHeight;
  color sliderColour;
  int distFromCentre;
  
  // movement variables
  boolean dragging = false;
  float offsetX, offsetY; 
  
  // Constructor - takes a colour and an x, y coord for intital placement
  Slider(color colour, float x, float y){
    xpos = x;
    ypos = y;
    sliderWidth = 50;
    sliderHeight = 50;
    sliderColour = colour;
    offsetX = 0;
    offsetY = 0;
    distFromCentre = 0;
  }
  
  void display(){
    fill(sliderColour);
    ellipse(xpos, ypos, sliderWidth, sliderHeight);
    // display the text beside the circle, offsetting its position by 25px
    text(distFromCentre, xpos+25, ypos+25);
  }
  
  // Function which checks whether a slider has been clicked on
  void clicked(int mx, int my) {
    // Check coords to see if the mouse position is on top of the slider
    
    // For an ellipse the x and y coords are in the centre of the shape, so half the width and height 
    // have to be subtracted from the coords to allow the function to correctly determine if it is being clicked
    float xPosCorrection = xpos - (sliderWidth / 2);
    float yPosCorrection = ypos - (sliderHeight / 2);
    
    if (mx > xPosCorrection && mx < xpos + sliderWidth && my > yPosCorrection && my < ypos + sliderHeight) {
      // If so, set dragging to true and keep track of relative location of 
      // original mouse click and the slider position
      dragging = true;
      offsetX = xpos-mx;
      offsetY = ypos-my;
    }
  }
  
  // Stop dragging
  void stopDragging() {
    dragging = false;
  }
  
  // Function which moves a slider if it is being dragged. It changes the xpos and 
  // ypos variables of the slider with the mx and my parameters (mouseX and mouseY),
  // plus the offset value (the relative position of the mouse pointer on the slider
  void drag(int mx, int my) {
    if (dragging) {
      xpos = mx + offsetX;
      ypos = my + offsetY;
    }
  }
  
  // Getter for sliders X coordinate
  float getXCoord(){
    return xpos;
  }
  
  // Getter for sliders Y coordinate
  float getYCoord(){
    return ypos;
  }
    
  // Setter for the distFromCentre value
  void setDistFromCentre (float distance){
    float maxDist = dist(0, 0, width/2, height/2);
    distFromCentre = int(map(distance, 0, maxDist, 0, 100));
  }
    
}
