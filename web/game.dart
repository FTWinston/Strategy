library strategy;

import 'dart:html';
import 'board.dart';
export 'package:polymer/init.dart';

final InputElement slider_width = querySelector("#width");
final InputElement slider_height = querySelector("#height");

final CanvasRenderingContext2D context =
  (querySelector("#canvas") as CanvasElement).context2D;

Board board;
int width; int height;

void main()
{
  slider_width.onChange.listen((e) => draw());
  slider_height.onChange.listen((e) => draw());
  draw();
}

void draw() {
  width = int.parse(slider_width.value);
  height = int.parse(slider_height.value);
  
  board = new Board(width, height);
  
  context.clearRect(0, 0, 500, 500);
  num cellSize = 30; num border = 2;
  
  for (int y = 0; y < board.height; y++) {
    bool even = y % 2 == 0; 
    for (int x = 0; x < board.width; x++) {
      board.cells[y][x].draw(context, cellSize, border, even);
    }
  }
}