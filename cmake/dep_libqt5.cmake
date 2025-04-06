# set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)
if(NOT TARGET LIBQT5)
    set(CMAKE_PREFIX_PATH "D:/Qt/Qt5.12.0/5.12.0/msvc2017_64")

    set(Qt5_DIR              "${CMAKE_PREFIX_PATH}/lib/cmake/Qt5")

    set(Qt5Core_DIR          "${CMAKE_PREFIX_PATH}/lib/cmake/Qt5Core")
    set(Qt5Gui_DIR           "${CMAKE_PREFIX_PATH}/lib/cmake/Qt5Gui")
    set(Qt5Widgets_DIR       "${CMAKE_PREFIX_PATH}/lib/cmake/Qt5Widgets")
    set(Qt5Concurrent_DIR    "${CMAKE_PREFIX_PATH}/lib/cmake/Qt5Concurrent")

    set(Qt5Network_DIR       "${CMAKE_PREFIX_PATH}/lib/cmake/Qt5Network")
    set(Qt5PrintSupport_DIR  "${CMAKE_PREFIX_PATH}/lib/cmake/Qt5PrintSupport")
    set(Qt5Xml_DIR           "${CMAKE_PREFIX_PATH}/lib/cmake/Qt5Xml")
    set(Qt5WebEngineCore_DIR "${CMAKE_PREFIX_PATH}/lib/cmake/Qt5WebEngineCore")
    set(Qt5WebView_DIR       "${CMAKE_PREFIX_PATH}/lib/cmake/Qt5WebView")

    set(Qt5LinguistTools_DIR "${CMAKE_PREFIX_PATH}/lib/cmake/Qt5LinguistTools")

    find_package(Qt5 REQUIRED COMPONENTS Core  Gui Widgets Concurrent Network PrintSupport Xml WebEngineCore WebView)
endif()

set(LIBQT5_LIBRARIES Qt5::Core   Qt5::Gui Qt5::Widgets Qt5::Concurrent Qt5::Network  Qt5::PrintSupport Qt5::Xml Qt5::WebEngineCore Qt5::WebView)