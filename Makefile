CC := gcc
CFLAGS := -Wall -I lib/glfw/include -I lib/glad/include
LDFLAGS := lib/glad/src/glad.o lib/glfw/src/libglfw3.a -lm

# compile macros
EXEC := bin/app

# Get the source files recursively
SRCS := $(wildcard src/**/*.c) $(wildcard src/*.c) $(wildcard src/**/**/*.c) $(wildcard src/**/**/**/*.c)

# generate names of object files
OBJS := $(SRCS:.c=.o)

# name of executable
EXEC := bin/app

# default recipe
all: libs $(EXEC)

#recipe for compiling the libraries
libs:
	cd lib/glad && $(CC) -o src/glad.o -I include -c src/glad.c
	cd lib/glfw && cmake -S . && make

# recipe for building the final executable
$(EXEC): $(OBJS) $(HDRS) Makefile
	$(CC) -o $@ $(OBJS) $(CFLAGS) $(LDFLAGS)

# recipe for building object files
$(OBJS): $(@:.o=.c) $(HDRS) Makefile
	$(CC) -o $@ $(@:.o=.c) -c $(CFLAGS)

# recipe to clean the workspace
clean:
	rm -f $(OBJS)

.PHONY: all clean win
