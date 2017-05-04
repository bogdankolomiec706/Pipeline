class Item
{
  Point P1,P2,P3,P4;
  int Height, Width;
  ItemType Type;
  
  //constructor for Link
  Item(ItemType type, Point p1, Point p2, Point p3, Point p4)
  {
    this.Type = type;
    this.P1 = p1; 
    this.P2 = p2; 
    this.P3 = p3; 
    this.P4 = p4;
    this.Width = this.P2.X - this.P1.X;
    this.Height = this.P3.Y - this.P2.Y;
  }
  
  //constructor for Block
  Item(ItemType type, Point p, int w, int h)
  {
    this.Type = type;
    this.Width = w; this.Height = h;
    this.P1 = p; 
    this.P2 = new Point(P1.X + this.Width, P1.Y);
    this.P3 = new Point(P2.X, P2.Y + this.Height);
    this.P4 = new Point(P1.X, P3.Y);
  }
  
  void Display()
  {
    if(this.Type == ItemType.Block)
    {
      rect(this.P1.X, this.P1.Y, this.Width, this.Height);
    }
    else if(this.Type == ItemType.Link)
    {
      quad(this.P1.X, this.P1.Y, 
      this.P2.X, this.P2.Y, 
      this.P3.X, this.P3.Y, 
      this.P4.X, this.P4.Y);
    }
  }
  
  void PrintInfo()
  {
    println("-------Item---------");
    println("Width: "+this.Width);
    println("Height: "+this.Height);
    println("P1:{"+this.P1.X,"; "+this.P1.Y+"}");
    println("P1:{"+this.P2.X,"; "+this.P2.Y+"}");
    println("P1:{"+this.P3.X,"; "+this.P3.Y+"}");
    println("P1:{"+this.P4.X,"; "+this.P4.Y+"}");
    println("Type:"+this.Type.toString());
  }
  
  void Move(int speed)
  {
    this.P1.X = this.P1.X - speed;
    this.P2.X = this.P2.X - speed;
    this.P3.X = this.P3.X - speed;
    this.P4.X = this.P4.X - speed;
  }
}

enum ItemType { Link, Block }