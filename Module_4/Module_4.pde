ArrayList<Walker> walkers = new ArrayList<Walker>();

void setup()
{
    size(1280, 720, P3D);
    camera(0, 0, -(height / 2.0) / tan(PI * 30.0 / 180.0), 0, 0, 0, 0, -1, 0);
    for(int i = 0; i < 100; i++)
    {
      walkers.add(new Walker(new PVector(random(Window.left,Window.right),random(Window.bottom,Window.top)),random(5,15)));
    }
}

void draw()
{
  background(0);
  for (Walker w : walkers)
    {
      w.accelerateTowardaMouse();
      w.update();                
      w.checkEdges();              
      w.render();
    }
}

PVector getMousePosition()
{
    float x = mouseX - width / 2;
    float y = -(mouseY - height / 2);
    return new PVector(x, y);
}
