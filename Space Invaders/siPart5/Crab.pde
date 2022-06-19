public class Crab extends Alien
{
  int[] template = {1, 0, 1, 1, 1, 1, 1, 0, 1};
  

  public Crab(Line line, int x)
  {
    super(x, line.getLineY(), 1.0, line);
  }

  void incX()
  {
    setX(getX()+getDirection()*(int)getSpeed());
  }

  public String toString()
  {
    return "[Crab:line="+getLine()+"x="+getX()+"y="+getY()+";speed="+getSpeed()+"]";
  }
  public void display()
  {
    fill(Game.ALIEN_COLOUR_WHITE);
    stroke(153);

    pushMatrix();

    incX();

    translate(getX()*getSpeed(), getY());

    rect(0, 5,Game.BLOCK_SIZE,Game.BLOCK_SIZE);                                              rect(30, 5,Game.BLOCK_SIZE,Game.BLOCK_SIZE);
    rect(0,20,Game.BLOCK_SIZE,Game.BLOCK_SIZE); rect(15,20,Game.BLOCK_SIZE,Game.BLOCK_SIZE); rect(30,20,Game.BLOCK_SIZE,Game.BLOCK_SIZE);
    rect(0,35,Game.BLOCK_SIZE,Game.BLOCK_SIZE);                                              rect(30,35,Game.BLOCK_SIZE,Game.BLOCK_SIZE);

    popMatrix();
  }
}
