public class MysteryShip extends SpaceObject 
{
  //private Line line; 
  //private int x;
  //private int y;
  //private float speed;   
  private int direction;
  private int[] template = {0,1,0,1,1,1,0,1,0};
    
  public MysteryShip(Line line)
  {
    super(-Game.SPACESHIP_WIDTH,line.getLineY(),2.0,line);
    this.direction=1;
  }

  //public int getX()
  //{
   // return this.x;
  //}
  
  public boolean visible()
  {
    if (getX()+((int)getSpeed()*1)>width)
      return false;
    else
      return true;
  }
  
  public int getDirection()
  {
    return this.direction;
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
       return "[MysteryShip:line="+getLine()+"x="+getX()+";y="+getY()+";speed="+getSpeed()+";direction="+direction+"]"; 
    }
  //
  // Add your code ABOVE this method
  //
  
  public void display() // CAREFUL HOW YOU MODIFY THIS CODE!!
  {
    fill(Game.MYSTERYSHIP_COLOUR_GREEN);
    stroke(153);

    pushMatrix();
    
    incX();
    translate(getX()*getSpeed(), getY());
    
                                                rect(Game.BLOCK_SIZE*1, 5,Game.BLOCK_SIZE,Game.BLOCK_SIZE);
    rect(0,20,Game.BLOCK_SIZE,Game.BLOCK_SIZE); rect(Game.BLOCK_SIZE*1,20,Game.BLOCK_SIZE,Game.BLOCK_SIZE); rect(Game.BLOCK_SIZE*2,20,Game.BLOCK_SIZE,Game.BLOCK_SIZE);
                                                rect(Game.BLOCK_SIZE*1,35,Game.BLOCK_SIZE,Game.BLOCK_SIZE); 
              
    popMatrix();
  }

}
