//Instantiating the arrayList which holds arrays of ints //<>// //<>// //<>// //<>//
//Each array is 1x3 and holds the x,y coordinates and stroke id for each pixel drawn
ArrayList<double[]> points = new ArrayList<double[]>();
String[] gestures = {"T", "N", "D", "P", "X", "H", "I", "exclamation_point", "line", "five_point_star", "null", "arrowhead", "pitchfork", "six_point_star", "asterisk", "half_note" };
int strokeID = 1;
class cloud {
  String name;
  ArrayList<double[]> cloud = new ArrayList<double[]>();
  int sub;
  String gesture;
  public cloud(String n, ArrayList<double[]> unis, int num) {
    name = n;
    sub = num;
    if (name.length() > 17)
      gesture = name.substring(name.indexOf("slow-")+5,name.length()-3);
    for(int i = 0; i < unis.size(); i++)
      cloud.add(unis.get(i));
  }
}

Result curr = null;
ArrayList<cloud> templates = new ArrayList<cloud>();
ArrayList<cloud> templates1 = new ArrayList<cloud>(); //read in

//Function called at the start of the progra, creates the canvas of size 1280x720
void setup(){
  size(700,700);
  ArrayList<double[]> temps = new ArrayList<double[]>();
temps.add(new double[] {30,7,1}); temps.add(new double[] {103,7,1});temps.add(new double[] {66,7,2});temps.add(new double[] {66,87,2});
templates.add(new cloud("T", temps, 0));
temps.clear();

temps.add(new double[] {177,92,1});temps.add(new double[] {177,2,1});temps.add(new double[] {182,1,2});temps.add(new double[] {246,95,2});temps.add(new double[] {247,87,3});temps.add(new double[] {247,1,3});
templates.add(new cloud("N", temps, 0));
temps.clear();

temps.add(new double[] {345,9,1});temps.add(new double[] {345,87,1});temps.add(new double[] {351,8,2});temps.add(new double[] {363,8,2});temps.add(new double[] {372,9,2});temps.add(new double[] {380,11,2});
temps.add(new double[] {386,14,2});temps.add(new double[] {391,17,2});temps.add(new double[] {394,22,2});temps.add(new double[] {397,28,2});temps.add(new double[] {399,34,2});temps.add(new double[] {400,42,2});
temps.add(new double[] {400,50,2});temps.add(new double[] {400,56,2});temps.add(new double[] {399,61,2});temps.add(new double[] {397,66,2});temps.add(new double[] {394,70,2});temps.add(new double[] {391,74,2});
temps.add(new double[] {386,78,2});temps.add(new double[] {382,81,2});temps.add(new double[] {377,83,2});temps.add(new double[] {372,85,2});temps.add(new double[] {367,86,2});temps.add(new double[] {360,87,2});
temps.add(new double[] {355,87,2});temps.add(new double[] {349,86,2});
templates.add(new cloud("D", temps, 0));
temps.clear();

temps.add(new double[] {507,8,1});temps.add(new double[] {507,87,1});temps.add(new double[] {513,7,2});temps.add(new double[] {528,7,2});temps.add(new double[] {537,8,2});temps.add(new double[] {544,10,2});
temps.add(new double[] {550,12,2});temps.add(new double[] {555,15,2});temps.add(new double[] {558,18,2});temps.add(new double[] {560,22,2});temps.add(new double[] {561,27,2});temps.add(new double[] {562,33,2});
temps.add(new double[] {561,37,2});temps.add(new double[] {559,42,2});temps.add(new double[] {556,45,2});temps.add(new double[] {550,48,2});temps.add(new double[] {544,51,2});temps.add(new double[] {538,53,2});
temps.add(new double[] {532,54,2});temps.add(new double[] {525,55,2});temps.add(new double[] {519,55,2});temps.add(new double[] {513,55,2});temps.add(new double[] {510,55,2});
templates.add(new cloud("P", temps, 0));
temps.clear();

temps.add(new double[] {30,146,1});temps.add(new double[] {106,222,1});temps.add(new double[] {30,225,2});temps.add(new double[] {106,146,2});
templates.add(new cloud("X", temps, 0));
temps.clear();

temps.add(new double[] {188,137,1});temps.add(new double[] {188,225,1});temps.add(new double[] {188,180,2});temps.add(new double[] {241,180,2});temps.add(new double[] {241,137,3});temps.add(new double[] {241,225,3});
templates.add(new cloud("H", temps, 0));
temps.clear();

temps.add(new double[] {371,149,1});temps.add(new double[] {371,221,1});temps.add(new double[] {341,149,2});temps.add(new double[] {401,149,2});temps.add(new double[] {341,221,3});temps.add(new double[] {401,221,3});
templates.add(new cloud("I", temps, 0));
temps.clear();

temps.add(new double[] {526,142,1});temps.add(new double[] {526,204,1});temps.add(new double[] {526,221,2});
templates.add(new cloud("exclamation_point", temps, 0));
temps.clear();

temps.add(new double[] {12,347,1});temps.add(new double[] {119,347,1});
templates.add(new cloud("line", temps, 0));
temps.clear();

temps.add(new double[] {177,396,1});temps.add(new double[] {223,299,1});temps.add(new double[] {262,396,1});temps.add(new double[] {168,332,1});temps.add(new double[] {278,332,1});temps.add(new double[] {184,397,1});
templates.add(new cloud("five_point_star", temps, 0));
temps.clear();

temps.add(new double[] {382,310,1});temps.add(new double[] {377,308,1});temps.add(new double[] {373,307,1});temps.add(new double[] {366,307,1});temps.add(new double[] {360,310,1});temps.add(new double[] {356,313,1});
temps.add(new double[] {353,316,1});temps.add(new double[] {349,321,1});temps.add(new double[] {347,326,1});temps.add(new double[] {344,331,1});temps.add(new double[] {342,337,1});temps.add(new double[] {341,343,1});
temps.add(new double[] {341,350,1});temps.add(new double[] {341,358,1});temps.add(new double[] {342,362,1});temps.add(new double[] {344,366,1});temps.add(new double[] {347,370,1});temps.add(new double[] {351,374,1});
temps.add(new double[] {356,379,1});temps.add(new double[] {361,382,1});temps.add(new double[] {368,385,1});temps.add(new double[] {374,387,1});temps.add(new double[] {381,387,1});temps.add(new double[] {390,387,1});
temps.add(new double[] {397,385,1});temps.add(new double[] {404,382,1});temps.add(new double[] {408,378,1});temps.add(new double[] {412,373,1});temps.add(new double[] {416,367,1});temps.add(new double[] {418,361,1});
temps.add(new double[] {419,353,1});temps.add(new double[] {418,346,1});temps.add(new double[] {417,341,1});temps.add(new double[] {416,336,1});temps.add(new double[] {413,331,1});temps.add(new double[] {410,326,1});
temps.add(new double[] {404,320,1});temps.add(new double[] {400,317,1});temps.add(new double[] {393,313,1});temps.add(new double[] {392,312,1});temps.add(new double[] {418,309,2});temps.add(new double[] {337,390,2});
templates.add(new cloud("null", temps, 0));
temps.clear();

temps.add(new double[] {506,349,1});temps.add(new double[] {574,349,1});temps.add(new double[] {525,306,2});temps.add(new double[] {584,349,2});temps.add(new double[] {525,388,2});
templates.add(new cloud("arrowhead", temps, 0));
temps.clear();

temps.add(new double[] {38,470,1});temps.add(new double[] {36,476,1});temps.add(new double[] {36,482,1});temps.add(new double[] {37,489,1});temps.add(new double[] {39,496,1});temps.add(new double[] {42,500,1});
temps.add(new double[] {46,503,1});temps.add(new double[] {50,507,1});temps.add(new double[] {56,509,1});temps.add(new double[] {63,509,1});temps.add(new double[] {70,508,1});temps.add(new double[] {75,506,1});
temps.add(new double[] {79,503,1});temps.add(new double[] {82,499,1});temps.add(new double[] {85,493,1});temps.add(new double[] {87,487,1});temps.add(new double[] {88,480,1});temps.add(new double[] {88,474,1});
temps.add(new double[] {87,468,1});temps.add(new double[] {62,464,2});temps.add(new double[] {62,571,2});
templates.add(new cloud("pitchfork", temps, 0));
temps.clear();

temps.add(new double[] {177,554,1});temps.add(new double[] {223,476,1});temps.add(new double[] {268,554,1});temps.add(new double[] {183,554,1});temps.add(new double[] {177,490,2});temps.add(new double[] {223,568,2});
temps.add(new double[] {268,490,2});temps.add(new double[] {183,490,2});
templates.add(new cloud("six_point_star", temps, 0));
temps.clear();

temps.add(new double[] {325,499,1});temps.add(new double[] {417,557,1});temps.add(new double[] {417,499,2});temps.add(new double[] {325,557,2});temps.add(new double[] {371,486,3});temps.add(new double[] {371,571,3});
templates.add(new cloud("asterisk", temps, 0));
temps.clear();

temps.add(new double[] {546,465,1});temps.add(new double[] {546,531,1});temps.add(new double[] {540,530,2});temps.add(new double[] {536,529,2});temps.add(new double[] {533,528,2});temps.add(new double[] {529,529,2});
temps.add(new double[] {524,530,2});temps.add(new double[] {520,532,2});temps.add(new double[] {515,535,2});temps.add(new double[] {511,539,2});temps.add(new double[] {508,545,2});temps.add(new double[] {506,548,2});
temps.add(new double[] {506,554,2});temps.add(new double[] {509,558,2});temps.add(new double[] {512,561,2});temps.add(new double[] {517,564,2});temps.add(new double[] {521,564,2});temps.add(new double[] {527,563,2});
temps.add(new double[] {531,560,2});temps.add(new double[] {535,557,2});temps.add(new double[] {538,553,2});temps.add(new double[] {542,548,2});temps.add(new double[] {544,544,2});temps.add(new double[] {546,540,2});
temps.add(new double[] {546,536,2});
templates.add(new cloud("half_note", temps, 0));
temps.clear();

for(cloud template: templates)
    template.cloud = normalizer(template.cloud,32);
String path = dataPath("");
File dir = new File(path);
//readIn(dir);
for(int i = 0; i < templates1.size();i++) {
  templates1.get(i).cloud = normalizer(templates1.get(i).cloud,32);
  //println(templates1.get(i).cloud.size(), i, templates1.get(i).name);
}
println("hello");
//random100();
System.out.println("\n\n\nHellO\n\n");
}

