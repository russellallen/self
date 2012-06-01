#!/usr/bin/env cmake

#config below.

set(SRC_glue
    macPrims.primMaker.hh
    quartz.primMaker.hh
    stat_glue.cpp
    stat.primMaker.hh
    termcap_glue.cpp
    termcap.primMaker.hh
    transcendental_glue.cpp
    transcendental.primMaker.hh    
#    xgl_glue.cpp
#    xgl.primMaker.hh
    xlib_glue.cpp
    xlib.primMaker.hh
)

prepend_every_item(SRC_glue "${CMAKE_CURRENT_SOURCE_DIR}/")

set(SRC_glue ${SRC_glue} PARENT_SCOPE)
