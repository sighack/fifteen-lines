import megamu.mesh.*;

// From: http://leebyron.com/mesh/

MPolygon[] voronoi(ArrayList<PVector> points) {
  float[][] fpoints;
  fpoints = new float[points.size()][2];
  for (int i = 0; i < points.size(); i++) {
    fpoints[i][0] = points.get(i).x;
    fpoints[i][1] = points.get(i).y;
  }
  Voronoi myVoronoi = new Voronoi(fpoints);
  MPolygon[] regions = myVoronoi.getRegions();
  return regions;
}

float[][] delaunay(ArrayList<PVector> points) {
  float[][] fpoints;
  fpoints = new float[points.size()][2];
  for (int i = 0; i < points.size(); i++) {
    fpoints[i][0] = points.get(i).x;
    fpoints[i][1] = points.get(i).y;
  }
  //Voronoi myVoronoi = new Voronoi(fpoints);
  Delaunay myDelaunay = new Delaunay(fpoints);
  return myDelaunay.getEdges();
}

MPolygon hull(ArrayList<PVector> points) {
  float[][] fpoints;
  fpoints = new float[points.size()][2];
  for (int i = 0; i < points.size(); i++) {
    fpoints[i][0] = points.get(i).x;
    fpoints[i][1] = points.get(i).y;
  }
  Hull myHull = new Hull(fpoints);
  MPolygon region = myHull.getRegion();
  return region;
}
