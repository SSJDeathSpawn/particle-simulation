#ifndef MOUSE_H
#define MOUSE_H

#include <stdbool.h>

typedef struct Mouse {
  bool isPressed;
  int mouseX;
  int mouseY;
} Mouse;

#endif // !MOUSE_H
