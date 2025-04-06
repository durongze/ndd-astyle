cmake_minimum_required(VERSION 3.8)

cmake_policy(SET CMP0112 OLD)

project(astyle CXX)

add_compile_options("$<$<CXX_COMPILER_ID:MSVC>:/source-charset:utf-8>")
add_compile_options("$<$<CXX_COMPILER_ID:MSVC>:/execution-charset:utf-8>")

# "!E"    -A1 -s4 -xV -S -xW -Y -M120 -f -xg -H -U -c -n
# "$E*.c" -A1 -s4 -xV -S -xW -Y -M120 -f -xg -H -U -c -n

set(ASTYLE_TOP_DIR       ${CMAKE_CURRENT_LIST_DIR} )
set(LIBASTYLE_INC_DIRS   ${ASTYLE_TOP_DIR}/           ${ASTYLE_TOP_DIR}/src)
set(LIBASTYLE_INC_DIRS   ${LIBASTYLE_INC_DIRS}/       ${ASTYLE_TOP_DIR}/)


file(GLOB        LIBASTYLE_SRCS      RELATIVE  ${ASTYLE_TOP_DIR}  ./src/*.c*)

set (            LIBASTYLE_SRC_LIST            ${LIBASTYLE_SRCS}                        )

file(GLOB        ASTYLE_APP_SRCS     RELATIVE  ${ASTYLE_TOP_DIR}  ./src/astyle_main*.c*)

list(REMOVE_ITEM LIBASTYLE_SRC_LIST            ${ASTYLE_APP_SRCS})

set(dep_libs )

message("ASTYLE_APP_SRCS ${ASTYLE_APP_SRCS}" )
message("[INFO] dep_libs: ${dep_libs} ")

source_group(TREE ${ASTYLE_TOP_DIR} FILES ${LIBASTYLE_SRC_LIST} ${ASTYLE_APP_SRCS})

set                       (  LIBASTYLE_STATIC               libastyle_static            )
add_library               (${LIBASTYLE_STATIC}   STATIC     ${LIBASTYLE_SRC_LIST}           )
target_compile_definitions(${LIBASTYLE_STATIC}   PRIVATE    ${LIBASTYLE_DEF_LIST}           )
target_include_directories(${LIBASTYLE_STATIC}   PUBLIC     ${LIBASTYLE_INC_DIRS}           )
target_link_directories   (${LIBASTYLE_STATIC}   PUBLIC     ${LIBASTYLE_LIB_DIRS}           )
target_link_libraries     (${LIBASTYLE_STATIC}              ${LIBASTYLE_DEP_LIBS}        ${dep_libs}  )
target_compile_options    (${LIBASTYLE_STATIC}   PRIVATE     /Z7     /W4           )
set_target_properties     (${LIBASTYLE_STATIC}   PROPERTIES CLEAN_DIRECT_OUTPUT 1     OUTPUT_NAME libastyle_static  )

set                       (  LIBASTYLE_SHARED               libastyle_shared            )
add_library               (${LIBASTYLE_SHARED}   SHARED     ${LIBASTYLE_SRC_LIST}           )
target_compile_definitions(${LIBASTYLE_SHARED}   PRIVATE    ${LIBASTYLE_DEF_LIST}           )
target_include_directories(${LIBASTYLE_SHARED}   PUBLIC     ${LIBASTYLE_INC_DIRS}           )
target_link_directories   (${LIBASTYLE_SHARED}   PUBLIC     ${LIBASTYLE_LIB_DIRS}           )
target_link_libraries     (${LIBASTYLE_SHARED}              ${LIBASTYLE_DEP_LIBS}        ${dep_libs}        )
target_compile_options    (${LIBASTYLE_SHARED}   PRIVATE     /Z7     /W4           )
set_target_properties     (${LIBASTYLE_SHARED}   PROPERTIES CLEAN_DIRECT_OUTPUT 1     OUTPUT_NAME libastyle_shared  )

set                       (  ASTYLE_APP                astyle_main        )
add_executable            (${ASTYLE_APP}               ${LIBASTYLE_SRC_LIST}       ${ASTYLE_APP_SRCS})
target_compile_definitions(${ASTYLE_APP}    PRIVATE    DEBUG                            )
target_include_directories(${ASTYLE_APP}    PUBLIC     ./src/                           )
target_link_directories   (${ASTYLE_APP}    PUBLIC     ./lib/                           )
target_link_libraries     (${ASTYLE_APP}               ${dep_libs}                       )