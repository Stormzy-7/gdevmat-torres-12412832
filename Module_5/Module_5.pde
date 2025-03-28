Walker[] w = new Walker[10];
PVector wind =new PVector(0,-0.4);
PVector gravity = new PVector(0.15,0);

void setup()
{
    size(1280, 720, P3D);
    camera(0, 0, -(height / 2.0) / tan(PI * 30.0 / 180.0), 0, 0, 0, 0, -1, 0);
    for (int i = 0; i < w.length; i++)
    {
      float mass = i + 1;
      float scale = mass *15;
      w[i] = new Walker(new PVector(-500,200), mass,scale);
    }
}

void draw()
{
  background(0);
 for (int i = 0; i < w.length; i++)
 {
    w[i].applyForce(wind);
    w[i].applyForce(gravity);
    w[i].update();
    w[i].checkEdges();
    w[i].render();
  }
}
