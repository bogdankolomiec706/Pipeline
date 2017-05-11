class Manager  //<>//
{
  ArrayList<Item> Items;
  int Speed;
  int Score;
  private float FloatSpeed;
  int TimeLimit;
  Manager(int speed, int timeLimit)
  {
    this.Items = new ArrayList<Item>();
    this.Speed = speed;
    this.FloatSpeed = this.Speed;
    this.Score = 0;
    this.TimeLimit = timeLimit;
  }

  boolean CheckTimer()
  {
    if(this.TimeLimit - millis()/1000 > 0 )
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  boolean CheckIntersection(User user)
  {
    boolean result = false;
    int xR = user.P.X + user.D/2;
    int xL = user.P.X - user.D/2;
    int yT = user.P.Y - user.D/2;
    int yB = user.P.Y + user.D/2;    
    color cR = get(xR+1, user.P.Y);
    color cL = get(xL-1, user.P.Y);
    color cT = get(user.P.X, yT-1);
    color cB = get(user.P.X, yB+1);
    color rectColor = color(255, 255, 255);
    if(cR == rectColor || cL == rectColor || cT == rectColor || cB == rectColor)
    {
      result = true;
      this.Score  = this.Score + 1*(Speed-2);
    }
    else
    {
      this.Score  = this.Score - 1*(Speed-2);
    }
    return result;
  }
  void ChangeItemsSpeed()
  {
    if(keyPressed == true)
    {
      if(key == 'w')
      {
        this.FloatSpeed = this.FloatSpeed + 0.1;
      }
      else if(key == 's' && this.FloatSpeed > 0)
      {
        this.FloatSpeed = this.FloatSpeed - 0.1;
      }
      if(this.FloatSpeed < 0)
      {
        this.FloatSpeed = 0;
      }
      this.Speed = floor(this.FloatSpeed);
    }
  }
  
  void DisplayFinishScreen()
  {
    textSize(60);
    fill(250, 0, 0);
    textAlign(CENTER);
    text("Game finished!", width/2, height/2);
    fill(0, 0, 0);
    text("Your score: "+this.Score, width/2, height/2+100);    
  }
  
  void DisplaySpeed(int x, int y)
  {
    textSize(32);
    textAlign(CENTER);
    fill(0, 102, 153);
    text("Speed = "+ this.Speed, x, y);
  }
  
  void DisplayScore(int x, int y)
  {
    textSize(32);
    textAlign(CENTER);
    fill(0, 102, 153);
    text("Score = "+ this.Score, x, y);
  }
  
  void DisplayTimer(int x, int y)
  {
    textSize(32);
    textAlign(CENTER);
    fill(0, 102, 153);
    text("Time = "+ (this.TimeLimit - millis()/1000), x, y);
  }
  
  void GenerateItem()
  {
    int itemsNumber = this.Items.size();

    Item lastItem;
    if (itemsNumber > 0)
    {
      lastItem = this.Items.get(this.Items.size()-1);
      //lastItem.PrintInfo();
    } 
    else
    {
      //for the first time 
      lastItem = new Item(ItemType.Block, new Point(width-10, height/2-50), 10, 100);
      //lastItem.PrintInfo();
    }

    if (lastItem.P3.X <= width)
    {
      //generate block that feet to window size
      int blockWidth = round(random(0.1*width, 0.5*width));
      int blockHeight = round(random(0.1*height, 0.2*height));
      int blockTopY; 
      int blockBottomY;
      do
      {
        blockTopY = round(random(10, height-20));
        blockBottomY = blockTopY + blockHeight;
        if (blockBottomY + 10 <= height)
        {
          break;
        }
      } 
      while (true);

      //generate link with previous block
      int linkWidth = round(random(0.2*width, 0.5*width));
      Point linkP1 = new Point(lastItem.P2.X, lastItem.P2.Y);
      Point linkP2 = new Point(lastItem.P2.X+linkWidth, blockTopY);
      Point linkP3 = new Point(lastItem.P2.X+linkWidth, blockBottomY);
      Point linkP4 = new Point(lastItem.P2.X, lastItem.P3.Y);
      //create link
      Item linkItem = new Item(ItemType.Link, linkP1, linkP2, linkP3, linkP4);
      //create block
      Point blockPoint = new Point(linkP2.X, linkP2.Y);
      Item blockItem = new Item(ItemType.Block, blockPoint, blockWidth, blockHeight);
      //add block and link to list
      this.Items.add(linkItem);
      this.Items.add(blockItem);
    }
  }

    void DeleteItem()
    {
      Item item = null;
      int itemsNumber = this.Items.size();
      for (int i=0; i<itemsNumber; i=i+1)
      {
        Item currentItem = this.Items.get(i);
        if (currentItem.P2.X <= 0)
        {
          item = currentItem;
          break;
        }
      }
      if(item != null)
      {
        this.Items.remove(item);
      }
    }

    void DisplayItems()
    {
      for (int i = 0; i < this.Items.size(); i=i+1)
      {
        Item currentItem = this.Items.get(i);
        currentItem.Display();
      }
    }

    void Move()
    {
      for (int i = 0; i < this.Items.size(); i=i+1)
      {
        Item currentItem = this.Items.get(i);
        currentItem.Move(this.Speed);
      }
    }
    
  }