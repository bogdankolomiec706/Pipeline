class Manager  //<>//
{
  ArrayList<Item> Items;

  Manager()
  {
    this.Items = new ArrayList<Item>();
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
      lastItem = new Item(ItemType.Block, new Point(width/2, height/2-50), 10, 100);
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

    void Display()
    {
      for (int i = 0; i < this.Items.size(); i=i+1)
      {
        Item currentItem = this.Items.get(i);
        currentItem.Display();
      }
    }

    void Move(int speed)
    {
      for (int i = 0; i < this.Items.size(); i=i+1)
      {
        Item currentItem = this.Items.get(i);
        currentItem.Move(speed);
      }
    }

    int ItemsTotalWidth()
    {
      int L = 0;
      for (int i = 0; i < this.Items.size(); i=i+1)
      {
        Item currentItem = this.Items.get(i);
        L = L + currentItem.Width;
      }
      return L;
    }
  }