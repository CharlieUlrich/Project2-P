public double pathLength(ArrayList<double[]> pts) {
  double d = 0;
  for (int i = 1; i < pts.size(); i++) {
    if (pts.get(i)[2] == pts.get(i-1)[2]) {
      d = (d + euclideanDistance(pts.get(i-1), pts.get(i)));
    }
  }
  return d;
}
