NLinksSystem system; 

public void settings()
{
    size(600,600);
}
void setup()
{
    system = new NLinksSystem(width/2, height/2,3);
}
void draw()
{
  background(255);
  system.addArm(100);
  system.addArm(100);
  system.addArm(50);
  system.printArms();
}

void mousePressed()
{
     system.reach(mouseX , mouseY);
}
