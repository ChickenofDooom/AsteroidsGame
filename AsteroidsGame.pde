//your variable declaration
 SpaceShip bob = new SpaceShip();
Star[] stars;

public void setup() {
  size(1000, 1000);
 
   stars = new Star[150];
  for( int i =0; i<stars.length; i++){
   stars[i]= new Star(); 
  }
  //your code here
}
public void draw() {
  background(0);
  bob.move();
  bob.show();
  for( int i =0; i<stars.length; i++){
   stars[i].show(); 
  }
  //your code here
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



