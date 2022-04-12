void xmlWriter(cloud write){
  String fileName = "./data/" + write.sub + write.name + ".xml"; 
  PrintWriter pr = createWriter(fileName);
  pr.println("<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\"?>");
  String header = "<Gesture Name=\"" + write.name + "\" Subject=\"" + write.sub+ "\" Number=\"" + write.sub + "\" NumPts=\""+ write.cloud.size() + "\">";
  pr.println(header);
  for(double[] i: write.cloud){
    String row = "  <Point X=\"" + i[0] + "\" Y=\"" + i[1] + "\" StrokeID =\"" + i[2]+ "\" />";
    pr.println(row);
  }
  pr.println("</Gesture>");  
  pr.close();

}
