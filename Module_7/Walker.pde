public class Walker
 {
   public PVector position = new PVector();
   public PVector velocity = new PVector();
   public PVector acceleration = new PVector();
   public float velocityLimit = 10;
   public float scale = 15;
   public float mass = 1;
   public float r = 255, g = 255, b = 255, a = 255;
   
   public Walker(PVector pos, float m)
   {
     this.position = pos;
     this.mass = m;
     this.scale = this.mass * 10;
     this.r = random(50, 255);  
     this.g = random(50, 255);
     this.b = random(50, 255);
     this.a = 255;
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
     fill(r,g,b,a);
     circle(position.x,position.y,scale);
   }
   
   public void checkEdges() 
    {
        if (this.position.x >= Window.right || this.position.x <= Window.left) 
        {
            this.velocity.x *= -1; 
        }
        if (this.position.y >= Window.top || this.position.y <= Window.bottom) 
        {
            this.position.y = Window.bottom;
            this.velocity.y *= -1; 
        }
    }
 }
