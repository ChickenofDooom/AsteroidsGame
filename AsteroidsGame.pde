//your variable declaration
 SpaceShip bob = new SpaceShip();
/*Asteroid[] asteroids= new Asteroid[6];*/
Star[] stars;
/*Asteroid asteroids= new Asteroid();*/
 ArrayList <Asteroid> asteroids;
public void setup() {
  background(0);
  size(1000, 1000);
 
   stars = new Star[150];
  asteroids= new ArrayList <Asteroid>();
  for( int i =0; i<stars.length; i++){
   stars[i]= new Star(); 
  }
 for(int i =0; i<5;i++){
   
   asteroids.add(new Asteroid());
 
 }
 
 /*for(int j = 0; j < asteroids.size(); j++)
  {
    asteroids[j]= new Asteroid();
  }*/
  
  //your code here
}
public void draw() {
  background(0);
  bob.move();
  bob.show();
  for( int i =0; i<stars.length; i++){
   stars[i].show(); 
  }
    /*for(int j= 0; j < asteroids.length; j++)
  { 
    asteroids[j].move();
    asteroids[j].show();
  } */
  //your code here
 
 /* asteroids.move();
  asteroids.show();
  System.out.println(asteroids.getX() + ", " + asteroids.getY());*/
  for (int i=0; i<asteroids.size();i++){
   asteroids.get(i).move();
  asteroids.get(i).show(); 
    
  }
  
}
public void keyPressed()
{
  if (key=='w') {
    bob.accelerate(0.25);
  }
  if (key=='a') {
    bob.rotate(-10) ;
  }
  if (key=='s') {
    bob.accelerate(-0.25);
  }
  if (key=='d') {
    bob.rotate(10);
  }
  if (key==' '){
    bob.setX((int)(Math.random()*1000));
    bob.setY((int)(Math.random()*1000));
    bob.setPointDirection((int)(Math.random()*360));
  }
}
class Star{
  int x,y;
  Star(){
    x = (int)(Math.random()*1000);
    y = (int)(Math.random()*1000);
  }
 
void show(){
  fill(255);
 ellipse((int)x,(int)y,2,2);
}

}
  class SpaceShip extends Floater {
    public SpaceShip() {
      corners=4;
      xCorners= new int [corners];
      yCorners= new int [corners];
      xCorners[0]= 12;
      yCorners[0]= 0;
      xCorners[1]= -8;
      yCorners[1]= 8;
      xCorners[2]= -4;
      yCorners[2]= 0;
      xCorners[3] =-8;
      yCorners[3]= -8;
      myColor=200;
      myCenterX=500;
      myCenterY=500;
      myDirectionX=0.0;
      myDirectionY=0.0;
      myPointDirection=0.0;


    }
    public void setX(int x) {
      myCenterX=x;
    }
    public int getX() {
      return (int)myCenterX;
    }
    public void setY(int y) {
      myCenterY=y;
    }
    public int getY() {
      return (int)myCenterY;
    }
    public void setDirectionX( double x) {
      myDirectionX=x;
    }
    public double getDirectionX() {
      return myDirectionX;
    }
    public void setDirectionY(double y) {
      myDirectionY=y;
    }
    public double getDirectionY() {
      return myDirectionY;
    }
    public void setPointDirection(int degrees) {
      myPointDirection=degrees;
    }  
    public double getPointDirection() {
      return myPointDirection;
    }
    //your code here
  }
class Asteroid extends Floater{
  private int rotSpeed; 
  public Asteroid(){
    if (Math.random()<0.5){
     rotSpeed=1; 
    } else
    {rotSpeed=-1;
    }
      corners=4;
     xCorners= new int [corners];
      yCorners= new int [corners];
      xCorners[0]= 12;
      yCorners[0]= 0;
      xCorners[1]= -8;
      yCorners[1]= 8;
      xCorners[2]= -4;
      yCorners[2]= 0;
      xCorners[3] =-8;
      yCorners[3]= -8;
      myColor=color(200);
      myCenterX=Math.random()*1000;
      myCenterY=Math.random()*1000;
      myDirectionX=((Math.random()*4)-2);
      myDirectionY=((Math.random()*4)-2);
      myPointDirection=0.0;

  }
  public void setX(int x) {
      myCenterX=x;
    }
    public int getX() {
      return (int)myCenterX;
    }
    public void setY(int y) {
      myCenterY=y;
    }
    public int getY() {
      return (int)myCenterY;
    }
    public void setDirectionX( double x) {
      myDirectionX=x;
    }
    public double getDirectionX() {
      return myDirectionX;
    }
    public void setDirectionY(double y) {
      myDirectionY=y;
    }
    public double getDirectionY() {
      return myDirectionY;
    }
    public void setPointDirection(int degrees) {
      myPointDirection=degrees;
    }  
    public double getPointDirection() {
      return myPointDirection;
    }
    public void move()
    {
      rotate(rotSpeed);
      super.move();
    }
  
}
  abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class
  {  
    protected int corners;  //the number of corners, a triangular floater has 3  
    protected int[] xCorners;  
    protected int[] yCorners;  
    protected int myColor;  
    protected double myCenterX, myCenterY; //holds center coordinates  
    protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel  
    protected double myPointDirection; //holds current direction the ship is pointing in degrees  
    abstract public void setX(int x); 
    abstract public int getX();  
    abstract public void setY(int y);  
    abstract public int getY();  
    abstract public void setDirectionX(double x);  
    abstract public double getDirectionX();  
    abstract public void setDirectionY(double y);  
    abstract public double getDirectionY();  
    abstract public void setPointDirection(int degrees);  
    abstract public double getPointDirection();
    //Accelerates the floater in the direction it is pointing (myPointDirection)  
    public void accelerate (double dAmount)  
    {        
      //convert the current direction the floater is pointing to radians  
      double dRadians =myPointDirection*(Math.PI/180);   
      //change coordinates of direction of travel  
      myDirectionX += ((dAmount) * Math.cos(dRadians));  
      myDirectionY += ((dAmount) * Math.sin(dRadians));
    }  
    public void rotate (int nDegreesOfRotation)  
    {   
      //rotates the floater by a given number of degrees  
      myPointDirection+=nDegreesOfRotation;
    }
    public void hyperspace(){
      myCenterX=Math.random()*400;
      myCenterY=Math.random()*400;
    
    }
    public void move ()   //move the floater in the current direction of travel
    {    
      //change the x and y coordinates by myDirectionX and myDirectionY     
      myCenterX += myDirectionX;  
      myCenterY += myDirectionY;   
      //wrap around screen  
      if (myCenterX >width)
      {   
        myCenterX = 0;
      } else if (myCenterX<0)
      {   
        myCenterX = width;
      }  
      if (myCenterY >height)
      {  
        myCenterY = 0;
      } else if (myCenterY < 0)
      {   
        myCenterY = height;
      }
    }  
    public void show ()  //Draws the floater at the current position 
    {           
      fill(myColor);  
      stroke(myColor);  
      //convert degrees to radians for sin and cos       
      double dRadians = myPointDirection*(Math.PI/180);               
      int xRotatedTranslated, yRotatedTranslated;    
      beginShape(); 
      for (int nI = 0; nI < corners; nI++)  
      {   
        //rotate and translate the coordinates of the floater using current direction
        xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);   
        yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);    
        vertex(xRotatedTranslated, yRotatedTranslated);
      }  
      endShape(CLOSE);
    }
  }



