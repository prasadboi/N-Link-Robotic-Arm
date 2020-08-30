// class for the entire link system
class NLinksSystem
{
    float xPos;// base point X-coordinate
    float yPos;// base point Y-coordinate
    Arm lastArm;
    ArrayList<Arm> arms;// array that stores information about all the arms
    int armNum;

//Constructors
NLinksSystem()
{
    this.xPos = 0 ;
    this.yPos = 0;
    arms = new ArrayList<Arm>();
    this.lastArm = null;
    this.armNum = 1;
}

NLinksSystem(float x, float y, int units)
{
    this.xPos = x;
    this.yPos = y;
    arms = new ArrayList<Arm>();
    armNum = units;
}

// function to add arm to the system
// NOTE : you can add arms only upto the number of units specified by you in the constructor
void addArm(float len)
{
  if(this.arms.size() < armNum)
  {
    Arm arm1 ;
    arm1 = new Arm(0,0,len,PI/2);
    if(this.lastArm != null)
    {
        arm1.xPos = this.lastArm.armEndX();
        arm1.yPos = this.lastArm.armEndY();
        arm1.parent = this.lastArm;
    }
    else 
    {
        arm1.xPos = this.xPos;
        arm1.yPos = this.yPos;        
    }
    this.arms.add(arm1);
    this.lastArm = arm1;
  }
}

// function to print all the linked arms
void printArms()
{
    for(int i = 0; i < this.arms.size() ; i++ )
    {
        Arm current = this.arms.get(i);
        current.printArm();
    }
}

// orients all arms towards (x,y) (sort of)

void Drag(float x, float y)
{
    this.lastArm.drag(x,y);
}


void update()
{
    for(int i = 0; i < this.arms.size() ; i++)
    {
        Arm current = this.arms.get(i);
        if(current.parent != null)
        {
            current.xPos = current.parent.armEndX();
            current.yPos = current.parent.armEndY();
        }
        else
        {
            current.xPos = this.xPos;
            current.yPos = this.yPos;
        }

    }
    
}

void reach(float x, float y)
{
    this.Drag(x, y);
    this.update();
}
}
