if(NOT TARGET qscint)
    set(LIBNAME      qscint)
    set(LIB_DIR_NAME qscint)
endif()

if("$ENV{HomeDir}" STREQUAL "")
    if(CMAKE_HOST_SYSTEM_NAME MATCHES "Linux")
        set(ALL_LIB_HOME_DIR ${CMAKE_CURRENT_LIST_DIR}/../out/linux)
    elseif(CMAKE_HOST_SYSTEM_NAME MATCHES "Windows")
        set(ALL_LIB_HOME_DIR ${CMAKE_CURRENT_LIST_DIR}/../out/windows)
        string(REPLACE "/" "\\" ALL_LIB_HOME_DIR "${ALL_LIB_HOME_DIR}")
    else()
        message("current platform: unkonw ") 
    endif()
else()
    set(ALL_LIB_HOME_DIR "$ENV{HomeDir}")
endif()

set(QSCINT_ROOT_DIR     ${ALL_LIB_HOME_DIR}/${LIB_DIR_NAME})

set(QSCINT_INCLUDE_DIRS ${QSCINT_ROOT_DIR}/include     ${QSCINT_ROOT_DIR}/src    ${QSCINT_ROOT_DIR}/src/Qsci    ${QSCINT_ROOT_DIR}/../include    ${QSCINT_ROOT_DIR}/scintilla/include)
set(QSCINT_LIBRARY_DIRS ${QSCINT_ROOT_DIR}/lib)

set(QSCINT_LIBRARY      qscint)  # qscint_static
set(QSCINT_LIBRARIES    qscint)

set(QSCINT_LIB          qscint)

include_directories(${QSCINT_INCLUDE_DIRS})
link_directories   (${QSCINT_LIBRARY_DIRS})

message("QSCINT_LIBRARY_DIRS = ${QSCINT_LIBRARY_DIRS} ") 