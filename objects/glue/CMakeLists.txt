#!/usr/bin/env cmake

set(SRC_glue
    stat_glue.cpp
    stat.primMaker.hh
    termcap_glue.cpp
    termcap.primMaker.hh
    transcendental_glue.cpp
    transcendental.primMaker.hh    
)

set(SRC_glue_x11
#    xgl_glue.cpp
#    xgl.primMaker.hh
    xlib_glue.cpp
    xlib.primMaker.hh
)

if(SELF_X11)
    list(APPEND SRC_glue ${SRC_glue_x11})
endif()

set(SRC_glue_quartz
    quartz.primMaker.hh
)

if(SELF_QUARTZ)
    list(APPEND SRC_glue ${SRC_glue_quartz})
endif()


prepend_every_item(SRC_glue "${CMAKE_CURRENT_SOURCE_DIR}/")

set(SRC_glue ${SRC_glue} PARENT_SCOPE)
