#include<stdio.h>
#include<stdlib.h>
#include<stdbool.h>

#include "graphics/renderer.h"
#include "graphics/scene_obj.h"
#include "objects/grid_obj.h"
#include "input/mouse.h"
#include "primitives/vao.h"
#include "simulation/cells.h"
#include "utils/basic.h"
#include "utils/error_handling.h"

#include<glad/glad.h>
#include <GLFW/glfw3.h>

extern const int SCREEN_FULLSCREEN;
extern const int SCREEN_WIDTH;
extern const int SCREEN_HEIGHT;
extern const float ASPECT_RATIO;
extern const int desiredFPS;
extern const double updateInterval;
static GLFWwindow *window = NULL;
static GridObj grid;
static Mouse mouse;
static CellEnum selected = SAND;

extern void ruleNone(Grid* grid, int x, int y);
extern void ruleSand(Grid* grid, int x, int y);
extern void ruleWater(Grid* grid, int x, int y);
 
static void glfw_die(const char * message) {
  fprintf(stderr, "%s\n", message);
  exit(2);
}
 
void init_screen(const char * title) {
  if (!glfwInit())
    glfw_die("Couldn't initialize SDL");

  glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
  glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 2);
  glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
  glfwWindowHint(GLFW_RESIZABLE, GLFW_FALSE);

  window = glfwCreateWindow(SCREEN_WIDTH, SCREEN_HEIGHT, title, NULL, NULL);
  glfwMakeContextCurrent(window);

  if (window == NULL) glfw_die("Couldn't set video mode");

  // Check OpenGL properties
  printf("OpenGL loaded\n");
  int version = gladLoadGLLoader((GLADloadproc) glfwGetProcAddress);
  printf("Vendor:   %s\n", glGetString(GL_VENDOR));
  printf("Renderer: %s\n", glGetString(GL_RENDERER));
  printf("Version:  %s\n", glGetString(GL_VERSION));

  // Use v-sync
  glfwSwapInterval(1);

  // Disable depth test and face culling.
  glDisable(GL_DEPTH_TEST);
  glDisable(GL_CULL_FACE);

  glViewport(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
  glClearColor(0.0f, 0.0f, 0.0f, 0.0f);
}

static void handleMouse(GLFWwindow *window, double xMouse, double yMouse) {
}

static void setSwitching(GLFWwindow* window, int button, int action, int mods) {
  if (button == GLFW_MOUSE_BUTTON_LEFT) {
    mouse.isPressed = (bool)(action == GLFW_PRESS);
  }
}

static void keyboardMethod(GLFWwindow* window, int key, int scancode, int action, int mods) {
  if (action == GLFW_PRESS) {
    if(key == GLFW_KEY_LEFT_BRACKET) {
      if(selected == 1) selected = CELL_LAST;
      else selected = (CellEnum) (selected - 1);
    } else if (key == GLFW_KEY_RIGHT_BRACKET) {
      if(selected == CELL_LAST) selected = 1;
      else selected = (CellEnum) (selected + 1);
      printf("%d\n", selected);
    }
  }
}

int main() {
  init_screen("Particle Simulation");
  glfwSetCursorPosCallback(window, handleMouse);
  glfwSetMouseButtonCallback(window, setSwitching);
  glfwSetKeyCallback(window, keyboardMethod);
  //Timer
  double prevTime = glfwGetTime();
  double currTime;

  grid = newGridObj(4, 100, 125, (Colour){1.0f, 1.0f, 1.0f, 1.0f});
  
  //Vertex Layout of basically every object
  VertexLayout *vl;
  vl = (VertexLayout *) malloc(sizeof(VertexLayout) + 2*sizeof(GLint)); 
  vl->counter = 0;
  vl->stride = 0;
  addElementVL(vl, 2);
  addElementVL(vl, 4);

  Renderer renderer;
  
  initRenderer(&renderer);
  // grid.grid.cells[1][2].type = SAND;
  // grid.grid.cells[1][19].type = SAND;

  while (!glfwWindowShouldClose(window)) {
    glfwPollEvents();

      if (mouse.isPressed) {
        double xMouse, yMouse;
        glfwGetCursorPos(window, &xMouse, &yMouse); 
        handleMouseEvent(&grid, selected, xMouse, yMouse);
      }

    glClearColor(0.0f, 0.0f, 0.0f, 0.0f);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

    currTime = glfwGetTime();
    double deltaTime = currTime - prevTime;
    if(deltaTime >= updateInterval) {
      //Do 30 times every second here
      
      tick(&grid);
      
      prevTime = currTime;
    }

    loadSceneObjRenderer(&renderer, grid.grid_repr);
    loadVAOAttrs(renderer, vl);
    drawCallRenderer(renderer, GL_TRIANGLES);
    loadSceneObjRenderer(&renderer, grid.cell_repr);
    loadVAOAttrs(renderer, vl);
    drawCallRenderer(renderer, GL_TRIANGLES);

    glfwSwapBuffers(window);
    
  }

  glfwDestroyWindow(window);

  freeSceneObj(grid.grid_repr);
  free(vl);
  destroyGrid(grid.grid);
  destroyRenderer(&renderer);
  glfwTerminate();
  return 0;
}
