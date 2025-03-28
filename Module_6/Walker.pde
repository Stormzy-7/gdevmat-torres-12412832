public class Walker
{
    public PVector position;
    public PVector velocity = new PVector();
    public PVector acceleration = new PVector();
    public float velocityLimit = 20;
    public float scale;
    public float mass;
    public color walkerColor;

    public Walker(float m, float posY)
    {
        this.mass = m;
        this.scale = mass * 15;
        this.position = new PVector(Window.left, posY);
        walkerColor = color(random(255), random(255), random(255));
    }

    public void applyForce(PVector force)
    {
        PVector f = PVector.div(force, this.mass);
        this.acceleration.add(f);
    }

    public void applyFriction()
    {
        float coefficient;
        if (this.position.x > 0) 
        {
          coefficient = 0.4;
        } 
        else 
        {
          coefficient = 0.01;
        }
        PVector friction = velocity.copy();
         friction.normalize();
        friction.mult(-coefficient);
        applyForce(friction);
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
        fill(walkerColor);
        noStroke();
        circle(position.x, position.y, scale);
    }
}
