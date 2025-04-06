# set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)
if(NOT TARGET LIBQT6)
    set(CMAKE_PREFIX_PATH "C:/Qt/6.5.2/msvc2019_64")

    set(Qt6_DIR              "${CMAKE_PREFIX_PATH}/lib/cmake/Qt6")

    set(Qt6Core_DIR          "${CMAKE_PREFIX_PATH}/lib/cmake/Qt6Core")
    set(Qt6Core5Compat_DIR   "${CMAKE_PREFIX_PATH}/lib/cmake/Qt6Core5Compat")
    set(Qt6Gui_DIR           "${CMAKE_PREFIX_PATH}/lib/cmake/Qt6Gui")
    set(Qt6Widgets_DIR       "${CMAKE_PREFIX_PATH}/lib/cmake/Qt6Widgets")
    set(Qt6Concurrent_DIR    "${CMAKE_PREFIX_PATH}/lib/cmake/Qt6Concurrent")

    set(Qt6Network_DIR       "${CMAKE_PREFIX_PATH}/lib/cmake/Qt6Network")
    set(Qt6PrintSupport_DIR  "${CMAKE_PREFIX_PATH}/lib/cmake/Qt6PrintSupport")
    set(Qt6Xml_DIR           "${CMAKE_PREFIX_PATH}/lib/cmake/Qt6Xml")
    set(Qt6WebEngineCore_DIR "${CMAKE_PREFIX_PATH}/lib/cmake/Qt6WebEngineCore")

    set(Qt6LinguistTools_DIR "${CMAKE_PREFIX_PATH}/lib/cmake/Qt6LinguistTools")

    find_package(Qt6 REQUIRED COMPONENTS Core Core5Compat Gui Widgets Concurrent Network PrintSupport Xml WebEngineCore)
endif()

set(LIBQT6_LIBRARIES Qt6::Core Qt6::Core5Compat Qt6::Gui Qt6::Widgets Qt6::Concurrent Qt6::Network  Qt6::PrintSupport Qt6::Xml Qt6::WebEngineCore)