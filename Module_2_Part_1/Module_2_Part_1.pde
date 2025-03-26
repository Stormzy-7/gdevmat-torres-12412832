void setup() 
{
   size(1280, 720, P3D);
   camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
   background(0);
}

Walker oneWalker = new Walker();
Walker twoWalker = new Walker();

void draw()
{  
  
  oneWalker.randomWalk();
  oneWalker.display();
  
  twoWalker.randomWalkBiased();
  twoWalker.display();
}
