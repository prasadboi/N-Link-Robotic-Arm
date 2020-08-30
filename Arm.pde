// stores the individual properties of every arm/link
class Arm
{
  float xPos; // associated joint's X position
  float yPos; // associated joint's Y position
  float armLen; // length of link/arm
  //Arm parent; // contains info of the arm just before the current arm
  float angle;
  Arm parent;// previous arm / arm which current arm is linked to
  
  // Constructors of class Arm
  Arm()
  {
    this.xPos = 0;
    this.yPos = 0;
    this.armLen = 100;
    this.angle = 0;
    this.parent = null ;
  }

  Arm(float X , float Y , float Len , float A)
  {
      this.xPos = X;
      this.yPos = Y;
      this.armLen = Len;
      this.angle = A;

  }

  // storing the final location the endpoint of the arm
  float armEndX()
  {
      float xPosFin = this.xPos + (this.armLen * cos(this.angle));
      return xPosFin ;
  }

  float armEndY()
  {
      float yPosFin = this.yPos + (this.armLen * sin(this.angle));
      return yPosFin ;
  }
  
  // Displaying the arm on the screen
  void printArm()
  {
      stroke(0);
      strokeWeight(3);
      line(xPos,yPos,this.armEndX(), this.armEndY()); // the arm extends from the joint(xPos,yPos) to the endpoint given by(armEndX, armEndY)
  }

// function that points towards a set of coordinates(x,y)
  void point_at(float x, float y)
  {
      float dx = x - this.xPos ;
      float dy = y - this.yPos;
      this.angle = atan2(dy,dx);
  }

  // orients (sort of ) the links towards the points
   void drag(float x, float y)
   {
       this.point_at(x, y);
       this.xPos = x - cos(this.angle)*this.armLen ;
       this.yPos = y - sin(this.angle)*this.armLen ;
       if(this.parent != null)
       {
           this.parent.drag(this.xPos, this.yPos);
       }
   }

  
}
