public class Game
{
  public static final int BLOCK_SIZE = 15;
  public static final int BUNKER_WIDTH_AND_HEIGHT = 40;  
  public static final int INITIAL_LIVES = 3;   
  public static final int LEFT = -1;
  public static final int RIGHT = 1;
  public static final int FIRE = 0;
  public static final int LASERCANNON_STEP = 10;  
  public static final int SCREEN_LINES = 12;
  public static final int SCREEN_LINE_HEIGHT = 50;  
  public static final int SPACESHIP_WIDTH = 45;  
  public static final int MIN_ALIENS_IN_LINE = 8;
  public static final int ALIEN_COLOUR_WHITE = #ffffff;
  public static final int ALIEN_COLOUR_HIT = #ff00ff;
  public static final int LASERCANNON_COLOUR_GREEN = #34eb1c;
  public static final int BUNKER_COLOUR_GREEN = #34eb1c;
  public static final int MYSTERYSHIP_COLOUR_GREEN = #ff0000;

  private int BUNKER_X[] = {120, 240, 360, 480};
  private int ALIEN_X[] =  {0, 60, 120, 180, 240, 300, 360, 420};  
  private Bunker bunker1, bunker2, bunker3, bunker4;
  private LaserCannon laserCannon;  
  private Octopus octopus;
  //private ArrayList<Octopus> octopuses = new ArrayList<Octopus>();
  private ArrayList<Alien> aliens = new ArrayList<Alien>();
  private ArrayList<Bunker> bunkers = new ArrayList<Bunker>();
  private MysteryShip mysteryShip;
  private ScreenData screenData;

  public Game()
  {    
    // create bunkers
    try {
      bunkers.add(bunker1 = new Bunker(new Line(8), BUNKER_X[0]));
      bunkers.add(bunker2 = new Bunker(new Line(8), BUNKER_X[1]));
      bunkers.add(bunker3 = new Bunker(new Line(8), BUNKER_X[2]));
      bunkers.add(bunker4 = new Bunker(new Line(8), BUNKER_X[3]));
      //println(bunker1);

      // create laserCannon
      laserCannon = new LaserCannon(new Line(9));
      //println(laserCannon);

      // create octopus alien
      //octopus = new Octopus(new Line(3),0);    
      //println(octopus);  

      //// In a later part of the assignment you'll use this code to add EIGHT aliens.  For Part 1 leave this code commented out.
      for (int i=0; i<MIN_ALIENS_IN_LINE; i++)
      {
        aliens.add(new Octopus(new Line(3), ALIEN_X[i]));
        aliens.add(new Crab(new Line(2), ALIEN_X[i]));
        aliens.add(new Squid(new Line(1), ALIEN_X[i]));
      }
    }
    catch(InvalidLineNumberException e)
    {
      println(e.getMessage());
      exit();
    }
    // no mystery ship (for now)
    mysteryShip=null;

    // create screenData here
    screenData = new ScreenData();
  }

  public void action(int value)
  {
    switch(value)
    {
    case Game.LEFT:  
      laserCannon.incX(-Game.LASERCANNON_STEP);
      break;
    case Game.RIGHT:  
      laserCannon.incX(Game.LASERCANNON_STEP);
      break;
    case Game.FIRE:   
      if (laserCannon.getProjectile()==null) {
        laserCannon.fire();
        //println(laserCannon.getProjectile());
      }
      break;
    }
  } // action

  public void update()
  {
    // draw screen lines
    gameLines();

    //// display screen data
    screenData.display();

    // try to create a mystery ship (if it doesn't exist)
    if (mysteryShip==null)
    {
      int chance = (int)random(1, 100); // with current framerate we have a 1/10 chance per second that mystery ship is created
      if (chance==1)
      {
        try {
          mysteryShip=new MysteryShip(new Line(0));
        }
        catch(InvalidLineNumberException e)
        {
          println(e.getMessage());
          exit();
        }
        //println(mysteryShip);
      }
    }

    // display octopus(s)
    //octopus.display();  // In Part 1 you may get a runtime error here when you shoot an alien octopus.  You'll sort this with ArrayList solution.
    for (Alien a : aliens)     
      a.display();
    // display mystery ship (if it exists)
    if (mysteryShip!=null)
    {
      if (mysteryShip.visible())
        mysteryShip.display();
      else
        mysteryShip=null;
    }

    // display spaceship
    laserCannon.display();

    // display bunkers
    for (Bunker b : bunkers)
      b.display();

    //// if the projectile is fired - display it and check for collisions
    if (laserCannon.getProjectile()!=null)
    {
      // display the projectile      
      laserCannon.getProjectile().display();

      // check for projectile collisions with bunker(s)
      for (Bunker b : bunkers)
      {
        if (b.blocksProjectile(laserCannon.getProjectile()))
          laserCannon.reloadProjectile();
      }

      // check for projectile collisions with alien(s)
      for (Alien alien : aliens)
      {
        Alien a=null;  // a will store alien to remove
        if (alien.intersect(laserCannon.getProjectile().getX(), laserCannon.getProjectile().getY())==true)
          a=alien;

        if (a instanceof Octopus)
          screenData.incScore(20);
        if (a instanceof Crab)
          screenData.incScore(30);  
        if (a instanceof Squid)
          screenData.incScore(40);

        if (a!=null)
        {
          alien=null;  // remove alien (it exploded in collision)
          aliens.remove(a);
          laserCannon.reloadProjectile();
          background(0, 255, 0);
          return;
        }
      }
      // check for projectile collisions with mystery ship
      if (mysteryShip!=null)
      {
        if (mysteryShip.intersect(laserCannon.getProjectile().getX(), laserCannon.getProjectile().getY())==true)
        {
          mysteryShip=null;
          background(255, 0, 0);
          laserCannon.reloadProjectile();
          screenData.incScore(100);
          return;
        }
      }
      // Part 1 (reload) - check if the projectile goes beyond the top of screen.  If yes reload!
      if (laserCannon.getProjectile().getY() < 0)
      {
        laserCannon.reloadProjectile();
        screenData.incMisses();
        if(screenData.getMisses()%5==0)
          screenData.loseLife();
      }
    }
    for ( Alien a : aliens)
    {
      if (a.getX()==600 || a.getX() ==0)
      {
        for (Alien alien : aliens)
        {
          alien.changeDirection();
          alien.incLine();
        }
        break;
      }
    }
    //Check if aliens reach ship
    for ( Alien a : aliens)
    {
      if (a.getLine().getLineNumber()==9)
      {
        screenData.setLives(0);
      }
    }
    //Game Over
    if(screenData.getLives()==0)
      exit();
  } // update

  public void help()
  {
    println("Welcome to Space Invaders\n\na=LEFT\ns=RIGHT\nSPACE=FIRE\nh=HELP\nq=QUIT");
  }

  public void gameLines()  // allows you to see lines better
  {       
    for (int line=0; line<Game.SCREEN_LINES; line++)
    {
      if (line%2==1)
      {
        fill(20);
        stroke(20);
      } else
      {
        fill(0);
        stroke(0);
      }
      rect(0, line*Game.SCREEN_LINE_HEIGHT, width, Game.SCREEN_LINE_HEIGHT);
    }
  }
}
