// Within an 80 inch (200cm) square, 10,000 straight lines. Next to it is an 80 inch (200 cm) square with 10,000 not straight lines.

void setup() {
  size(1620, 820);
  background(255);
  stroke(0, 50);
  strokeWeight(0.5);
  drawStraightLines();
  drawCurvedLines();
  stroke(0, 50);
  strokeWeight(0.5);
  noFill();
  rect(10, 10, 800, 800); 
  rect(810, 10, 800, 800);
}

void drawStraightLines() {
  for (int i = 0; i < 10000; i++) {
    float x1 = random(10, 810);
    float y1 = random(10, 810);
    float x2 = random(10, 810);
    float y2 = random(10, 810);
    line(x1, y1, x2, y2);
  }
}

void drawCurvedLines() {
  for (int i = 0; i < 10000; i++) {
    float x1 = random(810, 1610);
    float y1 = random(10, 810);
    float x2 = random(810, 1610);
    float y2 = random(10, 810);
    
    float curve = 400;
    
    float cx1 = x1 + random(-curve, curve);
    float cy1 = y1 + random(-curve, curve);
    float cx2 = x2 + random(-curve, curve);
    float cy2 = y2 + random(-curve, curve);
    
    cx1 = constrain(cx1, 810, 1610);
    cx2 = constrain(cx2, 810, 1610);
    cy1 = constrain(cy1, 10, 810);
    cy2 = constrain(cy2, 10, 810);
    
    if (random(1) < 0.3) {
      cy1 += random(-200, 200);
      cy2 += random(-200, 200);
      cy1 = constrain(cy1, 10, 810);
      cy2 = constrain(cy2, 10, 810);
    }
    
    float steps = 30;
    for (float t = 0; t < 1; t += 1.0/steps) {
      float nt = t + 1.0/steps;
      
      float x = bezierPoint(x1, cx1, cx2, x2, t);
      float y = bezierPoint(y1, cy1, cy2, y2, t);
      float nx = bezierPoint(x1, cx1, cx2, x2, nt);
      float ny = bezierPoint(y1, cy1, cy2, y2, nt);
      
      line(x, y, nx, ny);
    }
  }
}

void draw() {
}