//Draw is called each time the screen is refreshed, the default framerate is 60fps
//And therefore, the draw funtion is called 60 times per second
void draw(){
  //Sets the background of the window / canvas to white
  background(255);
  //Calls the draw button function creating a button that clears the canvas
  drawButton(5, 5, 90, 50, "Clear");
  drawButton(605, 5, 90, 50, "Recognize");
  String recog = "";
  if(curr!=null)
    recog="Shape Drawn: " + curr.res.name + " Accuracy: " + curr.score; //<>//
  else
    recog = "Shape Drawn: ";  
  drawButton(10,660,680,30,recog);
  //Changes the color being drawn to green
  fill(0,255,0);
  //Loop that goes through the arrayList of pixels drawing a circle with a 1 pixel
  //Radius at each point
  for(int i = 0; i < points.size(); i++){
    strokeWeight(0);
    //Circle is called passing in the x and y coordinates drawing a circle of radius
    //1 at the location
    circle((int)points.get(i)[0],(int)points.get(i)[1], 1);
  }
}

//Whenever the mouse is pressed this function is called
void mousePressed(){ 
   //If statement check if the coordinates of the mouse were over the clear button 
   //When pressed
   if(mouseX > 5 && mouseX < 95 && mouseY > 5 && mouseY < 55){
     //If it was over the button it empties the arrayList
     points.removeAll(points);
     strokeID = 0;
     curr = null;
     //points.clear();
   }
   else if (mouseX > 605 && mouseX < 695 && mouseY > 5 && mouseY < 55){
     curr = null;
     curr = pRecognizer(points, templates);
     strokeID = 0; //<>//
     points.removeAll(points);
     //points.clear();
     System.out.println(points.size());
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
   System.out.println(strokeID);
   points.add(a);  
   }
}

//This function is usedto draw a button to the window, the x and y coordinates are
//Passed in as well as the width, weight, and text of the button
void drawButton(int x, int y, int wid, int hei, String text) {
  //Sets the color of the button
  fill(color(142, 201, 237));
  //Sets the weight for the border of the button
  strokeWeight(1);
  stroke(0);
  //The function draws a rectangle with the x, and y coordinates, as well as the
  //Width and height
  rect(x, y, wid, hei, 10);
  //This sets the mode for the text to be centered on the coordinates
  textAlign(CENTER, CENTER);
  //Sets the text size 
  textSize(18);
  //Sets the color of the text to black
  fill(0);
  //Draws the text to the window with the passed in text, x, y, width and height
  text(text, x + (wid / 2), y + (hei / 2));
}
