double euclideanDistance(double[] p1, double[] p2) {
  double y = p2[1] - p1[1];
  double x = p2[0] - p1[0];
  
  return Math.sqrt(y*y + x*x);
}
