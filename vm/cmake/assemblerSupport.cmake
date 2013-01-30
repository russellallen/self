#!/usr/bin/env cmake


# The following is only due to the CMake Xcode generator
# being ignorant to asm files.
# Xcode itself is actually capable of handling them correctly
# but cmake < 2.8.10 is too dumb to itself set the correct file type
# and moreover doesn't let us do it, too.
#

set(_assemblies_lib_name assemblies)

macro(setup_assembler_support sourcesVar)
  if(${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION}.${CMAKE_PATCH_VERSION} LESS 2.8.10)
    if(CMAKE_GENERATOR MATCHES Xcode)
  
      #the Xcode Generator is being stupid about 
      # filetypes and cannot be told to know better...
      # currently, (CMake 2.8.8) at least.
      set(_sources ${${sourcesVar}})
      set(SRC_ASM)    
      # collect asm sources form the original sources var
      foreach(source ${_sources})
        if(source MATCHES "\\.s$" OR source MATCHES "\\.S$")
          set(SRC_ASM ${SRC_ASM} ${source})
        endif()
      endforeach()
      # and remove them from the global sources
      list(REMOVE_ITEM ${sourcesVar} ${SRC_ASM})
    endif()
  endif()
endmacro()

macro(setup_target_assembler_support target)
  if(${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION}.${CMAKE_PATCH_VERSION} LESS 2.8.10)
    if(CMAKE_GENERATOR MATCHES Xcode)
      # second part, target-dependent.
    
    
      #
      # the next lines are to pick up the necessary
      # definitions, flags and includes from the respective
      # target/directories. this is somewhat cumbersome...
      #
    
      gather_directory_defines(_COMMON_DEFINES ${CMAKE_CURRENT_SOURCE_DIR} "")
    
      foreach(conf _DEBUG _RELEASE _MINSIZEREL _RELWITHDEBINFO "")
        gather_defines(_DEFINES${conf} ${target} "${conf}")
        set(_DEFINES${conf} "${_DEFINES${conf}} ${_COMMON_DEFINES} ${CMAKE_ASM_DEFINES}")
        gather_flags(_FLAGS${conf} ${target} "${conf}")      
        set(_FLAGS${conf} "${_FLAGS${conf}} ${CMAKE_ASM_FLAGS} ${CMAKE_ASM_FLAGS${conf}}")
        separate_arguments(_DEFINES${conf})
        separate_arguments(_FLAGS${conf})      
      endforeach()
    
      gather_incls(_INCLS ${target} "")    
      separate_arguments(_INCLS)
    
    
      #
      # Setup custom build commands for each and every asm file
      # we have to cope with Xcode configurations here.
      #
      set(destPre ${CMAKE_CURRENT_BINARY_DIR}/${SELF_MACOSX_XCODEPROJECTNAME}.build)
      set(destPost ${_assemblies_lib_name}.build/Objects-normal/${platform_processor})
      set(destDir ${destPre}/${CMAKE_CFG_INTDIR}/${destPost})
      # setup custom commands for the asm sources.
      foreach(source ${SRC_ASM})
        get_filename_component(dest ${source} NAME_WE)
        set(dest ${dest}.o)
        add_custom_command(OUTPUT ${destDir}/${dest}        
          COMMAND @if [ \"$<CONFIGURATION>\" = \"Debug\"          ]; then ${CMAKE_ASM_COMPILER} ${_FLAGS_DEBUG}          ${_INCLS} ${_DEFINES_DEBUG}          -c ${source} -o ${destDir}/${dest}\; fi
          COMMAND @if [ \"$<CONFIGURATION>\" = \"Release\"        ]; then ${CMAKE_ASM_COMPILER} ${_FLAGS_RELEASE}        ${_INCLS} ${_DEFINES_RELEASE}        -c ${source} -o ${destDir}/${dest}\; fi
          COMMAND @if [ \"$<CONFIGURATION>\" = \"MinSizeRel\"     ]; then ${CMAKE_ASM_COMPILER} ${_FLAGS_MINSIZEREL}     ${_INCLS} ${_DEFINES_MINSIZEREL}     -c ${source} -o ${destDir}/${dest}\; fi
          COMMAND @if [ \"$<CONFIGURATION>\" = \"RelWithDebInfo\" ]; then ${CMAKE_ASM_COMPILER} ${_FLAGS_RELWITHDEBINFO} ${_INCLS} ${_DEFINES_RELWITHDEBINFO} -c ${source} -o ${destDir}/${dest}\; fi
          COMMAND @echo ${destDir}/${dest} >> ${destPre}/$<CONFIGURATION>/${destPost}/\${PRODUCT_NAME}.LinkFileList
          DEPENDS 
          COMMENT "Assembling ${source}"
        )
        set(OBJS_ASM ${OBJS_ASM} ${destDir}/${dest})
      endforeach()
      set_source_files_properties(${OBJS_ASM} PROPERTIES GENERATED TRUE)
      #
      # create a library from our asseblies our main target can refer to.
      # note: we mess with xcode's way of compiling here.
      # Xcode can't determine the kind of source of the asm files
      # (because CMake sets it to 'sourcecode' where 'sourcecode.asm' would be 
      # rigtht) and cannot compile them.
      # but not adding the files gets the linker command wrong.
      #    
      add_library(${_assemblies_lib_name} STATIC ${OBJS_ASM} ${SRC_ASM})
      set_target_properties(${_assemblies_lib_name} PROPERTIES 
        LINKER_LANGUAGE C
        FOLDER "${SELF_HELPER_FOLDER}")
      add_custom_command(TARGET ${_assemblies_lib_name} PRE_BUILD 
        COMMAND rm -f ${CMAKE_CURRENT_BINARY_DIR}/*${_assemblies_lib_name}*
        COMMAND mkdir -p ${destDir}
        COMMAND rm -f ${destDir}/*
        COMMAND mkdir -p ${destPre}/$<CONFIGURATION>/${destPost}
        COMMAND rm -f ${destPre}/$<CONFIGURATION>/${destPost}/*
      )
      target_link_libraries(${target} ${_assemblies_lib_name})
    endif()
  endif()
endmacro()
