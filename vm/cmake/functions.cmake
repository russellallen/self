#!/usr/bin/env cmake

#
# Parse Version-information from the universe source
#
function(parse_version_information fileName majorVar minorVar snapshotVar)
  set(_fileContent)
  file(STRINGS ${fileName} _fileContent LIMIT_COUNT 64 REGEX "smi VM_.+_version")
  foreach(l ${_fileContent})
    string(REGEX REPLACE "^.+VM_(.+)_version.+=.+$" "\\1" varName ${l})
    string(REGEX REPLACE "^.+VM_(.+)_version.+=[^0-9]*([0-9]+).*$" "\\2" varValue ${l})
    set(${${varName}Var} ${varValue} PARENT_SCOPE)
  endforeach()
endfunction()

#
# Get the build number from git
#
function(determine_build_information buildVar)
  # determine git revision 
  execute_process(COMMAND git --version 
    RESULT_VARIABLE _git_not_there
    OUTPUT_VARIABLE _
    ERROR_VARIABLE _) 
  if(_git_not_there)
    set(${buildVar} PARENT_SCOPE)
  else()
    execute_process(COMMAND git describe --tags --dirty
      RESULT_VARIABLE git_result
      OUTPUT_VARIABLE _revision 
      ERROR_VARIABLE _error 
      OUTPUT_STRIP_TRAILING_WHITESPACE) 
    set(${buildVar} "${_revision}" PARENT_SCOPE)
    if(git_result) 
      message(FATAL_ERROR "Failed to determine git revision:\n${_error}") 
      set(${buildVar} PARENT_SCOPE)
    endif() 
  endif()
endfunction()


#
# get the current year
#
# determine date 
function(year yearVar)
  if(WIN32) 
    execute_process(COMMAND cmd /c "date /T"
      RESULT_VARIABLE _ OUTPUT_VARIABLE DATE 
      ERROR_VARIABLE _ UTPUT_STRIP_TRAILING_WHITESPACE) 
  elseif(UNIX) 
    execute_process(COMMAND date "+%Y" 
      RESULT_VARIABLE _ OUTPUT_VARIABLE DATE 
    ERROR_VARIABLE _ OUTPUT_STRIP_TRAILING_WHITESPACE) 
  else() 
    message(FATAL_ERROR "Can't determine date on this system.") 
  endif()
  set(${yearVar} ${DATE} PARENT_SCOPE)
endfunction()


set(SOURCE_EXT "\\.(cp?p?|hh?|s|S|mm?|.ib)$")

#
# make include dirs out of the sources list
#
function(include_directories_from_src sourcesVar)
  set(dirs)
  set(sources ${${sourcesVar}})
  foreach(fileName ${sources})
    if(fileName MATCHES ${SOURCE_EXT})
      get_filename_component(path ${fileName} PATH)
      set(dirs ${dirs} ${path})
    endif()
  endforeach()
  list(REMOVE_DUPLICATES dirs)
  include_directories(${dirs})
endfunction()

function(source_groups_from_src sourcesVar commonPrefix)
  set(_sources ${${sourcesVar}})
  set(_groups)
  foreach(fileName ${_sources})
    if(fileName MATCHES ${SOURCE_EXT})
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
