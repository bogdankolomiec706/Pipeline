class User
{
  int D;
  Point P;
  Color C;
  
  User() { }
  
  User(int d, int x, int y)
  {
    this.D = d; this.P = new Point(x,y);
    this.C = new Color();
  } 
  
  User(int d, int x, int y, int r, int g, int b)
  {
    this.D = d; this.P = new Point(x,y); 
    this.C = new Color(r, g, b);
  }
  
  User(int d, int x, int y, int r, int g, int b, int o)
  {
    this.D = d; this.P = new Point(x,y); 
    this.C = new Color(r, g, b, o);
  }
  
  void Move()
  {
    this.P.Y = mouseY;
  }
  
  void Display()
  {
    fill(C.Red, C.Green, C.Blue, C.Opacity);
    ellipse(P.X, P.Y, D, D);
  }
}