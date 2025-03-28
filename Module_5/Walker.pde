public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  public float velocityLimit = 20;
  public float scale;
  public float mass;
  public int r,g,b;
  
  public Walker(PVector pos, float m, float s)
  {
    this.position = pos;
    this.mass = m;
    this.scale = s;
    this.r = int(random(255)); 
    this.g = int(random(255)); 
    this.b = int(random(255)); 
  }
  
  public void applyForce(PVector force)
  {
    PVector f = PVector.div(force,this.mass);
    this.acceleration.add(f);
  }
  
  public void update()
  {
    this.velocity.add(this.acceleration);
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
    this.acceleration.mult(0);
  }
  
  public void render()
  {
    fill(r,g,b);
    circle(position.x,position.y,scale);
  }
  
  public void checkEdges()
  {
    if (this.position.x >= Window.right || this.position.x <= Window.left) 
    {
        this.velocity.x *= -1; 
    }
    else if (this.position.y >= Window.top || this.position.y <= Window.bottom) 
    {
        this.velocity.y *= -1; 
    }
  }
}
