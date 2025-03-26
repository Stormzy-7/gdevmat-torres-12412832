class Walker 
{
  public float x;
  public float y;
  public float tSize = 20000;
  public float tx = 0, ty = 10000;
  public float tR = 30000, tG = 40000, tB = 50000;
  
  void render()
  {
    float r = map(noise(tR),0,1,0,255);
    float g = map(noise(tG),0,1,0,255);
    float b = map(noise(tB),0,1,0,255);
    float size = map(noise(tSize),0,1,5,150);
    circle(x,y,size);
    fill(r,g,b,255);
    noStroke();
  }
  void perlinWalk()
  {
    x = map(noise(tx),0,1,-640,640);
    y = map(noise(ty),0,1,-360,360);
    tx += 0.01f;
    ty += 0.01f;
    tSize += 0.01f;
    tR += 0.01f;
    tG += 0.01f;
    tB += 0.01f;
  }
}
