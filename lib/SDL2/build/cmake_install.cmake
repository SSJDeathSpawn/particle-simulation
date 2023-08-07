# Install script for directory: /files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "0")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/build/libSDL2-2.0.so.0.2600.5"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/build/libSDL2-2.0.so.0"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libSDL2-2.0.so.0.2600.5"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libSDL2-2.0.so.0"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/usr/bin/strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/build/libSDL2-2.0.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libSDL2-2.0.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libSDL2-2.0.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libSDL2-2.0.so")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/build/libSDL2main.a")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/build/libSDL2.a")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/build/libSDL2_test.a")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2/SDL2Targets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2/SDL2Targets.cmake"
         "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/build/CMakeFiles/Export/f084604df1a27ef5b4fef7c7544737d1/SDL2Targets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2/SDL2Targets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2/SDL2Targets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2" TYPE FILE FILES "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/build/CMakeFiles/Export/f084604df1a27ef5b4fef7c7544737d1/SDL2Targets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2" TYPE FILE FILES "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/build/CMakeFiles/Export/f084604df1a27ef5b4fef7c7544737d1/SDL2Targets-noconfig.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2/SDL2mainTargets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2/SDL2mainTargets.cmake"
         "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/build/CMakeFiles/Export/f084604df1a27ef5b4fef7c7544737d1/SDL2mainTargets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2/SDL2mainTargets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2/SDL2mainTargets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2" TYPE FILE FILES "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/build/CMakeFiles/Export/f084604df1a27ef5b4fef7c7544737d1/SDL2mainTargets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2" TYPE FILE FILES "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/build/CMakeFiles/Export/f084604df1a27ef5b4fef7c7544737d1/SDL2mainTargets-noconfig.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2/SDL2staticTargets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2/SDL2staticTargets.cmake"
         "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/build/CMakeFiles/Export/f084604df1a27ef5b4fef7c7544737d1/SDL2staticTargets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2/SDL2staticTargets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2/SDL2staticTargets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2" TYPE FILE FILES "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/build/CMakeFiles/Export/f084604df1a27ef5b4fef7c7544737d1/SDL2staticTargets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2" TYPE FILE FILES "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/build/CMakeFiles/Export/f084604df1a27ef5b4fef7c7544737d1/SDL2staticTargets-noconfig.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2/SDL2testTargets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2/SDL2testTargets.cmake"
         "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/build/CMakeFiles/Export/f084604df1a27ef5b4fef7c7544737d1/SDL2testTargets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2/SDL2testTargets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2/SDL2testTargets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2" TYPE FILE FILES "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/build/CMakeFiles/Export/f084604df1a27ef5b4fef7c7544737d1/SDL2testTargets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2" TYPE FILE FILES "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/build/CMakeFiles/Export/f084604df1a27ef5b4fef7c7544737d1/SDL2testTargets-noconfig.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Devel" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2" TYPE FILE FILES
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/build/SDL2Config.cmake"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/build/SDL2ConfigVersion.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/SDL2" TYPE FILE FILES
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_assert.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_atomic.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_audio.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_bits.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_blendmode.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_clipboard.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_copying.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_cpuinfo.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_egl.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_endian.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_error.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_events.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_filesystem.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_gamecontroller.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_gesture.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_guid.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_haptic.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_hidapi.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_hints.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_joystick.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_keyboard.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_keycode.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_loadso.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_locale.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_log.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_main.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_messagebox.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_metal.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_misc.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_mouse.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_mutex.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_name.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_opengl.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_opengl_glext.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_opengles.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_opengles2.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_opengles2_gl2.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_opengles2_gl2ext.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_opengles2_gl2platform.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_opengles2_khrplatform.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_pixels.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_platform.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_power.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_quit.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_rect.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_render.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_rwops.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_scancode.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_sensor.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_shape.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_stdinc.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_surface.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_system.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_syswm.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_test.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_test_assert.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_test_common.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_test_compare.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_test_crc32.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_test_font.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_test_fuzzer.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_test_harness.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_test_images.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_test_log.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_test_md5.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_test_memory.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_test_random.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_thread.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_timer.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_touch.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_types.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_version.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_video.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/SDL_vulkan.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/begin_code.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/include/close_code.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/build/include/SDL_revision.h"
    "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/build/include-config-/SDL_config.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/licenses/SDL2" TYPE FILE FILES "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/LICENSE.txt")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/build/sdl2.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  
            execute_process(COMMAND /usr/bin/cmake -E create_symlink
              "libSDL2-2.0.so" "libSDL2.so"
              WORKING_DIRECTORY "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/build")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE FILE FILES "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/build/libSDL2.so")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE PROGRAM FILES "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/build/sdl2-config")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/aclocal" TYPE FILE FILES "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/sdl2.m4")
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/files/Programming/Projects/particle_simulation/lib/SDL2-2.26.5/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
