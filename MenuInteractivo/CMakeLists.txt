cmake_minimum_required(VERSION 3.16)

project(MenuInteractivo VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 COMPONENTS Quick Core REQUIRED)

# Adding Qt runtime path /opt/Qt-6.x/lib to default installation path for CrossControl displays
# The QT_HOST_PATH is set when cross-compiling, normally /opt/VM/Qt-6.x but not for the VM
if(NOT ${QT_HOST_PATH} STREQUAL "")
    string(REPLACE "/opt/VM" "/opt" QT_RUNTIME_PATH ${QT_HOST_PATH})
    string(APPEND QT_RUNTIME_PATH "/lib")
    set(CMAKE_INSTALL_RPATH ${QT_RUNTIME_PATH})
endif()

qt_add_resources(RESOURCES qml.qrc)

qt_add_executable(appMenuInteractivo
    main.cpp
    ${RESOURCES} #necesario para el qrc
)

qt_add_qml_module(appMenuInteractivo
    URI MenuInteractivo
    VERSION 1.0
    QML_FILES
    main.qml
    pages/Page_1.qml
    pages/Page_2.qml
    pages/Page_3.qml
    pages/Page_4.qml
    pages/Page_5.qml
    pages/Page_6.qml
    pages/Page_7.qml
    pages/Page_8.qml

    RESOURCES
    graphics/alarm.svg
    graphics/alarm-white.svg
    graphics/home.svg
    graphics/home-white.svg
    graphics/navigation.svg
    graphics/navigation-white.svg
    graphics/settings.svg
    graphics/settings-white.svg
)

target_link_libraries(appMenuInteractivo
    PRIVATE Qt6::Quick)

target_include_directories(appMenuInteractivo PRIVATE /opt/crosscontrol/include)

if (CMAKE_SYSTEM_PROCESSOR STREQUAL aarch64)    
    message("Include CCAux for iMX8")
    target_compile_definitions(appMenuInteractivo PRIVATE CCAUX)
    target_link_libraries(appMenuInteractivo PRIVATE cc-aux2)
    
    message("Include Sapcore for iMX8")
    target_link_directories(appMenuInteractivo PUBLIC /opt/crosscontrol/arm/imx8/lib)
    target_link_libraries(appMenuInteractivo PRIVATE sapcore)

    set(TARGET_INSTALL_DIR "/opt/appMenuInteractivo/${CMAKE_INSTALL_BINDIR}")
endif()

if (CMAKE_SYSTEM_PROCESSOR STREQUAL x86_64)
    message("Include Sapcore for VM")
    target_link_directories(appMenuInteractivo PUBLIC /opt/crosscontrol/x86_64/vm/lib)
    target_link_libraries(appMenuInteractivo PRIVATE sapcore)

    set(TARGET_INSTALL_DIR ".")
endif()

install(TARGETS appMenuInteractivo
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${TARGET_INSTALL_DIR})
