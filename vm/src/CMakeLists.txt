

file(GLOB_RECURSE SRC_ANY any/*.c??)
set(SRC ${SRC_ANY})

if(UNIX)
    file(GLOB_RECURSE SRC_UNIX unix/*.c??)
    set(SRC ${SRC} ${SRC_UNIX})
endif(UNIX)

file(GLOB_RECURSE SRC_PLAT ${platform_processor}/*.c??)
set(SRC ${SRC} ${SRC_PLAT})


message("src: ${SRC}")

add_executable(${PROJECT_NAME} ${GUI_TYPE} ${SRC})

target_link_libraries(${PROJECT_NAME} ${EXTRA_LIBRARIES})