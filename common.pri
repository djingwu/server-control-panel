# define project folders
PROJECT_DIR         = $$PWD
LIBS_DIR            = $$PWD/libs
SHADOWED_BUILD_DIR  = $$shadowed($$PWD)
BUILD_DIR           = $$SHADOWED_BUILD_DIR/build
CONFIG(debug, debug|release) {
    RELEASE_DIR     = $$SHADOWED_BUILD_DIR/debug
} else {
    RELEASE_DIR     = $$SHADOWED_BUILD_DIR/release
}
PLUGINS_DIR         = $$RELEASE_DIR/plugins

message(Project folder: $${PROJECT_DIR})
message(Library folder: $${LIBS_DIR})
message(Shadow folder:  $${SHADOWED_BUILD_DIR})
message(Build folder:   $${BUILD_DIR})
message(Release folder: $${RELEASE_DIR})
message(Plugins folder: $${PLUGINS_DIR})

OBJECTS_DIR = $$BUILD_DIR/.obj
MOC_DIR     = $$BUILD_DIR/.moc
RCC_DIR     = $$BUILD_DIR/.qrc
UI_DIR      = $$BUILD_DIR/.u

if(!equals(QT_MAJOR_VERSION, 5)) {
    error("This program can only be compiled with Qt 5.")
}

CONFIG(debug, debug|release) {
    DEBUG_EXT = d
} else {
    DEBUG_EXT =
}

# emit warnings if you use deprecated features
DEFINES += QT_DEPRECATED_WARNINGS

# disable all deprecated APIs before the following version
DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x051100

# disable the creation of debug/release folders in shadow build folders
# https://bugreports.qt.io/browse/QTCREATORBUG-13807
#CONFIG -= debug_and_release

# not sure, if this works from a pro file
# if not, diable qml_debug in the project configuration dialog
CONFIG -= qml_debug

# enable file copy feature
# this exists, because INSTALLS doesn't work cross-platform
CONFIG += file_copies
