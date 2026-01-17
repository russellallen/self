#!/usr/bin/env cmake

set(3RD_PARTY_LIBS)

#
# this is neccessary for finding X etc.
#
enable_language(C)

find_package(PkgConfig QUIET)

#
#
# X11. 
#
if(SELF_X11)
    if(PKG_CONFIG_FOUND)
      # do it the pkg-config way
      pkg_check_modules(X11 QUIET x11 xext xft)
    endif()
    
    if(NOT PKG_CONFIG_FOUND OR (NOT X11_FOUND))
      find_package(X11 COMPONENTS Xext REQUIRED)
      if(NOT X11_Xext_FOUND)
        # although it ought to, the FindX11 does not respect that
        # we _require_ Xext.
        message(FATAL_ERROR "Cannot find Xext component of X11. 
    Ensure the library and header files are properly installed")
      endif()
      find_package(X11 COMPONENTS Xft REQUIRED)
      if(NOT X11_Xft_FOUND)
        message(FATAL_ERROR "Cannot find Xft component of X11. 
    Ensure the library and header files are properly installed")
      endif()
      INCLUDE(FindFreetype)
      IF(NOT FREETYPE_FOUND)
        message(FATAL_ERROR "Cannot find Xft component of X11. 
    Ensure the library and header files are properly installed")
      ENDIF(NOT FREETYPE_FOUND)
      set(X11_INCLUDE_DIRS ${X11_INCLUDE_DIR})
    endif()
    link_directories(${X11_LIBRARY_DIRS})
    include_directories(${X11_INCLUDE_DIRS})
    list(APPEND 3RD_PARTY_LIBS ${X11_LIBRARIES})     
endif()

if(PKG_CONFIG_FOUND)
  # do it the pkg-config way
  pkg_check_modules(CURSES QUIET ncurses)
endif()

if(NOT PKG_CONFIG_FOUND OR (NOT CURSES_FOUND))
  # do it the CMake way
  # (n)curses
  find_package(Curses REQUIRED)
  #
  # hide things that CURSES forgot to hide
  mark_as_advanced(CURSES_CURSES_H_PATH CURSES_FORM_LIBRARY CURSES_HAVE_CURSES_H)
  set(CURSES_INCLUDE_DIRS ${CURSES_INCLUDE_DIR})
endif()
link_directories(${CURSES_LIBRARY_DIRS})
include_directories(${CURSES_INCLUDE_DIRS})
list(APPEND 3RD_PARTY_LIBS ${CURSES_LIBRARIES})

# if this system has a libdl, we probably need it (eg, linux)
if(CMAKE_DL_LIBS)
  list(APPEND 3RD_PARTY_LIBS ${CMAKE_DL_LIBS})
endif()
