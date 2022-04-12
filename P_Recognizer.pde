Result pRecognizer(){
  int n = 32;
  points = normalizer(points,n);
  double score = Double.MAX_VALUE;
  cloud result = null;
  for(cloud template: templates){
    template.cloud = normalizer(template.cloud,n);
    double d = greedyCloudMatch(points,template.cloud,n);
    if (d < score){
      score = d;
      result = template;
    }
  }
  Result a = new Result(result,score);
  return a;
}

ArrayList<double[]> normalizer(ArrayList<double[]> pts,int n){
  pts = Resample(pts,n);
  scale(pts);
  transToOrigin(pts,n);
  return pts;
}

class Result{
 cloud res;
  double score;
  public Result(cloud n, double s){
    res = n;
     score = s;
  }
}
