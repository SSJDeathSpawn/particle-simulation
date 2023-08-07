#include "grid_obj.h"
#include "glad/glad.h"
#include<stdio.h>
#include<stdlib.h>

extern const int SCREEN_WIDTH;
extern const int SCREEN_HEIGHT;
extern const Colour Cells[];
extern void ruleNone(Grid* grid, int x, int y);
extern void ruleSand(Grid* grid, int x, int y);
extern void ruleWater(Grid* grid, int x, int y);

GridObj newGridObj(int box_size, int rows, int cols, Colour outline) {
  int box_width = box_size * cols;
  int box_height = box_size * rows;
  float box_start_x = -1.0f + (float)(SCREEN_WIDTH - box_width) / (float)SCREEN_WIDTH;
  float box_start_y = 1.0f - (float)(SCREEN_HEIGHT - box_height) / (float)SCREEN_HEIGHT;
  float box_end_x = 1.0f - (float)(SCREEN_WIDTH - box_width) / (float)SCREEN_WIDTH;
  float box_end_y = -1.0f + (float)(SCREEN_HEIGHT - box_height) / (float)SCREEN_HEIGHT;
  
  Vertex* vertices = malloc(sizeof(Vertex) * 4);
  vertices[0] = (Vertex){{box_start_x, box_start_y}, outline};
  vertices[1] = (Vertex){{box_end_x, box_start_y}, outline};
  vertices[2] = (Vertex){{box_end_x, box_end_y}, outline};
  vertices[3] = (Vertex){{box_start_x, box_end_y}, outline};

  GLuint* indices = malloc(sizeof(GLuint) * 6);
  indices[0] = 0;
  indices[1] = 3;
  indices[2] = 2;
  indices[3] = 0;
  indices[4] = 1;
  indices[5] = 2;

  return (GridObj) {
    .grid = newGrid(cols, rows, box_width, box_height), 
    .grid_repr = {
      .noInd = false, 
      .shader = SHADER_LINES, 
      .shouldFree = true,
      .vert = vertices, 
      .num_vertices = 4, 
      .ind = indices, 
      .num_indices = 6
    },
    .cell_repr = {
      .noInd = false,
      .shader = SHADER_BASIC,
      .shouldFree = true,
      .vert = NULL,
      .num_vertices = 0,
      .ind = NULL,
      .num_indices = 0
    },
    .rules = {ruleNone, ruleSand, ruleWater}
  };
}

void tick(GridObj *self) {

  //Update Physics
  for(int i = self->grid.rows-1; i >= 0; i--) {
    for(int j = self->grid.cols-1; j >= 0; j--) {
      (*self->rules[self->grid.cells[i][j].type])(&(self->grid), j, i);
    }
  }

  //Update Graphics
  if(self->cell_repr.vert != NULL) free(self->cell_repr.vert);
  if(self->cell_repr.ind != NULL) free(self->cell_repr.ind);

  int count = 0;
  for(int i = 0; i<self->grid.rows; i++) {
    for(int j = 0; j<self->grid.cols; j++) {
      if(self->grid.cells[i][j].type != NONE) count++;
    }
  }

  int vert_count = count * 4;
  Vertex* vertex = malloc(sizeof(Vertex) * vert_count);
  int ind_count = count * 6;
  GLuint* indices = malloc(sizeof(GLuint) * ind_count);
  float normSizeX = self->grid.size.x * 2 / SCREEN_WIDTH; 
  float normSizeY = self->grid.size.y * 2 / SCREEN_HEIGHT; 

  self->cell_repr.num_vertices = vert_count;
  self->cell_repr.num_indices = ind_count;

  //Generate indices 4n, 4n+1, 4n+2,     4n+2, 4n+3, 4n for each cell
  for(int i=0; i<count; i++) {
    indices[6*i] = 4*i;
    indices[6*i + 1] = 4*i + 1; 
    indices[6*i + 2] = 4*i + 2;
    indices[6*i + 3] = 4*i + 2;
    indices[6*i + 4] = 4*i + 3;
    indices[6*i + 5] = 4*i;
  }
  
  //Generate vertices for each cell, clockwise from left top corner
  int curr = 0;
  for(int i = 0; i<self->grid.rows; i++) {
    for(int j = 0; j<self->grid.cols; j++) {
      if(self->grid.cells[i][j].type != NONE) {
        float start_x = self->grid_repr.vert[0].pos.x;
        float start_y = self->grid_repr.vert[0].pos.y;
        vertex[4*curr] = (Vertex){{start_x + j*normSizeX, start_y - i*normSizeY}, Cells[self->grid.cells[i][j].type-1]};
        vertex[4*curr + 1] = (Vertex){{start_x + (j+1)*normSizeX, start_y - i*normSizeY}, Cells[self->grid.cells[i][j].type-1]};
        vertex[4*curr + 2] = (Vertex){{start_x + (j+1)*normSizeX, start_y - (i+1)*normSizeY}, Cells[self->grid.cells[i][j].type-1]};
        vertex[4*curr + 3] = (Vertex){{start_x + j*normSizeX, start_y - (i+1)*normSizeY}, Cells[self->grid.cells[i][j].type-1]};
        curr++;
      }
    }
  }

  self->cell_repr.vert = vertex;
  self->cell_repr.ind = indices;
}

void handleMouseEvent(GridObj *self, int mouseX, int mouseY) {
  int box_width = self->grid.size.x * self->grid.cols;
  int box_height = self->grid.size.y * self->grid.rows;

  int box_start_x = (SCREEN_WIDTH - box_width) / 2;
  int box_start_y = (SCREEN_HEIGHT - box_height) / 2;

  if (mouseX > box_start_x && mouseX < box_start_x+box_width && 
      mouseY > box_start_y && mouseY < box_start_y+box_height) {
    int j = (mouseX - box_start_x) / (self->grid.size.x);
    int i = (mouseY - box_start_y) / (self->grid.size.y);
    self->grid.cells[i][j].type = SAND; 
  }
}
