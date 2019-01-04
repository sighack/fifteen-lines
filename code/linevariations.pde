int MAX_VALUES = 5;

void line1(float x1, float y1, float x2, float y2, float weight, float value) {
  float strokeColor = map2(value, 0, MAX_VALUES - 1, 0, 220, LINEAR, EASE_OUT);
  stroke(strokeColor);
  strokeWeight(weight);
  line(x1, y1, x2, y2);
  stroke(255, 0, 0);
  noFill();
  strokeWeight(1);
}

void line2(float x1, float y1, float x2, float y2, float weight, float value) {
  float strokeColor = map2(value, 0, MAX_VALUES - 1, 0, 220, LINEAR, EASE_OUT);
  stroke(strokeColor);
  for (int i = 0; i < weight * 5; i++) {
    float theta = random(TWO_PI);
    float nx1 = x1 + random(weight / 2) * cos(theta);
    float ny1 = y1 + random(weight / 2) * sin(theta);
    float nx2 = x2 + random(weight / 2) * cos(theta);
    float ny2 = y2 + random(weight / 2) * sin(theta);
    strokeWeight(0.5);
    line(nx1, ny1, nx2, ny2);
  }
}

void line3(float x1, float y1, float x2, float y2, float weight, float value) {
  float strokeColor = map2(value, 0, MAX_VALUES - 1, 220, 50, LINEAR, EASE_OUT);
  fill(0, strokeColor);
  for (int i = 0; i < weight * 300; i++) {
    float theta = random(TWO_PI);
    float nx1 = x1 + random(weight / 2) * cos(theta);
    float ny1 = y1 + random(weight / 2) * sin(theta);
    float nx2 = x2 + random(weight / 2) * cos(theta);
    float ny2 = y2 + random(weight / 2) * sin(theta);
    noStroke();
    //fill(0, map(value, 0, MAX_VALUES);
    float lval = random(1);
    ellipse(lerp(nx1, nx2, lval), lerp(ny1, ny2, lval), 0.5, 0.5);
  }
}

void line4(float x1, float y1, float x2, float y2, float weight, float value) {
  float darkness = map2(value, 0, MAX_VALUES - 1, 5, 1, QUADRATIC, EASE_OUT);
  for (int i = 0; i < weight * darkness * 100; i++) {
    float theta = random(TWO_PI);
    float nx1 = x1 + random(weight / 2) * cos(theta);
    float ny1 = y1 + random(weight / 2) * sin(theta);
    float nx2 = x2 + random(weight / 2) * cos(theta);
    float ny2 = y2 + random(weight / 2) * sin(theta);
    noStroke();
    fill(0);
    float lval = random(1);
    ellipse(lerp(nx1, nx2, lval), lerp(ny1, ny2, lval), 0.5, 0.5);
  }
}

void line5(float x1, float y1, float x2, float y2, float weight, float value) {
  ArrayList<PVector> points = new ArrayList<PVector>();
  strokeWeight(0.5);
  float strokeColor = map2(value, 0, MAX_VALUES - 1, 0, 220, LINEAR, EASE_OUT);
  stroke(strokeColor);
  points.add(new PVector(x1, y1));
  points.add(new PVector(x2, y2));
  for (int i = 0; i < weight * 5; i++) {
    float theta = random(TWO_PI);
    float nx1 = x1 + random(weight / 2) * cos(theta);
    float ny1 = y1 + random(weight / 2) * sin(theta);
    float nx2 = x2 + random(weight / 2) * cos(theta);
    float ny2 = y2 + random(weight / 2) * sin(theta);
    noFill();
    float lval = random(1);
    float px = lerp(nx1, nx2, lval);
    float py = lerp(ny1, ny2, lval);
    points.add(new PVector(px, py));
  }

  float[][] myEdges = delaunay(points);
  for (int i = 0; i < myEdges.length; i++) {
    float startX = myEdges[i][0];
    float startY = myEdges[i][1];
    float endX = myEdges[i][2];
    float endY = myEdges[i][3];
    line( startX, startY, endX, endY );
  }
}

void line6(float x1, float y1, float x2, float y2, float weight, float value) {
  ArrayList<PVector> points = new ArrayList<PVector>();
  strokeWeight(0.5);
  float strokeColor = map2(value, 0, MAX_VALUES - 1, 0, 220, SINUSOIDAL, EASE_OUT);
  fill(strokeColor);
  noStroke();
  points.add(new PVector(x1, y1));
  points.add(new PVector(x2, y2));
  for (int i = 0; i < weight * 5; i++) {
    float theta = random(TWO_PI);
    float nx1 = x1 + random(weight / 2) * cos(theta);
    float ny1 = y1 + random(weight / 2) * sin(theta);
    float nx2 = x2 + random(weight / 2) * cos(theta);
    float ny2 = y2 + random(weight / 2) * sin(theta);

    float lval = random(1);
    float px = lerp(nx1, nx2, lval);
    float py = lerp(ny1, ny2, lval);
    points.add(new PVector(px, py));
  }

  MPolygon hull = hull(points);
  PShape p = createShape();
  float[][] poly_points = hull.getCoords();
  p.beginShape();
  for (int k = 0; k < poly_points.length; k++)
    p.vertex(poly_points[k][0], poly_points[k][1]);
  p.endShape(CLOSE);
  shape(p, 0, 0);
}

