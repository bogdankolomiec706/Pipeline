Manager Manager; //<>// //<>// //<>//
User User;
void setup()
{
  size(1000, 800);
  Manager = new Manager(3, 4);
  User = new User(25, width/2, height/2, 15, 130, 210);
}

void draw()
{
  background(200);
  if (Manager.CheckTimer() == true)
  {
    Manager.GenerateItem();
    Manager.DeleteItem();
    Manager.Move();
    Manager.DisplayItems();
    Manager.DisplaySpeed(width/4, 50);
    Manager.DisplayScore(width/2, 50);
    Manager.DisplayTimer(3*width/4, 50);
    Manager.ChangeItemsSpeed();
    if (millis() > 3000)
    {
      Manager.CheckIntersection(User);
    }
    User.Display();
    User.Move();
  }
  else
  {
    Manager.DisplayFinishScreen();
  }
}