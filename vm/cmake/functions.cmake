#!/usr/bin/env cmake


#
# make include dirs out of the sources list
#
function(include_directories_from_src sourcesVar)
  get_unique_dirs_from_src(${sourcesVar} include_dirs)
  include_directories(${include_dirs})
endfunction()

function(source_groups_from_src sourcesVar commonPrefix)
  set(_sources ${${sourcesVar}})
  set(_groups)
  foreach(fileName ${_sources})
    if(fileName MATCHES "\\.cp?p?$" 
    OR fileName MATCHES "\\.hh?$"
    OR fileName MATCHES "\\.s$")
      get_filename_component(path ${fileName} PATH)
      # strip common prefix
      string(REPLACE "${commonPrefix}" "" relPath "${path}")      
      # convert to group definition
      string(REPLACE "/" "\\\\" group "${relPath}")
      set(${group} ${${group}} ${fileName})
      set(_groups ${_groups} ${group})
    endif()
  endforeach()
  list(REMOVE_DUPLICATES _groups)
  foreach(group ${_groups})
    source_group(${group} FILES ${${group}})
  endforeach()
endfunction()

macro(get_unique_dirs_from_src sourcesVar dirsVar)
  set(dirs)
  set(sources ${${sourcesVar}})
  foreach(fileName ${sources})
    if(fileName MATCHES "\\.cp?p?$" 
    OR fileName MATCHES "\\.hh?$"
    OR fileName MATCHES "\\.s$")
      #get_filename_component(absolutePath ${fileName} ABSOLUTE)
      #get_filename_component(absolutePath ${absolutePath} PATH)
      #set(include_dirs ${include_dirs} ${absolutePath})
      get_filename_component(path ${fileName} PATH)
      set(dirs ${dirs} ${path})
    else()
    endif()
  endforeach()
  list(REMOVE_DUPLICATES dirs)
  set(${dirsVar} ${dirs})
endmacro()



macro(prepend_every_item listVar prefix)
  set(_outList)
  foreach(_each ${${listVar}})
    set(_outList ${_outList} "${prefix}${_each}")
  endforeach()
  set(${listVar} ${_outList})
endmacro()


macro(gather_prop resultVar onTarget src property config prefix)
  set(_${property} "")
  # get property list, whether on target or on dir.
  if(${onTarget})
    get_property(_props TARGET ${src} PROPERTY ${property}${config})
  else()
    get_property(_props DIRECTORY ${src} PROPERTY ${property}${config})
  endif()
  # remove duplicates, if applicable
  if(NOT "x${_props}" STREQUAL "x")
    list(REMOVE_DUPLICATES _props)
  endif()
  # make a string out of it, pobably with a prefix
  foreach(prop ${_props})
    set(_${property} "${_${property}} ${prefix}${prop}")
  endforeach()
  set(${resultVar} ${_${property}} PARENT_SCOPE)
endmacro()

function(gather_defines resultVar target config)
  gather_prop(${resultVar} TRUE ${target} COMPILE_DEFINITIONS "${config}" "-D")
endfunction()

function(gather_directory_defines resultVar target config)
  gather_prop(${resultVar} FALSE ${target} COMPILE_DEFINITIONS "${config}" "-D")
endfunction()


function(gather_flags resultVar target config)
  gather_prop(${resultVar} TRUE ${target} COMPILE_FLAGS "${config}" "")
endfunction()

function(gather_incls resultVar target config)
  gather_prop(${resultVar} TRUE ${target} INCLUDE_DIRECTORIES "${config}" "-I")
endfunction()