void line7(float x1, float y1, float x2, float y2, float weight, float value) {
  ArrayList<PVector> points = new ArrayList<PVector>();
  strokeWeight(0.5);
  float strokeColor = map2(value, 0, MAX_VALUES - 1, 0, 220, LINEAR, EASE_OUT);
  stroke(strokeColor);
  points.add(new PVector(x1, y1));
  points.add(new PVector(x2, y2));
  for (int i = 0; i < weight * 10; i++) {
    float theta = random(TWO_PI);
    float nx1 = x1 + random(weight / 2) * cos(theta);
    float ny1 = y1 + random(weight / 2) * sin(theta);
    float nx2 = x2 + random(weight / 2) * cos(theta);
    float ny2 = y2 + random(weight / 2) * sin(theta);
    noFill();
    float lval = random(1);
    float px1 = lerp(nx1, nx2, lval);
    float py1 = lerp(ny1, ny2, lval);

    lval = random(1);
    float px2 = lerp(nx1, nx2, lval);
    float py2 = lerp(ny1, ny2, lval);
    line(px1, py1, px2, py2);
  }
}

void line8(float x1, float y1, float x2, float y2, float weight, float value) {
  ArrayList<PVector> points = new ArrayList<PVector>();
  strokeWeight(0.5);
  float strokeColor = map2(value, 0, MAX_VALUES - 1, 0, 220, LINEAR, EASE_OUT);
  fill(strokeColor);
  points.add(new PVector(x1, y1));
  points.add(new PVector(x2, y2));
  for (int i = 0; i < weight * 20; i++) {
    float theta = random(TWO_PI);
    float nx1 = x1 + random(weight / 2) * cos(theta);
    float ny1 = y1 + random(weight / 2) * sin(theta);
    float nx2 = x2 + random(weight / 2) * cos(theta);
    float ny2 = y2 + random(weight / 2) * sin(theta);

    float lval = random(1);
    float px1 = lerp(nx1, nx2, lval);
    float py1 = lerp(ny1, ny2, lval);
    //noFill();
    noStroke();
    float d = random(0.5, weight/2);
    ellipse(px1, py1, d, d);
  }
}

void line9(float x1, float y1, float x2, float y2, float weight, float value) {
  ArrayList<PVector> points = new ArrayList<PVector>();
  strokeWeight(0.5);
  float strokeColor = map2(value, 0, MAX_VALUES - 1, 0, 220, LINEAR, EASE_OUT);
  stroke(strokeColor);
  points.add(new PVector(x1, y1));
  points.add(new PVector(x2, y2));
  for (int i = 0; i < weight * 20; i++) {
    float theta = random(TWO_PI);
    float nx1 = x1 + random(weight / 2) * cos(theta);
    float ny1 = y1 + random(weight / 2) * sin(theta);
    float nx2 = x2 + random(weight / 2) * cos(theta);
    float ny2 = y2 + random(weight / 2) * sin(theta);

    float lval = random(1);
    float px1 = lerp(nx1, nx2, lval);
    float py1 = lerp(ny1, ny2, lval);
    noFill();
    //noStroke();
    float d = random(0.5, weight/2);
    ellipse(px1, py1, d, d);
  }
}

void line10(float x1, float y1, float x2, float y2, float weight, float value) {
  ArrayList<PVector> points = new ArrayList<PVector>();
  strokeWeight(0.5);
  float strokeColor = map2(value, 0, MAX_VALUES - 1, 0, 220, LINEAR, EASE_OUT);
  stroke(strokeColor);
  noFill();
  points.add(new PVector(x1, y1));
  points.add(new PVector(x2, y2));
  println(dist(x1, y1, x2, y2));
  for (float lval = 0; lval <= 1; lval += 0.01) {
    float px = lerp(x1, x2, lval);
    float py = lerp(y1, y2, lval);
    float d = random(0.5, weight);
    ellipse(px, py, d, d);
  }
}

void line11(float x1, float y1, float x2, float y2, float weight, float value) {
  ArrayList<PVector> points = new ArrayList<PVector>();
  strokeWeight(0.5);
  float strokeColor = map2(value, 0, MAX_VALUES - 1, 0, 220, LINEAR, EASE_OUT);
  fill(strokeColor);
  noStroke();
  points.add(new PVector(x1, y1));
  points.add(new PVector(x2, y2));
  for (float lval = 0; lval <= 1; lval += 0.05) {
    float px = lerp(x1, x2, lval);
    float py = lerp(y1, y2, lval);
    float d = random(weight / 3.0, weight);
    ellipse(px, py, d, d);
  }
}

