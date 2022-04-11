//Instantiating the arrayList which holds arrays of ints
//Each array is 1x3 and holds the x,y coordinates and stroke id for each pixel drawn
ArrayList<double[]> points = new ArrayList<double[]>();
int strokeID = 1;
Result curr=null;
class cloud {
  String name;
  ArrayList<double[]> cloud = new ArrayList<double[]>();
  int sub;
  String gesture;
  public cloud(String n, ArrayList<double[]> unis, int num) {
    name = n;
    sub = num;
    gesture = name.substring(0,name.length()-2);
    for(int i = 0; i < unis.size(); i++)
      cloud.add(unis.get(i));
  }
}
ArrayList<cloud> templates = new ArrayList<cloud>();

//Function called at the start of the progra, creates the canvas of size 1280x720
void setup(){
  size(1280,720);
}

//Draw is called each time the screen is refreshed, the default framerate is 60fps
//And therefore, the draw funtion is called 60 times per second
void draw(){
  //Sets the background of the window / canvas to white
  background(255);
  //Calls the draw button function creating a button that clears the canvas
  drawButton(10, 10, 80, 60, "Clear");
  drawButton(1140, 10, 130, 60, "Recognize");
  String recog = "";
  if(curr!=null)
    recog="Shape Drawn: " + curr.res.name + " Accuracy: " + curr.score;
  else
    recog = "Shape Drawn: ";  
  drawButton(10,660,1260,60,recog);
  //Changes the color being drawn to green
  fill(0,255,0);
  //Loop that goes through the arrayList of pixels drawing a circle with a 1 pixel
  //Radius at each point
  for(int i = 0; i < points.size(); i++){
    strokeWeight(0);
    //Circle is called passing in the x and y coordinates drawing a circle of radius
    //1 at the location
    circle((float)points.get(i)[0],(float)points.get(i)[1], 1.0);
  }
}

//Whenever the mouse is pressed this function is called
void mousePressed(){ 
   //If statement check if the coordinates of the mouse were over the clear button 
   //When pressed
   if(mouseX >10 && mouseX < 90 && mouseY > 10 && mouseY < 70){
     //If it was over the button it empties the arrayList
     points.removeAll(points);
     strokeID = 0;
     curr=null;
   }
   else if (mouseX > 1140 && mouseX < 1270 && mouseY > 10 && mouseY < 70){
     curr = pRecognizer(); //<>//
     strokeID = 0;
   }
   else{
   //If it wasn't over the button then a new array of size 2 is created, within it
   //The x and y coordinates are stored of the mouse are stored and this array
   //Is added to the arrayLsit
   //strokeID++;
   double[] a = new double[3];
   a[0] = mouseX;
   a[1] = mouseY;
   a[2] = strokeID;
   System.out.println(strokeID);
   points.add(a);
   }
}

void mouseReleased() { 
  strokeID++;
}

//This function is called when the mouse is dragged, it has the same functionality
//As mouse clicked, except it doesn't clear the canvas / arrayList if the mouse is
//Dragged over the mouse button, it only clears the canvas if the button is clicked
void mouseDragged(){
   if(!(mouseX >10 && mouseX < 90 && mouseY > 10 && mouseY < 70)){
   double[] a = new double[3];
   a[0] = mouseX;
   a[1] = mouseY;
   a[2] = strokeID;
   points.add(a);  
   }
}

//This function is usedto draw a button to the window, the x and y coordinates are
//Passed in as well as the width, weight, and text of the button
void drawButton(int x, int y, int wid, int hei, String text) {
  //Sets the color of the button
  fill(color(142, 201, 237));
  //Sets the weight for the border of the button
  strokeWeight(5);
  stroke(0);
  //The function draws a rectangle with the x, and y coordinates, as well as the
  //Width and height
  rect(x, y, wid, hei, 10);
  //This sets the mode for the text to be centered on the coordinates
  textAlign(CENTER, CENTER);
  //Sets the text size 
  textSize(26);
  //Sets the color of the text to black
  fill(0);
  //Draws the text to the window with the passed in text, x, y, width and height
  text(text, x + (wid / 2), y + (hei / 2));
}
