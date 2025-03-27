void setup() 
{
    size(1280, 720, P3D);
    camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

PVector mousePos()
{
 float x = mouseX - Window.windowWidth / 2;
 float y = -(mouseY - Window.windowHeight / 2);
 return new PVector(x,y);
}

void draw()
{
  background(130);
  PVector mouse = mousePos();
  mouse.normalize().mult(300);
  
  strokeWeight(30);
  stroke(255,0,0,180);
  line(-mouse.x,-mouse.y,mouse.x,mouse.y);
  
  strokeWeight(15);
  stroke(255,255,255);
  line(-mouse.x,-mouse.y,mouse.x,mouse.y);
  
  strokeWeight(50);
  stroke(0);
  line(-40,0,40,0);
  
  println("Blade Magnitude: " + mouse.mag());
}
