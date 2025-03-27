class Walker
{
   PVector position = new PVector();
   PVector speed = new PVector(5,8);
   
   void bounce()
   {
     position.add(speed);
     if ((position.x > Window.right) || (position.x < Window.left))
     {
       speed.x *= -1;
     }
   if ((position.y > Window.right) || (position.y < Window.left))
     {
       speed.y *= -1;
     }
   }

  void render()
  {
    fill(182,52,100);
    circle(position.x,position.y,50);
  }
}
