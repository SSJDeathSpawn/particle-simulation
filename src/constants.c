#include "utils/basic.h"

const int SCREEN_FULLSCREEN = 0;
const int SCREEN_WIDTH  = 800;
const int SCREEN_HEIGHT = 600;
const float ASPECT_RATIO = (float)SCREEN_WIDTH / (float)SCREEN_HEIGHT;
const int desiredFPS = 60;
const double updateInterval = 1.0 /desiredFPS;
const Colour Cells[] = 
  {{0.94f, 0.87f, 0.44f, 1.0f}, {0.45f, 0.54f, 0.85f, 1.0f}};
