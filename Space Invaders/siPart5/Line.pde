public class Line
{
  private int[] lineY = {50, 100, 150, 200, 250, 300, 350, 400, 450, 500, 550, 600, 650, 700};  // y values of game lines 0..13
  private int lineNumber;

  public Line(int lineNumber) throws InvalidLineNumberException
  {
    try{
    if (lineNumber<0 || lineNumber>9)
      throw new InvalidLineNumberException();
    
    }
    catch(InvalidLineNumberException e)
    {
       println(e.getMessage());
       exit();
    }
    this.lineNumber=lineNumber;
  }

  public void setLineNumber(int number)
  {
    this.lineNumber=number;
  }

  public int getLineNumber()
  {
    return this.lineNumber;
  }

  public int getLineY()
  {
    // returns line y value
    return lineY[lineNumber];
  }

  public String toString()
  {
    return "[Line:lineNumber="+lineNumber+"];";
  }
}
