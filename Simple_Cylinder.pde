import peasy.*;

PeasyCam cam;
Cylinder c;

void setup() {
  size(500, 400, OPENGL); 
  cam = new PeasyCam(this, 200);
  cam.rotateY(PI/4);
  cam.rotateX(-PI/8);
  c = new Cylinder(color(255,0,0), 50, 100, 0); // color, radius, height, z
  c.create();
}

void draw() {
  background(0);
  lights();
  c.render();
}


