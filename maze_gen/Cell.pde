class Cell
{
  int x;
  int y;
  boolean[] walls  = {true,true,true,true};
  boolean visited = false;
  
  Cell(int i, int j)
  {
    x = i;
    y = j;
    //top right bottom left
    
  }
  
  void highlight()
  {
    int thisX = x*scale;
    int thisY = y*scale;
    noStroke();
    fill(0,0,255,50);
    rect(thisX,thisY,scale,scale);
  }
  
  void display()
  {
    int thisX = x*scale;
    int thisY = y*scale;
    stroke(255);
    if(walls[0])
    {
      //top line
      line(thisX,thisY,thisX+scale,thisY);
    }
    if(walls[1])
    {
      //right
      line(thisX+scale,thisY,thisX+scale,thisY+scale);
    }
    if(walls[2])
    {
      //bottom
      line(thisX+scale,thisY+scale,thisX,thisY+scale);
    }
    if(walls[3])
    {
      //left
      line(thisX,thisY+scale,thisX,thisY);
    }
    
    if(visited)
    {
      fill(255,0,255,100);
      noStroke();
      rect(thisX,thisY,scale,scale);
    }
    
  }
  
  int getIndex(int i, int j)
  {
    if(i < 0 || j < 0 || i > cols-1 || j > rows-1)
    {
      return -1;
    }
    return (i+j*cols);
  }
  
  Cell checkNeighbors()
  {
    ArrayList<Cell> neighbors = new ArrayList<Cell>();
    Cell top = null;
    Cell right = null;
    Cell bottom = null;
    Cell left = null;
    int topindex = getIndex(x,y-1);
    if(topindex != -1)
    {
       top = grid.get(topindex);
    }
    int rightindex = getIndex(x+1,y);
    if(rightindex != -1)
    {
      right = grid.get(rightindex);
    }
    int bottomindex = getIndex(x,y+1);
    if(bottomindex != -1)
    {
      bottom = grid.get(bottomindex);
    }
    int leftindex = getIndex(x-1, y);
    if(leftindex != -1)
    {
      left = grid.get(leftindex);
    }

    if(top != null && !top.visited)
    {
      neighbors.add(top);
    }
    if(right != null && !right.visited)
    {
      neighbors.add(right);
    }
    if(bottom != null && !bottom.visited)
    {
      neighbors.add(bottom);
    }
    if(left != null && !left.visited)
    {
      neighbors.add(left);
    }
    
    if(neighbors.size() > 0)
    {
      int r = (int)random(0,neighbors.size());
      return neighbors.get(r);
    }
    else
    {
      return null;
    }
    
  }
}
