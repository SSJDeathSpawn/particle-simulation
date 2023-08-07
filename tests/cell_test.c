#include<stdio.h>
#include<stdlib.h>
#include "../src/simulation/cells.h"

#define STEPS 5

extern void ruleNone(Grid* grid, int x, int y);
extern void ruleSand(Grid* grid, int x, int y);
extern void ruleWater(Grid* grid, int x, int y);

void (*rules[CELL_LAST+1]) (Grid*, int, int);

void printCell(Cell cell) {
  switch(cell.type) {
    case NONE:
      printf("\033[90mNONE\033[0m ");
      break;
    case SAND:
      printf("\033[93mSAND\033[0m ");
      break;
    case WATER:
      printf("\033[96mWATER\033[0m ");
      break;
    default:
      printf("\033[91m???\033[0m ");
  };
}

void printGrid(Grid grid) {
  for(int i=0;i<grid.rows;i++) {
    for(int j=0;j<grid.cols;j++) {
      printCell(grid.cells[i][j]);
    }
    printf("\n");
  }
  printf("\n");
}

extern CellRecipe recipes[];
extern int recipeNum;

int main() {
  rules[0] = ruleNone;
  rules[1] = ruleSand;
  rules[2] = ruleWater;

  Grid grid = newGrid(3, 4, 3, 4);

  for(int i=0;i<grid.rows;i++) {
    for(int j=0;j<grid.cols;j++) {
      grid.cells[i][j].type = NONE;
    }
  }

  grid.cells[0][1].type = SAND;
  grid.cells[1][1].type = SAND;
  grid.cells[2][1].type = SAND;
  grid.cells[2][2].type = WATER;

  printGrid(grid);
  
  printf("Finished printing for the first time\n");

  for(int step = 0; step < STEPS; step++) {
    for(int i = grid.rows-1; i >= 0; i--) {
      for(int j = grid.cols-1; j >= 0; j--) {
        (*rules[grid.cells[i][j].type])(&grid, j, i);
      }
    }
    printGrid(grid);
  }
  

  return 0;
}
