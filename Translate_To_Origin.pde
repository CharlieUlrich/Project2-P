ArrayList<double[]> transToOrigin(ArrayList<double[]> pts,int n){
  int[] c = new int[2]; c[0]=1;c[1]=1;
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
  return pts;
}
