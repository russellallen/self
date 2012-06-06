#!/usr/bin/env cmake

set(3RD_PARTY_LIBS)

# X11 and Xext
find_package(X11 COMPONENTS Xext REQUIRED)
include_directories(${X11_INCLUDE_DIR})
list(APPEND 3RD_PARTY_LIBS ${X11_LIBRARIES})

# (n)curses
find_package(Curses REQUIRED)
include_directories(${CURSES_INCLUDE_DIR})
list(APPEND 3RD_PARTY_LIBS ${CURSES_LIBRARIES})
#
# hide things that CURSES forgot to hide
mark_as_advanced(CURSES_CURSES_H_PATH CURSES_FORM_LIBRARY CURSES_HAVE_CURSES_H)
