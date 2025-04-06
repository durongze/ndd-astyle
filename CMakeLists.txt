cmake_minimum_required(VERSION 3.16)

project(ndd-astyle)

include(cmake/find_qscint.cmake)
include(cmake/dep_astyle.cmake)
include(cmake/dep_libqt5.cmake)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 17)

set(QtVer Qt5)

set(QtLibSet ${LIBQT5_LIBRARIES}  )

# XmlPatterns
find_package(${QtVer} REQUIRED COMPONENTS Core Gui Widgets PrintSupport Network Concurrent )

find_library(QSCINT_LIB qmyedit_qt5 PATH ${QSCINT_SDK_PATH}/lib)

aux_source_directory(src                         SRC_FILES)

message("[INFO] CMAKE_SOURCE_DIR=${CMAKE_SOURCE_DIR}")

add_library               (${PROJECT_NAME} SHARED  ${SRC_FILES}  )
target_compile_definitions(${PROJECT_NAME} PRIVATE UNICODE _UNICODE ASTYLE_LIB)
target_include_directories(${PROJECT_NAME} PRIVATE
        src

        ${QSCINC_INCLUDE_DIRS}

        ${ASTYLE_INCLUDE_DIRS}

        ${CMAKE_SOURCE_DIR}/
        ${CMAKE_SOURCE_DIR}/src/include
        ${CMAKE_SOURCE_DIR}/src/qscint/scintilla/include
        ${CMAKE_SOURCE_DIR}/src/qscint/src
        ${CMAKE_SOURCE_DIR}/src/qscint/src/Qsci

        ${CMAKE_CURRENT_SOURCE_DIR}
        ${QSCINT_SDK_PATH}/include
        ${QSCINT_SDK_PATH}/include/src)

target_link_libraries(${PROJECT_NAME} PRIVATE    ${QtLibSet}    ${QSCINT_LIB}    ${ASTYLE_LIBRARIES}    ${QSCINC_LIBRARIES})