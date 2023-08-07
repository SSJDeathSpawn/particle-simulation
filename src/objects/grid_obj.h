#ifndef GRID_OBJ_H
#define GRID_OBJ_H

#include "../graphics/scene_obj.h"
#include "../utils/basic.h"
#include "../simulation/cells.h"

typedef struct GridObj {
  Grid grid;
  SceneObject grid_repr;
  SceneObject cell_repr;
  void (*rules[CELL_LAST+1]) (Grid*, int, int);
} GridObj;

GridObj newGridObj(int box_size, int rows, int cols, Colour outline);
void tick(GridObj* self);
void handleMouseEvent(GridObj* self, int mouseX, int mouseY);

#endif //GRID_OBJ_H
