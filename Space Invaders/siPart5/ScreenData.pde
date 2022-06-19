public class ScreenData
{
  private int score;
  private int lives;
  private int misses;

  public ScreenData()
  {
    score=0;
    lives=Game.INITIAL_LIVES;
    misses=0;
  }

  public int getScore()
  {
    return score;
  }

  public void setScore(int score)
  {
    this.score = score;
  }

  public void incScore(int value)
  {
    score += value;
  }
  
  public int getMisses()
  {
    return misses;
  }
  
  public void incMisses()
  {
    misses += 1;
  }

  public int getLives()
  {
    return lives;
  }

  public void setLives(int lives)
  {
    this.lives = lives;
  }

  public void addLife()
  {
    lives += 1;
  }

  public void loseLife()
  {
    lives -= 1;
  }

  public String toString()
  {
    return "[ScreenData:score="+score+";lives="+lives+"]";
  }

  public void display()
  {
    textSize(28);
    fill(153);    
    // display lives and score
    text("Score: "+getScore(), 0, 28);
    text("Misses: "+getMisses(), 0, 56);
    text("Lives: "+getLives(), 10, 590);
    
    fill(51, 235, 28);
    stroke(153);
    // display minature laser cannons later
    if (lives > 2)
    {
      rect(150, 570, 5, 5);
      rect(145, 575, 15, 15);
    }
    if (lives>1)
    {
      rect(130, 570, 5, 5);
      rect(125, 575, 15, 15);
    }
  }
}