void line12(float x1, float y1, float x2, float y2, float weight, float value) {
  ArrayList<PVector> points = new ArrayList<PVector>();
  strokeWeight(0.5);
  float strokeColor = map2(value, 0, MAX_VALUES - 1, 0, 220, LINEAR, EASE_OUT);
  fill(strokeColor);
  noStroke();
  points.add(new PVector(x1, y1));
  points.add(new PVector(x2, y2));
  for (float lval = 0; lval <= 1; lval += 0.05) {
    float px = lerp(x1, x2, lval);
    float py = lerp(y1, y2, lval);
    float d = random(weight / 3.0, weight);
    ellipse(px, py, d, d);
  }

  noFill();
  stroke(255 - strokeColor);
  for (float lval = 0; lval <= 1; lval += 0.05) {
    float px = lerp(x1, x2, lval);
    float py = lerp(y1, y2, lval);
    float d = random(weight / 3.0, weight);
    ellipse(px, py, d, d);
  }
}

void line13(float x1, float y1, float x2, float y2, float weight, float value) {
  ArrayList<PVector> points = new ArrayList<PVector>();
  strokeWeight(0.5);
  float strokeColor = map2(value, 0, MAX_VALUES - 1, 0, 220, LINEAR, EASE_OUT);
  fill(strokeColor);
  noStroke();
  points.add(new PVector(x1, y1));
  points.add(new PVector(x2, y2));
  for (int k = 0; k < 20; k++) {
    PShape s = createShape();
    s.beginShape();
    s.stroke(strokeColor);
    s.noFill();
    s.vertex(x1, y1);
    for (float lval = 0; lval < 1; lval += 0.1) {
      float px = lerp(x1, x2, lval);
      float py = lerp(y1, y2, lval);
      PVector p1 = new PVector(px, py);
      PVector l = new PVector(y2-y1, x1-x2);
      PVector pf = p1.add(l.normalize().mult(random(-weight/2, weight/2)));
      //println(pf.x + " " + pf.y);
      s.vertex(pf.x, pf.y);
    }
    s.vertex(x2, y2);
    s.endShape();
    shape(s, 0, 0);
  }
}

void line14(float x1, float y1, float x2, float y2, float weight, float value) {
  ArrayList<PVector> points = new ArrayList<PVector>();
  strokeWeight(0.5);
  float strokeColor = map2(value, 0, MAX_VALUES - 1, 0, 220, SINUSOIDAL, EASE_OUT);
  fill(strokeColor);
  noStroke();
  points.add(new PVector(x1, y1));
  points.add(new PVector(x2, y2));
  for (int k = 0; k < 1; k++) {
    PShape s = createShape();
    s.beginShape();
    s.stroke(strokeColor);
    s.noFill();
    s.vertex(x1, y1);
    for (float lval = 0; lval < 1; lval += 0.001) {
      float px = lerp(x1, x2, lval);
      float py = lerp(y1, y2, lval);
      PVector p1 = new PVector(px, py);
      PVector l = new PVector(y2-y1, x1-x2);
      PVector pf = p1.add(l.normalize().mult(random(-weight/2, weight/2)));
      //println(pf.x + " " + pf.y);
      s.vertex(pf.x, pf.y);
    }
    s.vertex(x2, y2);
    s.endShape();
    shape(s, 0, 0);
  }
}

void line15(float x1, float y1, float x2, float y2, float weight, float value) {
  ArrayList<PVector> points = new ArrayList<PVector>();
  strokeWeight(0.5);
  float strokeColor = map2(value, 0, MAX_VALUES - 1, 0, 220, SINUSOIDAL, EASE_OUT);
  fill(strokeColor);
  noStroke();
  points.add(new PVector(x1, y1));
  points.add(new PVector(x2, y2));
  for (int k = 0; k < 1; k++) {
    PShape s = createShape();
    s.beginShape();
    //s.stroke(strokeColor);
    s.noStroke();
    s.fill(strokeColor);
    s.vertex(x1, y1);
    for (float lval = 0; lval < 1; lval += 0.001) {
      float px = lerp(x1, x2, lval);
      float py = lerp(y1, y2, lval);
      PVector p1 = new PVector(px, py);
      PVector l = new PVector(y2-y1, x1-x2);
      PVector pf = p1.add(l.normalize().mult(random(-weight/2, weight/2)));
      //println(pf.x + " " + pf.y);
      s.vertex(pf.x, pf.y);
    }
    s.vertex(x2, y2);
    s.endShape(CLOSE);
    shape(s, 0, 0);
  }
}

void render() {
  //size(500, 500);
  //smooth(8);
  background(255);
  float margin = 20;
  float linew = (height - (MAX_VALUES + 1) * margin) / MAX_VALUES;
  println(margin + " " + linew + " " + (linew * MAX_VALUES));
  //int num_lines = 4;
  for (int k = 0; k < MAX_VALUES; k++) {
    float upper = (k + 1) * margin + k * linew + 0.1 * linew;
    float lower = (k + 1) * margin + k * linew + 0.9 * linew;

    stroke(230);
    strokeWeight(0.5);
    line(0, upper, width, upper);
    line(0, lower, width, lower);

    for (int i = 1; i <= 10; i++) {
      line15(
        map(i, 1, 10, 0.2*width, 0.97*width), upper, 
        map(i, 1, 10, 0.03*width, 0.8*width), lower, 
        2*i, k);
    }
  }
}
