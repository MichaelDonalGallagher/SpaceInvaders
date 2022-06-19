public class Bunker extends SpaceObject implements Blockable
{ 
  //private Line line;
  //private int x;
  //private int y;

  public Bunker(Line line, int x)
  {
    super(x-(Game.BUNKER_WIDTH_AND_HEIGHT/2), line.getLineY(), line);
  }

  public String toString()
  {
    return "[Bunker:line="+getLine()+"x="+getX()+";y="+getY()+"]";
  }

  public boolean intersect(int x, int y)
  {
    if (dist(x+1, y+1, getX()*getSpeed(), getY()) < 22.5)
      return true;
    else
      return false;
  }

  public boolean blocksProjectile(Projectile Projectile)
  {
    if (this.intersect(Projectile.getX(), Projectile.getY())==true)
      return true;
    else 
    return false;
  }

  //
  // Add your code ABOVE this method
  //

  public void display() // CAREFUL HOW YOU MODIFY THIS CODE!!
  {
    fill(Game.BUNKER_COLOUR_GREEN);
    stroke(153);

    pushMatrix();    
    translate(getX(), getY());

    rect(0, 5, Game.BLOCK_SIZE, Game.BLOCK_SIZE); 
    rect(15, 5, Game.BLOCK_SIZE, Game.BLOCK_SIZE); 
    rect(30, 5, Game.BLOCK_SIZE, Game.BLOCK_SIZE); 
    rect(45, 5, Game.BLOCK_SIZE, Game.BLOCK_SIZE);
    rect(0, 20, Game.BLOCK_SIZE, Game.BLOCK_SIZE); 
    rect(15, 20, Game.BLOCK_SIZE, Game.BLOCK_SIZE); 
    rect(30, 20, Game.BLOCK_SIZE, Game.BLOCK_SIZE); 
    rect(45, 20, Game.BLOCK_SIZE, Game.BLOCK_SIZE);
    rect(0, 35, Game.BLOCK_SIZE, Game.BLOCK_SIZE); 
    rect(15, 35, Game.BLOCK_SIZE, Game.BLOCK_SIZE); 
    rect(30, 35, Game.BLOCK_SIZE, Game.BLOCK_SIZE); 
    rect(45, 35, Game.BLOCK_SIZE, Game.BLOCK_SIZE);

    popMatrix();
  }
}
