#include "SDL_events.h"
#include "SDL_mouse.h"
#include "SDL_timer.h"
#include "SDL_video.h"
#include "graphics/renderer.h"
#include "graphics/scene_obj.h"
#include "objects/grid_obj.h"
#include "input/mouse.h"
#include "primitives/vao.h"
#include "simulation/cells.h"
#include "utils/basic.h"
#include "utils/error_handling.h"
#include<stdio.h>
#include<stdlib.h>
#include<stdbool.h>
#include<glad/glad.h>
#include<SDL.h>

extern const int SCREEN_FULLSCREEN;
extern const int SCREEN_WIDTH;
extern const int SCREEN_HEIGHT;
extern const float ASPECT_RATIO;
static SDL_Window *window = NULL;
static SDL_GLContext maincontext;

extern void ruleNone(Grid* grid, int x, int y);
extern void ruleSand(Grid* grid, int x, int y);
extern void ruleWater(Grid* grid, int x, int y);
 
static void sdl_die(const char * message) {
  fprintf(stderr, "%s: %s\n", message, SDL_GetError());
  exit(2);
}
 
void init_screen(const char * title) {
  if (SDL_Init(SDL_INIT_VIDEO) < 0)
    sdl_die("Couldn't initialize SDL");
  atexit(SDL_Quit);
  SDL_GL_LoadLibrary(NULL);
  SDL_GL_SetAttribute(SDL_GL_ACCELERATED_VISUAL, 1);
  SDL_GL_SetAttribute(SDL_GL_CONTEXT_MAJOR_VERSION, 4);
  SDL_GL_SetAttribute(SDL_GL_CONTEXT_MINOR_VERSION, 5);

  // Create the window
  if (SCREEN_FULLSCREEN) {
    window = SDL_CreateWindow(
      title, 
      SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, 
      0, 0, SDL_WINDOW_FULLSCREEN_DESKTOP | SDL_WINDOW_OPENGL
    );
  } else {
    window = SDL_CreateWindow(
      title, 
      SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, 
      SCREEN_WIDTH, SCREEN_HEIGHT, SDL_WINDOW_OPENGL
    );
  }
  if (window == NULL) sdl_die("Couldn't set video mode");

  maincontext = SDL_GL_CreateContext(window);
  if (maincontext == NULL) 
    sdl_die("Failed to create OpenGL context");

  // Check OpenGL properties
  printf("OpenGL loaded\n");
  gladLoadGLLoader(SDL_GL_GetProcAddress);
  printf("Vendor:   %s\n", glGetString(GL_VENDOR));
  printf("Renderer: %s\n", glGetString(GL_RENDERER));
  printf("Version:  %s\n", glGetString(GL_VERSION));

  // Use v-sync
  SDL_GL_SetSwapInterval(1);

  // Disable depth test and face culling.
  glDisable(GL_DEPTH_TEST);
  glDisable(GL_CULL_FACE);

  int w,h;
  SDL_GetWindowSize(window, &w, &h);
  glViewport(0, 0, w, h);
  glClearColor(0.0f, 0.5f, 1.0f, 0.0f);
}

int main() {
  init_screen("Particle Simulation");
  SDL_Event event;
  bool quit = false;

  //Timer
  const int desiredFPS = 60;
  const int updateInterval = 1000/desiredFPS;
  Uint32 prevTime = SDL_GetTicks();
  Uint32 currTime;
  
  //Vertex Layout of basically every object
  VertexLayout *vl;
  vl = (VertexLayout *) malloc(sizeof(VertexLayout) + 2*sizeof(GLint)); 
  vl->counter = 0;
  vl->stride = 0;
  addElementVL(vl, 2);
  addElementVL(vl, 4);

  Renderer renderer;
  
  initRenderer(&renderer);
  GridObj grid = newGridObj(5, 80, 100, (Colour){1.0f, 1.0f, 1.0f, 1.0f});
  // grid.grid.cells[1][2].type = SAND;
  // grid.grid.cells[1][19].type = SAND;
  
  Mouse mouse;

  while (!quit) {
    while (SDL_PollEvent(&event)) {
      if (event.type == SDL_QUIT) {
        quit = true;
      } else if(event.type == SDL_MOUSEBUTTONDOWN) {
        mouse.isPressed = true;
      } else if (event.type == SDL_MOUSEBUTTONUP) {
        mouse.isPressed = false;
      }
    }
    SDL_GetMouseState(&(mouse.mouseX), &(mouse.mouseY));
    if(mouse.isPressed) {
      handleMouseEvent(&grid, mouse.mouseX, mouse.mouseY);
    }

    glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

    currTime = SDL_GetTicks();
    Uint32 deltaTime = currTime - prevTime;
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
    SDL_GL_SwapWindow(window);
    
  }

  freeSceneObj(grid.grid_repr);
  free(vl);
  destroyGrid(grid.grid);
  destroyRenderer(&renderer);
  SDL_DestroyWindow(window);
  return 0;
}
