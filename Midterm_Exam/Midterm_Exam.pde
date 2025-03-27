ArrayList<Walker> splatters;
PVector blackHole;
int resetFrames = 200;
int frameCounter = 0;

void setup() 
{
    size(1280, 720, P3D);
    camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
    blackHole = new PVector(random(Window.left, Window.right), random(Window.bottom, Window.top));
    splatters = new ArrayList<Walker>();
    for (int i = 0; i < 100; i++) 
    {
        splatters.add(new Walker());
    }
}

void draw() 
{
    background(0);
    frameCounter++;
    if (frameCounter >= resetFrames) 
    {
        resetSimulation();
    }
    
    fill(255);
    noStroke();
    ellipse(blackHole.x, blackHole.y, 50, 50);
    
   for (int i = 0; i < splatters.size(); i++) 
  {
    Walker w = splatters.get(i);
    w.moveTowards(blackHole);
    w.display();
  }
    
    blackHole.set(mouseX - Window.windowWidth / 2, -(mouseY - Window.windowHeight / 2));
}

void resetSimulation() 
{
    frameCounter = 0;
    blackHole.set(random(Window.left, Window.right), random(Window.bottom, Window.top));
    splatters.clear();
    for (int i = 0; i < 100; i++) 
    {
        splatters.add(new Walker());
    }
}
