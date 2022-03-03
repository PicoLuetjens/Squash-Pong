class Ball
{
  PVector position;
  float radius;
  float velocityX, velocityY;

  Ball(PVector pos, float rad, float velX, float velY)
  {
    position = pos;
    radius = rad;
    velocityX = velX;
    velocityY = velY;
  }
  
  void display()
  {
    fill(255);
    noStroke();
    ellipse(position.x, position.y, radius*2, radius*2);
  }
  
  void updateBall()
  {
    position.x+= velocityX;
    position.y+= velocityY;
  }
  
  
}
