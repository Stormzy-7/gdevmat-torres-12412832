float amplitude = 50;  
float frequency = 1;   
float timeOffset = 0;  

void setup() 
{
   size(1280, 720, P3D);
   camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

void draw() 
{
  background(0);
  drawCartesianPlane();
  drawLinear();
  drawQuadratic();
  drawCircle();
  drawSinewave();
  timeOffset += 1;
}

void drawCartesianPlane()
{
  strokeWeight(2);
  color white = color(255,255,255);
  fill(white);
  stroke(white);
  line(300,0,-300,0);
  line (0,-300,0,300);
  for(int i = -300; i <= 300; i += 10)
  {
    line (i, -3, i, 3);
    line(-3, i, 3, i);
  }
}

void drawLinear()
{
  color purple = color(128,0,128);
  fill(purple);
  noStroke();
  for (int x = -200; x <= 200; x++)
  {
    circle(x,x-6,5);
  }
}

void drawQuadratic()
{
  color yellow = color(255,255,0);
  fill(yellow);
  stroke(yellow);
  for (float x = -300; x <= 300; x+=0.1f)
  {
    circle(x*10, ((x*x) - (x*15) - 3), 5);
  }
}

void drawCircle()
{
  color orange = color(255, 165, 0);
  fill(orange);
  stroke(orange);
  float radius = 50;
  for (int x = 0; x <= 360; x++)
  {
    circle((float)Math.cos(x) * radius, (float)Math.sin(x) * radius, 5);
  }
}

void drawSinewave()
{
  color blue = color(0, 0, 255);
  fill(blue);
  stroke(blue);
  for (float x = -300; x <= 300; x += 1)
  {
    float y = amplitude * sin ((x*frequency*0.05) + timeOffset);
    circle(x,y,5);
  }
}

void keyPressed()
{
  if (keyCode == 'w'|| keyCode == 'W') amplitude += 5;
  if (keyCode == 's'|| keyCode == 'S') amplitude -= 5;
  if (keyCode == 'd'|| keyCode == 'D') frequency += 0.1;
  if (keyCode == 'a'|| keyCode == 'A') frequency -= 0.1;
  
  amplitude = max(5, amplitude);
  frequency = max(0.1, frequency);
}
