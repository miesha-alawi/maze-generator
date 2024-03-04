import java.util.Stack;

int cols, rows;
int scale = 40;
ArrayList<Cell> grid = new ArrayList<Cell>();
Cell current;
Stack<Cell> stack = new Stack<Cell>();

void setup() 
{
  size(800,800);
  frameRate(5);
  cols = (int)width/scale;
  rows = (int)height/scale;
  
  for(int j = 0; j < rows; j++)
  {
    for(int i = 0; i < cols; i++)
    {
      Cell c = new Cell(i,j);
      grid.add(c);
    }
  }
  
  current = grid.get(0);
}

void draw()
{
  background(0);
  for(int i = 0; i < grid.size(); i++)
  {
    grid.get(i).display();
  }
  
  current.visited = true;
  current.highlight();
  Cell next = current.checkNeighbors();
  if(next != null)
  {
    next.visited = true;
    stack.push(current);
    removeWalls(current,next);
    current = next;
  }
  else if(stack.size() > 0)
  {
    current = stack.pop();
  }

}

void removeWalls(Cell a, Cell b)
{
  int diffX = a.x - b.x;
  switch(diffX)
  {
    case 1:
    {
      a.walls[3] = false;
      b.walls[1] = false;
    }
    case -1:
    {
      a.walls[1] = false;
      b.walls[3] = false;
    }
  }
  int diffY = a.y - b.y;
  switch(diffY)
  {
  case 1:
    {
      a.walls[0] = false;
      b.walls[2] = false;
    }
    case -1:
    {
      a.walls[2] = false;
      b.walls[0] = false;
    }
  }
}
