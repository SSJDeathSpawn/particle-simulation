#ifndef CELLS_H
#define CELLS_H
#include "../utils/basic.h"
#include <stdbool.h>

#define CELL_LAST WATER
typedef enum CellEnum {
  NONE,
  SAND,
  WATER,
} CellEnum;

typedef struct Cell {
  CellEnum type;
} Cell;

typedef struct Grid {
  int rows;
  int cols;
  int width;
  int height;
  Vector2f size;
  Cell** cells;
} Grid;

// Grid grid, int x, int y
typedef void (*cell_rule_func_ptr)(Grid*, int, int);

//Apply rule checks for types and applies the right cell_rule_func_ptr
Cell newCell(CellEnum type);
Grid newGrid(int x, int y, int totalWidth, int totalHeight);
void destroyGrid(Grid grid);

#endif // !CELLS_H
