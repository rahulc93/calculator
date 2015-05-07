include_directories(
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_BINARY_DIR}
    ${QT_INCLUDES}
    ${PHONON_INCLUDES}
)

set(calculator_SRCS main.cpp calculator.cpp)
add_executable(calculator ${calculator_SRCS})

target_link_libraries(calculator
    Qt5::QuickWidgets
    Qt5::Core
    KF5::I18n
    KF5::Declarative
)

install(
    DIRECTORY qml/
    DESTINATION ${KDE_INSTALL_DATADIR}/calculator/qml)

install(
    TARGETS calculator  ${KDE_INSTALL_TARGETS_DEFAULT_ARGS}
)
