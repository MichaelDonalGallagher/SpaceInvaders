public abstract class SpaceObject
{
  private int x, y;
  private float speed;
  private Line line;

  public SpaceObject()
  {
    try {
      this.line=new Line(0);
    }
    catch(InvalidLineNumberException e)
    {
      println(e.getMessage());
      exit();
    }
    this.x=0;
    this.y=0;
    this.speed=1.0;
  }

  public SpaceObject(int x, int y, Line line)
  {
    this.line=line;
    this.x=x;
    this.y=y;
  }

  public SpaceObject(int x, int y, float speed)
  {
    this.x=x;
    this.y=y;
    this.speed=speed;
  }

  public SpaceObject(int x, int y, float speed, Line line)
  {
    this.line=line;
    this.x=x;
    this.y=y;
    this.speed=speed;
  }

  public int getX()
  {
    return x;
  }

  public int getY()
  {
    return y;
  }

  public float getSpeed()
  {
    return speed;
  }

  public Line getLine()
  {
    return line;
  }

  public void setX(int x)
  {
    this.x=x;
  }

  public void setY(int y)
  {
    this.y=y;
  }

  public void setSpeed(float speed)
  {
    this.speed=speed;
  }

  public void setLine(Line line)
  {
    this.line=line;
  }

  public String toString()
  {
    return "[SpaceObject:line="+line+"x="+x+";y="+y+";speed="+speed+"]";
  } 

  public abstract void display();
}
