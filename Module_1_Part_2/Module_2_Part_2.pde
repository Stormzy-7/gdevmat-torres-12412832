void setup() 
{
   size(1280, 720, P3D);
   camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
   background(0);
}

void draw() 
{
  if (frameCount % 300 ==0)
  {
    background(0);
  }
  for (int i = 0; i < 5; i++)
  {
    splatter();
  }
}

void splatter()
{
  float meanX = 0;
  float standardDeviationX = width/6;
  float x = randomGaussian() * standardDeviationX + meanX;
  float y = random(-height / 2, height / 2);
  float meanSize = 20;
  float standardDeviationSize = 10;
  float size = abs(randomGaussian() * standardDeviationSize + meanSize);
  int r = int(random(256));
  int g = int(random(256));
  int b = int(random(256));
  int a = int(random(10, 100));
  fill(r, g, b, a);
  noStroke();
  ellipse(x, y, size, size);
}
