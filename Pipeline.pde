Manager Manager;
void setup()
{
  size(800,700);
  Manager = new Manager();
}

void draw()
{
  background(200);
  Manager.GenerateItem(); //<>//
  Manager.DeleteItem();
  Manager.Move(5); //<>//
  Manager.Display(); //<>//
}