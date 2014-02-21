class Cylinder {
  PShape cylinder;
  PShape cap1, cap2, body;
  color c;
  float r, bottomCapZ, h;
  float ang = 0;
  int sides = 25;

  Cylinder(color _c, float _r, float _h, float _bottomCapZ) {
    c = _c;
    r = _r;
    h = _h;
    bottomCapZ = _bottomCapZ;
  }
  
  void create(){
    cylinder = createShape(GROUP);
    
    //bottom cap
    cap1 = createShape();
    cap1.setFill(c);
    cap1.setStroke(false);
    cap1.beginShape();
    for (int i=0; i<=sides; i++) {
      float  px = cos(ang)*r;
      float  py = sin(ang)*r;
      cap1.vertex(px, py, bottomCapZ); 
      ang+=TWO_PI/sides;
    }
    cap1.endShape();
    cylinder.addChild(cap1);
   
    //body
    body = createShape();
    body.setFill(c);
    body.setStroke(false);
    body.beginShape(QUAD_STRIP);
    for (int i=0; i<sides+1; ++i) {
      float  px = cos(ang)*r;
      float  py = sin(ang)*r;
      body.vertex(px, py, bottomCapZ);   
      body.vertex(px, py, bottomCapZ+h); 
      ang+=TWO_PI/sides;
    }
    body.endShape();
    cylinder.addChild(body); 

    //top cap
    cap2 = createShape();
    cap2.setFill(c);
    cap2.setStroke(false);
    cap2.beginShape();
    for (int i=0; i<=sides; i++) {
      float  px = cos(ang)*r;
      float  py = sin(ang)*r;
      cap2.vertex(px, py, bottomCapZ+h); 
      ang+=TWO_PI/sides;
    }
    cap2.endShape();
    cylinder.addChild(cap2); 
  }

  void render() {
    shape(cylinder);
  } 
}

