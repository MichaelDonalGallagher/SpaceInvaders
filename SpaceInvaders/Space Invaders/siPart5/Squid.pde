public class Squid extends Alien
{
  int[] template = {1, 0, 1, 0, 1, 0, 0, 1, 0}; 


  public Squid(Line line, int x)
  {
    super(x, line.getLineY(), 1.0, line);
   
  }
  void incX()
  {
    setX(getX()+getDirection()*(int)getSpeed());
  }
  
  public String toString()
  {
    return "[Squid:line="+getLine()+"x="+getX()+"y="+getY()+";speed="+getSpeed()+"]";
  }
  public void display()
  {
    fill(Game.ALIEN_COLOUR_WHITE);
    stroke(153);

    pushMatrix();

    incX();

    translate(getX()*getSpeed(), getY());

    rect(0, 5, Game.BLOCK_SIZE, Game.BLOCK_SIZE);                                              
    rect(30, 5, Game.BLOCK_SIZE, Game.BLOCK_SIZE);
    rect(15, 20, Game.BLOCK_SIZE, Game.BLOCK_SIZE);
    rect(0, 35, Game.BLOCK_SIZE, Game.BLOCK_SIZE);                                              
    rect(30, 35, Game.BLOCK_SIZE, Game.BLOCK_SIZE);

    popMatrix();
  }
}
