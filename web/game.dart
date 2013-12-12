library strategy;

import 'dart:html';
export 'package:polymer/init.dart';

final InputElement slider_width = querySelector("#width");
final InputElement slider_height = querySelector("#height");

final CanvasRenderingContext2D context =
  (querySelector("#canvas") as CanvasElement).context2D;

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
  
  context.clearRect(0, 0, 500, 500);
  num cellSize = 30; num border = 2;
  num halfSize = cellSize / 2;
  
  for (int y = 0; y < height; y++) {
    bool even = y % 2 == 0; 
    for (int x = 0; x < width; x++) {
      
      num xpos = even ? x * cellSize : x * cellSize + halfSize;
      
      if ( (x == 0 && y == 0) || (!even && x == width - 1 && y == height - 1) )
        continue;
      
      context..fillStyle = "orange"
             ..fillRect(xpos, y * cellSize + border, cellSize - border - border, cellSize - border - border);
    }
  }
}