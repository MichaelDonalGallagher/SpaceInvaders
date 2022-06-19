public class Alien extends SpaceObject
{
  public int direction;
  public Alien(int x, int y, float speed, Line line)
  {
    super(x,y,speed,line);
    direction=1;
  }
  
  public int getDirection()
  {
    return this.direction;
  }

  public void changeDirection()
  {
    direction = direction*-1;
  }

  public void incLine()
  {
    
    getLine().setLineNumber(getLine().getLineNumber()+1);
    this.setY(getLine().getLineY()+1);
  }
  
  public boolean intersect(int x, int y)
  {
    if (dist(x+1, y+1, getX()*getSpeed(), getY()) < 22.5)
      return true;
    else
      return false;
  }
  
  public void display()  // this display is NOT used (yet)
  {
    fill(Game.ALIEN_COLOUR_WHITE);
    stroke(153);

    pushMatrix();    
    translate(0,0);
    
    rect(0, 5,Game.BLOCK_SIZE,Game.BLOCK_SIZE); rect(15, 5,Game.BLOCK_SIZE,Game.BLOCK_SIZE); rect(30, 5,Game.BLOCK_SIZE,Game.BLOCK_SIZE);
    rect(0,20,Game.BLOCK_SIZE,Game.BLOCK_SIZE); rect(15,20,Game.BLOCK_SIZE,Game.BLOCK_SIZE); rect(30,20,Game.BLOCK_SIZE,Game.BLOCK_SIZE);
    rect(0,35,Game.BLOCK_SIZE,Game.BLOCK_SIZE); rect(15,35,Game.BLOCK_SIZE,Game.BLOCK_SIZE); rect(30,35,Game.BLOCK_SIZE,Game.BLOCK_SIZE);
    
    popMatrix();
  } 
}
