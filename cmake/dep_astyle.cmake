#FindASTYLE.cmake:FIND_PACKAGE_HANDLE_STANDARD_ARGS(ASTYLE REQUIRED_VARS ASTYLE_LIBRARY ASTYLE_INCLUDE_DIR VERSION_VAR ASTYLE_VERSION HANDLE_COMPONENTS) 
if(NOT TARGET astyle)
    set(LIBNAME      astyle)
    set(LIB_DIR_NAME astyle)

    set(ALL_LIB_SRC_DIR ${CMAKE_CURRENT_LIST_DIR}/../thirdparty)
    set(ALL_LIB_BIN_DIR ${CMAKE_BINARY_DIR}/thirdparty)

    set(${LIBNAME}_SRC_DIR ${ALL_LIB_SRC_DIR}/${LIB_DIR_NAME})
    set(${LIBNAME}_BIN_DIR ${ALL_LIB_BIN_DIR}/${LIB_DIR_NAME})

    message("${LIBNAME}_SRC_DIR:${${LIBNAME}_SRC_DIR}")
    message("${LIBNAME}_BIN_DIR:${${LIBNAME}_BIN_DIR}")
    if(CMAKE_SYSTEM_NAME MATCHES "Linux")
        add_compile_definitions(DYZ)
    endif()
    add_subdirectory(${${LIBNAME}_SRC_DIR}/)
endif()

set(ASTYLE_ROOT_DIR     ${${LIBNAME}_SRC_DIR})

set(ASTYLE_INCLUDE_DIRS ${ASTYLE_ROOT_DIR}/src     ${ASTYLE_ROOT_DIR}/include  ${${LIBNAME}_BIN_DIR}/     ${${LIBNAME}_BIN_DIR}/include  )
set(ASTYLE_LIBRARY_DIRS ${ASTYLE_ROOT_DIR}         ${ASTYLE_ROOT_DIR}/lib      ${${LIBNAME}_BIN_DIR}/     ${${LIBNAME}_BIN_DIR}/lib      ${${LIBNAME}_BIN_DIR}/Debug)

set(ASTYLE_LIBRARY   $<TARGET_OBJECTS:libastyle_static>)
set(ASTYLE_LIBRARIES $<TARGET_OBJECTS:libastyle_static>)

#include_directories(${ASTYLE_INCLUDE_DIRS}  )
#link_directories   (${ASTYLE_LIBRARY_DIRS}  )
