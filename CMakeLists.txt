cmake_minimum_required(VERSION 2.8.12)

project(calculator)

option(BUILD_CALCULATOR_DESKTOP       "Build Calculator for KDE Desktop"        ON)
option(BUILD_CALCULATOR_HARMATTAN     "Build Calculator for Harmattan"          OFF)
option(BUILD_CALCULATOR_PLASMA_ACTIVE "Build Calculator for Plasma Active"      OFF)

include(FeatureSummary)
find_package(Qt5 REQUIRED COMPONENTS Core Qml Quick QuickWidgets Svg)

find_package(ECM 1.7.0 NO_MODULE REQUIRED)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${ECM_MODULE_PATH} ${ECM_KDE_MODULE_DIR})

include(KDEInstallDirs)
include(KDECMakeSettings)
include(KDECompilerSettings)
include(ECMInstallIcons)
include(GenerateExportHeader)
include(ECMAddAppIcon)

find_package(KF5 REQUIRED COMPONENTS
    I18n
    Crash
    Completion
    Config
    CoreAddons
    ConfigWidgets
    Declarative
    DocTools
    NewStuff
    Notifications
    XmlGui
    KIO
)

add_definitions(-DQT_USE_FAST_CONCATENATION -DQT_USE_FAST_OPERATOR_PLUS)

add_subdirectory( src )

feature_summary(WHAT ALL INCLUDE_QUIET_PACKAGES FATAL_ON_MISSING_REQUIRED_PACKAGES)
