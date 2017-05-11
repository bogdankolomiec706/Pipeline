class Color
{
  private int Red;
  private int Green;
  private int Blue;
  private int Opacity;
  
  public Color()
  {
    this.Set(0, 0, 0, 255);
  }
  
  public Color(int r, int g, int b)
  {
    this.Set(r, g, b, 255);
  }
  
  public Color(int r, int g, int b, int o)
  {
    this.Set(r, g, b, o);
  }
  
  public void Set(int r, int g, int b)
  { 
    if(r >= 0 && r <= 255)
    {
      this.Red = r;
    }
    else if(r > 255)
    {
      this.Red = 255;
    }
    else if(r < 0)
    {
      this.Red = 0;
    }
    
    if(g >= 0 && g <= 255)
    {
      this.Green = g;
    }
    else if(g > 255)
    {
      this.Green = 255;
    }
    else if(g < 0)
    {
      this.Green = 0;
    }
    
    if(b >= 0 && b <= 255)
    {
      this.Blue = b;
    }
    else if(b > 255)
    {
      this.Blue = 255;
    }
    else if(b < 0)
    {
      this.Blue = 0;
    }
  }
  
  public void SetOpacity(int o)
  {
    if(o >= 0 && o <=255)
    {
      this.Opacity = o;
    }
    else if(o > 255)
    {
      this.Opacity = 255;
    }
    else if(o < 0)
    {
      this.Opacity = 0;
    }
  }

  public void Set(int r, int g, int b, int o)
  {
    Set(r,g,b);
    SetOpacity(o);
  }
}