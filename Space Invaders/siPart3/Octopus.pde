public class Octopus extends Alien
{
  //private Line line;
  //private int x;
  //private int y;
  //private float speed;
  private int direction;
  private int[] template = {1,1,1,1,1,1,1,0,1};
  
  public Octopus(Line line, int x)
  {
    super(x,line.getLineY(),1.0,line);
    this.direction=1;
  }
  
  //public int getX()  // remove this method when SpaceObject is implemented in a later part of the assignment
  //{
   // return this.x;
  //}
  
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
    // increment the line number
    getLine().setLineNumber(getLine().getLineNumber()+1);
    this.setY(getLine().getLineY()+1);
  }
  
  void incX()
  {
    setX(getX()+this.direction*(int)getSpeed());
  }
  
  public boolean intersect(int x, int y)
  {
    if (dist(x+1, y+1, getX()*getSpeed(), getY()) < 22.5)
      return true;
    else
      return false;
  }
  
  public String toString()
  {
     return "[Octopus:line="+getLine()+"x="+getX()+"y="+getY()+";speed="+getSpeed()+";direction="+direction+"]"; 
  }
  
  //
  // Add your code ABOVE this method
  //
  
  public void display() // CAREFUL HOW YOU MODIFY THIS CODE!!
  {
    fill(Game.ALIEN_COLOUR_WHITE);
    stroke(153);

    pushMatrix();
    
    incX();
    
    translate(getX()*getSpeed(), getY());
    
    rect(0, 5,Game.BLOCK_SIZE,Game.BLOCK_SIZE); rect(15, 5,Game.BLOCK_SIZE,Game.BLOCK_SIZE); rect(30, 5,Game.BLOCK_SIZE,Game.BLOCK_SIZE);
    rect(0,20,Game.BLOCK_SIZE,Game.BLOCK_SIZE); rect(15,20,Game.BLOCK_SIZE,Game.BLOCK_SIZE); rect(30,20,Game.BLOCK_SIZE,Game.BLOCK_SIZE);
    rect(0,35,Game.BLOCK_SIZE,Game.BLOCK_SIZE);                                              rect(30,35,Game.BLOCK_SIZE,Game.BLOCK_SIZE);
    
    popMatrix();
  } 
}
