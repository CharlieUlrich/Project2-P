double greedyCloudMatch(ArrayList<double[]> pts, ArrayList<double[]> template, int n){
  double eps = 0.50;
  int step = (int)Math.floor(Math.pow(pts.size(),1-eps));
  double min = Double.MAX_VALUE;
  for(int i = 0; i < pts.size(); i+=step){
    //println("1");
    double d1 = cloudDistance(pts,template,n,i);
        //println("2");
    double d2 = cloudDistance(template,pts,n,i);
    min = Math.min((float)min,Math.min((float)d1,(float)d2));
  }
  return min;
}

double cloudDistance(ArrayList<double[]>pts, ArrayList<double[]> template, int n, int start){
  boolean[] matched = new boolean[n];
  for (int k = 0; k < n; k++) matched[k] = false;
  double sum = 0;
  int i = start;
  do{
    double min = Double.MAX_VALUE;
    int index = -1;
    for(int j = 0; j < n; j++){
      if(!matched[j]){
        //println(pts.size(), template.size());
        double d = euclideanDistance(pts.get(i),template.get(j));
        if(d<min){
          min = d;
          index = j;
        }
      }
    }
    matched[index]=true;
    double weight = 1 - ((i-start+n)%n)/n;
    sum = sum + weight*min;
    i = (i+1)%n;
  }while(i!=start);
  return sum;
}
