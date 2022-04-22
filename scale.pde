ArrayList<double[]> scale(ArrayList<double[]> pts) {
  double minX = Integer.MAX_VALUE;
  double minY = Integer.MAX_VALUE;
  double maxX = 0;
  double maxY = 0;
  
  for (int i = 0; i < pts.size(); i++) {
    minX = Math.min(minX, pts.get(i)[0]);
    minY = Math.min(minY, pts.get(i)[1]);
    maxX = Math.max(maxX, pts.get(i)[0]);
    maxY = Math.max(maxY, pts.get(i)[1]);
  }
  double scale = Math.max(maxX-minX, maxY-minY);
  for (int i = 0; i < pts.size(); i++) {
    pts.get(i)[0] = (pts.get(i)[0] - minX)/scale;
    pts.get(i)[1] = (pts.get(i)[1] - minY)/scale;
  }
  return pts;
}
