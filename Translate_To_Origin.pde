ArrayList<double[]> transToOrigin(ArrayList<double[]> pts, double[] pt){
/*  int[] c = new int[2]; c[0]=0;c[1]=0;
  for(double[] p: pts){
    c[0]+=p[0];
    c[1]+=p[1];
  }
  c[0] = c[0]/n;
  c[1] = c[1]/n;
  for(double[] p: pts){
    p[0] = p[0]-c[0];
    p[1] = p[1]-c[1];
  }
  return pts;*/
  double[] c = Centroid(pts);
  ArrayList<double[]> newarr = new ArrayList<double[]>();
  for (int i = 0; i < pts.size(); i++) {
    double x = pts.get(i)[0] - c[0];
    double y = pts.get(i)[1] - c[1];
    newarr.add(new double[] {x,y,pts.get(i)[2]});
  }
  return newarr;
}

double[] Centroid(ArrayList<double[]> pts) {
  double x = 0.0;
  double y = 0.0;
  for (int i = 0; i < pts.size(); i++) {
    x+=pts.get(i)[0];
    y+=pts.get(i)[1];
  }
  x /= pts.size();
  y /= pts.size();
  
  return new double[] {x,y,0};
}
