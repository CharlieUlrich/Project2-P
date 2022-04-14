import java.util.Random;

Table table;


void random100() {
  
  table = new Table();
  
  table.addColumn("User");
  table.addColumn("GestureType");
  table.addColumn("RandomIteration");
  table.addColumn("#ofTrainingExamples");
  table.addColumn("TotalSizeOfTrainingSet");
  table.addColumn("TrainingSetContents");
  table.addColumn("Candidate");
  table.addColumn("RecoResultGestureType");
  table.addColumn("CorrectIncorrect");
  table.addColumn("RecoResultScore");
  table.addColumn("RecoResultBestMatch");
  table.addColumn("RecoResultNBestSorted");
  
  
  double avgAccuracy = 0.0;
  int tot = 0;
  
  int arr[] = {10,11,12,22,28,41,58,61,66,68,71,73,75,77,85,88,94,95,98,99};
  
  
  for (int user = 0; user < 1; user++) { // Subject
    ArrayList<cloud> temps = new ArrayList<cloud>();
    for (int j = 0; j < templates1.size(); j++) {
      if (templates1.get(j).sub == arr[user]) {
        temps.add(templates1.get(j));
      }
    }
    for (int ex = 1; ex <= 9; ex++) { 
      for (int i = 1; i <= 100; i++) {
        ArrayList<cloud> examples = new ArrayList<cloud>();
        ArrayList<cloud> candidates = new ArrayList<cloud>();
        cloud candidate;
        String tSetContents = "{";
        for (int g = 0; g < gestures.length; g++) {
          ArrayList<cloud> gests = new ArrayList<cloud>();
          for (int j = 0; j < temps.size(); j++) {
            if (temps.get(j).gesture.equals(gestures[g])) {
              gests.add(temps.get(j)); 
            }
          }
          
          // choose 1 candidate from U,G set
          Random r = new Random();
          int cn = r.nextInt(gests.size());
          candidate = gests.get(cn);
          gests.remove(cn);
          candidates.add(candidate);
          
          // choose E templates from U,G set
          int[] indices = new Random().ints(0, 9).distinct().limit(ex).toArray();
          for (int j = 0; j < indices.length; j++) {
            examples.add(gests.get(indices[j]));
            //println(examples.get(j).gesture);
            tSetContents += str(user) + "-" + gests.get(indices[j]).name + ", ";
          }
        }
        tSetContents += "}";
        
        for (int x = 0; x < candidates.size(); x++) {
          //println(candidates.get(x).cloud.size() + "  " + examples.size()); //<>//
          Result ok = pRecognizer(candidates.get(x).cloud, examples);
          int correct = 0;
          if (ok.res.gesture.equals(gestures[x])) {
            correct = 1;
            avgAccuracy += 1;
          }
          tot += 1;
          
          
          TableRow row = table.addRow();
          row.setInt("User", user);
          row.setString("GestureType", gestures[x]);
          row.setInt("RandomIteration", i);
          row.setInt("#ofTrainingExamples", ex);
          row.setInt("TotalSizeOfTrainingSet", examples.size());
          row.setString("TrainingSetContents", tSetContents);
          String thing = str(user) + "-" + candidates.get(x).name;
          row.setString("Candidate", thing);
          row.setString("RecoResultGestureType", ok.res.name.substring(0, ok.res.name.length()-2));
          row.setInt("CorrectIncorrect", correct);
          row.setDouble("RecoResultScore", 1 - ok.score);
          String thing2 = str(user) + "-" + ok.res.name;
          row.setString("RecoResultBestMatch", thing2);
          ArrayList<cloud> help = new ArrayList<cloud>();
          ArrayList<Double> scores = new ArrayList<Double>();
          ArrayList<String> output = new ArrayList<String>();
          for (int l = 0; l < examples.size(); l++) {
            help.add(examples.get(l));
            Result y = pRecognizer(candidates.get(x).cloud, help); 
            help.clear();
            scores.add(y.score);
            output.add(str(user) + "-" + examples.get(l).name);
          }
          for (int outer = 0; outer < scores.size()-1; outer++) {
            for (int inner = 0; inner < scores.size()-outer-1; inner++) {
              if (scores.get(inner) > scores.get(inner+1)) {
                double temp1 = scores.get(inner);
                scores.set(inner, scores.get(inner+1));
                scores.set(inner+1, temp1);
                
                String temp2 = output.get(inner+1);
                output.set(inner, output.get(inner+1));
                output.set(inner+1, temp2);
              } 
            }
          }
          String cat = "{";
          for (int dd = 0; dd < scores.size(); dd++) {
            cat += output.get(dd) + "," + scores.get(dd) + ",";
          }
          cat += "}";
          row.setString("RecoResultNBestSorted", cat);
        }
      }
    }
    //System.out.println("fhiwehfow");
    temps.clear();
  }
  
  TableRow row = table.addRow();
  row = table.addRow();
  row.setString("User", "Total Avg Accuracy");
  row.setDouble("GestureType", avgAccuracy/tot);
  
  saveTable(table, "data/table.csv");
  
}
