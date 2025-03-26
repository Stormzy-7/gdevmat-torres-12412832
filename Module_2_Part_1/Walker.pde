class Walker
{
  float x;
  float y;
  
  void render()
  {
    circle(x, y,30);
  }
 
  void randomWalk()
  {
    int rng = int(random(8));
    if (rng == 0) x += 10; 
    else if (rng == 1) x -= 10; 
    else if (rng == 2) y += 10; 
    else if (rng == 3) y -= 10; 
    else if (rng == 4) { x += 10; y += 10; } 
    else if (rng == 5) { x -= 10; y += 10; } 
    else if (rng == 6) { x += 10; y -= 10; } 
    else { x -= 10; y -= 10; } 
  }
  
  void randomWalkBiased() 
  {
    int choice = (int) random(10);  
    if (choice < 4) x += 10; 
    else if (choice < 6) x -= 10; 
    else if (choice < 8) y += 10; 
    else y -= 10; 
  }
  
  void display() 
  {
    int r = (int) random(256);
    int g = (int) random(256);
    int b = (int) random(256);
    int a = (int) random(50, 101); 
    fill(r, g, b, a);
    noStroke();
    ellipse(x, y, 50, 50);
  }
}
