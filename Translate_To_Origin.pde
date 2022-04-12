ArrayList<double[]> transToOrigin(ArrayList<double[]> pts,int n){
  double[] cent = centroid(pts);
  ArrayList<double[]> newpts = new ArrayList<double[]>();
  for(int i = 0; i < pts.size(); i++){
    double[] newpt = new double[3];
    newpt[0] = pts.get(i)[0]-cent[0];
    newpt[1] = pts.get(i)[1]-cent[1];
    newpt[2] = pts.get(i)[2];
    newpts.add(newpt);
  }
  return newpts;
}
double[] centroid(ArrayList<double[]> pts){
  double x=0, y=0;
  for(int i = 0; i < pts.size(); i++){
    x+=pts.get(i)[0];
    y+=pts.get(i)[1];
  }
  x/=pts.size();
  y/=pts.size();
  double[] centr = new double[2];
  centr[0]=x;
  centr[1]=y;
  return centr;
}
