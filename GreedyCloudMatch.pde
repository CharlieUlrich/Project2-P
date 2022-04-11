double greedyCloudMatch(ArrayList<double[]> pts, ArrayList<double[]> template, int n){
  double eps = 0.50;
  int step = (int)Math.pow(n,1-eps);
  double min = Double.MAX_VALUE;
  for(int i = 0; i < n; i+=step){
    double d1 = cloudDistance(pts,template,n,i);
    double d2 = cloudDistance(template,points,n,i);
    min = min((float)min,(float)d1,(float)d2);
  }
  return min;
}

double cloudDistance(ArrayList<double[]>pts, ArrayList<double[]> template, int n, int start){
  boolean[] matched = new boolean[n];
  double sum = 0;
  int i = start;
  do{
    double min = Double.MAX_VALUE;
    double d;
    int index;
    for(int j = 0; j < n; j++){
      if(!matched[j]){
        d = euclideanDistance(pts.get(i),template.get(j));
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
