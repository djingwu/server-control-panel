include(../../../common.pri)

TEMPLATE = lib

CONFIG += plugin

QT += core gui widgets

TARGET = $$qtLibraryTarget(HelloWorldPlugin)

SOURCES += \
        HelloWorldPlugin.cpp 

HEADERS += \
        HelloWorldPlugin.h
        
# Target Folder

DESTDIR = $${PLUGINS_DIR}

# Deploy Plugin Description

plugin_description.path = $${PLUGINS_DIR}
plugin_description.files += HelloWorldPlugin.json

INSTALLS += plugin_description
COPIES += plugin_description