class Boundary
{
  PVector position; 
  float boundaryWidth, boundaryHeight;
  boolean isCursor;
  
  Boundary(PVector pos, float bW, float bH)
  {
    position = pos;
    boundaryWidth = bW;
    boundaryHeight = bH;
  }
  
  void display()
  {
    fill(255);
    noStroke();
    if(isCursor)
    {
      position.x = mouseX;
      if(mouseX < b_left.position.x + b_left.boundaryWidth)
      {
        rect(b_left.position.x + b_left.boundaryWidth, position.y, boundaryWidth, boundaryHeight);
      }
      else if(mouseX + boundaryWidth > b_right.position.x)
      {
        rect(b_right.position.x-boundaryWidth, position.y, boundaryWidth, boundaryHeight);
      }
      else
      {
        rect(mouseX, position.y, boundaryWidth, boundaryHeight);
      }
    }
    else
    {
      rect(position.x, position.y, boundaryWidth, boundaryHeight);
    }
  }
}
