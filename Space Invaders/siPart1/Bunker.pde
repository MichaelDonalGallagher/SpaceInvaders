public class Bunker 
{ 
  private Line line;
  private int x;
  private int y;
    
  public Bunker(Line line, int x)
  {
    this.line=line;
    this.x=x-(Game.BUNKER_WIDTH_AND_HEIGHT/2);   
    this.y=line.getLineY();
  }
  
  public String toString()
  {
     return "[Bunker:line="+line+"x="+x+";y="+y+"]"; 
  }

  //
  // Add your code ABOVE this method
  //
  
  public void display() // CAREFUL HOW YOU MODIFY THIS CODE!!
  {
    fill(Game.BUNKER_COLOUR_GREEN);
    stroke(153);

    pushMatrix();    
    translate(this.x, this.y);
        
    rect(0, 5,Game.BLOCK_SIZE,Game.BLOCK_SIZE); rect(15, 5,Game.BLOCK_SIZE,Game.BLOCK_SIZE); rect(30, 5,Game.BLOCK_SIZE,Game.BLOCK_SIZE); rect(45, 5,Game.BLOCK_SIZE,Game.BLOCK_SIZE);
    rect(0,20,Game.BLOCK_SIZE,Game.BLOCK_SIZE); rect(15,20,Game.BLOCK_SIZE,Game.BLOCK_SIZE); rect(30,20,Game.BLOCK_SIZE,Game.BLOCK_SIZE); rect(45,20,Game.BLOCK_SIZE,Game.BLOCK_SIZE);
    rect(0,35,Game.BLOCK_SIZE,Game.BLOCK_SIZE); rect(15,35,Game.BLOCK_SIZE,Game.BLOCK_SIZE); rect(30,35,Game.BLOCK_SIZE,Game.BLOCK_SIZE); rect(45,35,Game.BLOCK_SIZE,Game.BLOCK_SIZE);

    popMatrix();
  }

}
