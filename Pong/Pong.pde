int score = 0;
Ball ball;
Boundary b_left, b_right, b_top;
Boundary b_cursor;

void setup()
{
  size(1000, 1000);
  ball = new Ball(new PVector(width/2, height/2), width/50, width/400, -width/300);
  b_right = new Boundary(new PVector((width/20)*19, 0), width/20, height);
  b_left = new Boundary(new PVector(0, 0), width/20, height);
  b_top = new Boundary(new PVector(width/20, 0), (width/20)*18, height/20);
  b_cursor = new Boundary(new PVector(width/2, (height/10)*9), width/5, height/20);
  b_right.isCursor = false;
  b_left.isCursor = false;
  b_top.isCursor = false;
  b_cursor.isCursor = true;
}

void draw()
{
  background(0);
  ball.display();
  b_left.display();
  b_right.display();
  b_top.display();
  b_cursor.display();
  ball.updateBall();
  
  if(ball.position.x-ball.radius <= b_left.position.x+b_left.boundaryWidth)
  {
    ball.velocityX = -ball.velocityX;
  }
  
  else if(ball.position.x+ball.radius >= b_right.position.x)
  {
    ball.velocityX = -ball.velocityX;
  }
  else if(ball.position.y-ball.radius <= b_top.position.y+b_top.boundaryHeight)
  {
    ball.velocityY = -ball.velocityY;
    ball.velocityY+= random(0, width/1000);
    ball.velocityX+= random(0, width/1000);
  }
  //if(ball.position.y+ball.radius >= b_cursor.position.y)
  if(ball.position.y >= b_cursor.position.y)
  {
    if(ball.position.x + ball.radius >= b_cursor.position.x && ball.position.x - ball.radius <= b_cursor.position.x + b_cursor.boundaryWidth)
    {
      ball.velocityY = -ball.velocityY;
      score++;
    }
    else
    {
      exit();
    }
  }

  fill(0);
  textSize(width/60);
  text("Score: " + score, (width/10)*9, height/30);
}
