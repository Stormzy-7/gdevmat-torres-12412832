public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  public float velocityLimit = 10;
  public float scale;
  
  public Walker(PVector pos, float s)
  {
    this.position = pos;
    this.velocity = new PVector();
    this.acceleration = new PVector();
    this.scale = s;
  }
   
  public void accelerateTowardaMouse()
  {
    PVector mouse = getMousePosition();
    PVector direction = PVector.sub(mouse,this.position);
    direction.normalize();
    direction.mult(0.2);
    this.acceleration = direction;
  }
  
  public void update()
  {
    this.velocity.add(this.acceleration);
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
  }
  
  public void render()
  {
    fill(255);
    noStroke();
    circle(position.x,position.y,scale);
  }
  
  public void checkEdges()
  {
    if(this.position.x > Window.right)
    {
      this.position.x = Window.left;
    }
    else if (this.position.x < Window.left)
    {
     this.position.x = Window.right;
    }
    
    if(this.position.y > Window.top)
    {
      this.position.y = Window.bottom;
    }
    else if (this.position.y < Window.bottom)
    {
     this.position.y = Window.top;
    }
  }
}
