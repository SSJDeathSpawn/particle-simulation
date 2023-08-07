#include "cells.h"
#include "glad/glad.h"
#include "stdlib.h"

Cell newCell(CellEnum type){
  return (Cell) {
    .type=type
  };
}

Grid newGrid(int x, int y, int totalWidth, int totalHeight) {
  float perCellWidth = ((float)totalWidth) / ((float)x);
  float perCellHeight = ((float)totalHeight) / ((float)y);
  Vector2f size = {.x= perCellWidth, .y=perCellHeight};
  Cell** res = (Cell**) malloc(y*sizeof(Cell*));
  for(int i=0;i<y;i++) {
    res[i] = (Cell*) malloc(x*sizeof(Cell));
  }

  for(int i=0;i<y;i++) {
    for(int j=0;j<x;j++) {
      res[i][j] = (Cell) {
        .type = NONE
      };
    }
  }

  return (Grid) {
    .width = totalWidth,
    .height = totalHeight,
    .rows=y, 
    .cols=x, 
    .size = {
      .x = size.x,
      .y = size.y
    },
    .cells=res, 
  };
}

void destroyGrid(Grid grid) {
  for(int i=0;i<grid.rows;i++) {
    free(grid.cells[i]);
  }
  free(grid.cells);
}
