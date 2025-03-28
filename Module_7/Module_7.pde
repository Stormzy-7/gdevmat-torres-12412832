Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);
Walker[] walkers = new Walker[10];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  float spacing = Window.widthPx / (walkers.length + 1);
  for (int i = 0; i < walkers.length; i++)
  {
    float mass = random(1,10);
    float xPos = spacing * (i + 1) - Window.widthPx / 2;
    walkers[i] = new Walker(new PVector(xPos, 300), mass);
  }
}

void draw()
{
  background(0);
  ocean.render();
 for (Walker w : walkers) 
 {
   w.render();
   w.update();
   w.checkEdges();
   PVector wind = new PVector(0.1, 0);
   PVector gravity = new PVector(0, -0.15 * w.mass);
   w.applyForce(wind);
   w.applyForce(gravity);
   float c = 0.1;
   float normal = 1;
   float frictionMagnitude = c * normal;
   PVector friction = w.velocity.copy().mult(-1).normalize().mult(frictionMagnitude);
   w.applyForce(friction);
   if (ocean.isCollidingWith(w)) 
   {
     PVector dragForce = ocean.calculateDragForce(w);
     w.applyForce(dragForce);
    }
  }
}
