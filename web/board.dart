library strategy;

import 'dart:html';

class Board
{
  int width; int height;
  List<List<Cell>> cells; 
  Board(int width, int height)
  {
    this.width = width;
    this.height = height;
    cells = [];
    
    for ( int y = 0; y<height; y++ )
    {
      List<Cell> row = [];
      for ( int x = 0; x<width; x++ )
      {
        row.add(new Cell(x, y)); 
      }
      cells.add(row);
    }
  }
}

class Cell
{
  int x; int y;
  Cell(int x, int y)
  {
    this.x = x;
    this.y = y;
  }
  
  draw(CanvasRenderingContext2D context, num cellSize, num border, bool evenRow) {
    num xpos = evenRow ? x * cellSize : x * cellSize + cellSize / 2;
    
    context..fillStyle = "orange"
        ..fillRect(xpos, y * cellSize + border, cellSize - border - border, cellSize - border - border);
  }
}