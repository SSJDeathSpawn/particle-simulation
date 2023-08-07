#include "cells.h"
#include<stdio.h>
#include<stdbool.h>

bool isNotSolid(Grid grid, int x, int y) {
  return grid.cells[y][x].type == NONE || grid.cells[y][x].type == WATER;
}

bool isEmpty(Grid grid, int x, int y) {
  return grid.cells[y][x].type == NONE;
}

void ruleNone(Grid* grid, int x, int y) {}

/*
* Checks if the cell below it is empty, and then moves into it.
* If not, it checks to the right bottom for empty spots, and tries to displace any non-solids
* and replaces any empties and if it still cannot, tries to do the same for the left.
*/
void ruleSand(Grid* grid, int x, int y) {
  if (grid->rows > y+1) {
    if (isNotSolid(*grid, x, y+1)) {
      grid->cells[y][x].type = grid->cells[y+1][x].type;
      grid->cells[y+1][x].type = SAND;
      return;
    } 
    if (grid->cols > x+1)  {
      if (isEmpty(*grid, x+1, y+1)) {
        grid->cells[y][x].type = NONE;
        grid->cells[y+1][x+1].type = SAND;
        return;
      } else if (isNotSolid(*grid, x+1, y+1)) {
        if (grid->cols > x+2 && isEmpty(*grid, x+2, y+1)) {
          grid->cells[y][x].type = NONE;
          grid->cells[y+1][x+2].type = grid->cells[y+1][x+1].type;
          grid->cells[y+1][x+1].type = SAND;
          return;
        } else if (isEmpty(*grid, x+1, y)) {
          grid->cells[y][x].type = NONE;
          grid->cells[y][x+1].type = grid->cells[y+1][x+1].type;
          grid->cells[y+1][x+1].type = SAND; 
          return;
        }
      }
    } 
    if (x > 0) {
      if (isEmpty(*grid, x-1, y+1)) {
        grid->cells[y][x].type = NONE;
        grid->cells[y+1][x-1].type = SAND;
        return;
      } 
      else if (isNotSolid(*grid, x-1, y+1)) {
        if (x > 1 && isEmpty(*grid, x-2, y+1)) {
          grid->cells[y][x].type = NONE;
          grid->cells[y+1][x-2].type = grid->cells[y+1][x-1].type;
          grid->cells[y+1][x-1].type = SAND;
          return;
        } 
        else if (isEmpty(*grid, x-1, y)) {
          grid->cells[y][x].type = NONE;
          grid->cells[y][x-1].type = grid->cells[y+1][x-1].type;
          grid->cells[y+1][x-1].type = SAND; 
          return;
        }
      }
    }
  }
}

void ruleWater(Grid* grid, int x, int y) {
  if (grid->rows > y+1) {
    if (isEmpty(*grid, x, y+1)) {
      grid->cells[y][x].type = grid->cells[y+1][x].type;
      grid->cells[y+1][x].type = WATER;
      return;
    }
    if (grid->cols > x+1) {
      if(isEmpty(*grid, x+1, y+1)) {
        grid->cells[y][x].type = NONE;
        grid->cells[y+1][x+1].type = WATER;
        return;
      } else if (isEmpty(*grid, x+1, y) && (x == 0 || !isEmpty(*grid, x-1, y))) {
        grid->cells[y][x].type = NONE;
        grid->cells[y][x+1].type = WATER;
        return;
      } 
    }
    if (x > 0) {
      if(isEmpty(*grid, x-1, y+1)) {
        grid->cells[y][x].type = NONE;
        grid->cells[y+1][x-1].type = WATER;
        return;
      } else if (isEmpty(*grid, x-1, y) && (x == grid->cols-1 || !isEmpty(*grid, x+1,y))) {
        grid->cells[y][x].type=NONE;
        grid->cells[y][x-1].type = WATER;
        return;
      }
    }
  } else {
    if (grid->cols > x+1 && isEmpty(*grid, x+1, y) && (x == 0 || !isEmpty(*grid, x-1, y))) {
      grid->cells[y][x].type = NONE;
      grid->cells[y][x+1].type = WATER;
      return;
    } 
    if (x > 0 && isEmpty(*grid, x-1, y) && (x == grid->cols-1 || !isEmpty(*grid, x+1,y))) {
      grid->cells[y][x].type=NONE;
      grid->cells[y][x-1].type = WATER;
      return;
    } 
  }
}
