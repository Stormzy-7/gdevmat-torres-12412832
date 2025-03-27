class Walker {
    PVector position;
    float size;
    color c;
    
    Walker() 
    {
        float x = randomGaussian() * (width / 6);
        float y = random(Window.bottom, Window.top) + height / 2;
        position = new PVector(x, y);
        size = abs(randomGaussian() * 10 + 20);
        c = color(random(256), random(256), random(256), random(10, 100));
    }
    
    void moveTowards(PVector target) 
    {
        PVector direction = PVector.sub(target, position);
        direction.setMag(5);
        position.add(direction);
        if (position.dist(target) < 5) 
        {
            resetPosition();
        }
    }
    
    void resetPosition() 
    {
        position.set(randomGaussian() * (width / 6), random(Window.bottom, Window.top) + height / 2);
    }
    
    void display() 
    {
        fill(c);
        noStroke();
        ellipse(position.x, position.y, size, size);
    }
}
