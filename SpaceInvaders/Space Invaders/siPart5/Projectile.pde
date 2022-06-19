public class Projectile extends SpaceObject 
{
  //private int x;
  //private int y;
  //private float speed;

  public Projectile(int x)
  {    
    super(x,height-25,16.0);
  }

  //public int getX()  // remove this method when SpaceObject is implemented in a later part of the assignment
  //{
   // return x;
  //}

  //public int getY()  // remove this method when SpaceObject is implemented in a later part of the assignment
  //{
   // return y;
  //}

  public String toString()
  {
    return "[Projectile:x="+getX()+";y="+getY()+";speed="+getSpeed()+"]";
  }  
  
  public boolean intersect(int x, int y)
  {
    if (dist(x+1, y+1, getX()*getSpeed(), getY()) < 22.5)
      return true;
    else
      return false;
  }

  //
  // Add your code ABOVE this method
  //

  public void display() // CAREFUL HOW YOU MODIFY THIS CODE!!
  {
    fill(0, 255, 0);
    stroke(0, 255, 0);

    pushMatrix();

    setY(getY()-((int)getSpeed()*1));    
    translate(getX(), getY());
    //rect(15,-70,Game.BLOCK_SIZE,Game.BLOCK_SIZE);   // 15
    rect(21, -60, 3, 3);                                 // 3

    popMatrix();
  }
}
