
if(NOT APPLE)
    message(FATAL "This is only for Mac OS X")
endif(NOT APPLE)

# icon files to copy in the bundle
#set(OSX_ICON_FILES ${CMAKE_CURRENT_SOURCE_DIR}/vm_project/SelfIcon.icns ${CMAKE_CURRENT_SOURCE_DIR}/Snapshot.icns)  #tbd
set(OSX_ICON_FILES ${CMAKE_CURRENT_SOURCE_DIR}/${platform}/vm_project/SelfIcon.icns) 
# set where in the bundle to put the icns files
set_source_files_properties(${OSX_ICON_FILES} PROPERTIES MACOSX_PACKAGE_LOCATION Resources)
# include the icns files in the target
set(SRC ${SRC} ${OSX_ICON_FILES})

# the frameworks we need
include_directories(/Developer/Headers/FlatCarbon)
find_library(COCOA_LIBRARY Cocoa)
find_library(APP_SERVICES_LIBRARY ApplicationServices)
find_library(CARBON_LIBRARY Carbon)
find_library(CORE_SERVICES_LIBRARY CoreServices)
mark_as_advanced(COCOA_LIBRARY
                 APP_SERVICES_LIBRARY
                 CARBON_LIBRARY
                 CORE_SERVICES_LIBRARY)
set(frameworks ${COCOA_LIBRARY} ${APP_SERVICES_LIBRARY} ${CARBON_LIBRARY} ${CORE_SERVICES_LIBRARY})

## TBD
# configure CMake to use a custom Info.plist
# set_target_properties(${PROJECT_NAME} PROPERTIES MACOSX_BUNDLE_INFO_PLIST ${PROJECT_SOURCE_DIR}/MyInfoPlist.plist )

message("src2: ${SRC}")

set(GUI_TYPE MACOSX_BUNDLE)

set(EXTRA_LIBRARIES ${frameworks})
