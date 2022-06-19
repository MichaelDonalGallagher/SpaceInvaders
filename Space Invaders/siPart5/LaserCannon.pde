public class LaserCannon extends SpaceObject 
{
  //private Line line;
  //private int x;
  //private int y;
  private Projectile projectile;
  private int[] template = {0,1,0,1,1,1,1,1,1};
  
  public LaserCannon(Line line)
  {
    super(0,line.getLineY(),line);
    this.projectile=null;
  }
  
  void incX(int direction) 
  {
    setX(getX()+direction);
  }

  public void reloadProjectile()
  {
    projectile=null;
  }

  public Projectile getProjectile()
  {
    return projectile;
  }

  public void fire()
  {
    projectile = new Projectile(getX());
  }
  
  public String toString()
  {
     return "[LaserCannon:line="+getLine()+"x="+getX()+";y="+getY()+"]"; 
  }

  //
  // Add your code ABOVE this method
  //
  
  public void display() // CAREFUL HOW YOU MODIFY THIS CODE!!
  {
    fill(Game.LASERCANNON_COLOUR_GREEN);
    stroke(153);

    pushMatrix();   
    //translate(getX(), getY());    
    translate(getX(), getY());

                                                 rect(Game.BLOCK_SIZE*1, 5,Game.BLOCK_SIZE,Game.BLOCK_SIZE);
    rect( 0,20,Game.BLOCK_SIZE,Game.BLOCK_SIZE); rect(Game.BLOCK_SIZE*1,20,Game.BLOCK_SIZE,Game.BLOCK_SIZE); rect(Game.BLOCK_SIZE*2,20,Game.BLOCK_SIZE,Game.BLOCK_SIZE);
    rect( 0,35,Game.BLOCK_SIZE,Game.BLOCK_SIZE); rect(Game.BLOCK_SIZE*1,35,Game.BLOCK_SIZE,Game.BLOCK_SIZE); rect(Game.BLOCK_SIZE*2,35,Game.BLOCK_SIZE,Game.BLOCK_SIZE);

    popMatrix();
  }
}
