Walker[] walkers = new Walker[8];
PVector accelerationForce = new PVector(0.2, 0);

void setup() 
{
    size(1280, 720, P3D);
    camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
    initializeWalkers();
}

void draw() 
{
    background(0);
    stroke(255);
    strokeWeight(3);
    line(0, Window.bottom, 0, Window.top);

    for (Walker w : walkers) 
    {
        w.applyForce(accelerationForce); 
        w.applyFriction(); 
        w.update();
        w.render();
    }
}


void initializeWalkers() 
{
    int numWalkers = walkers.length;
    float spacing = (float) Window.heightPx / (numWalkers + 2);

    for (int i = 0; i < numWalkers; i++) 
    {
        float mass = i + 1; 
        float posY = Window.top - (spacing * (i + 1));
        walkers[i] = new Walker(mass, posY);
    }
}


void mousePressed() 
{
    initializeWalkers();
}
