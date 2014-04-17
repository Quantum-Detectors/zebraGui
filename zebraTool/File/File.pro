TEMPLATE = lib
CONFIG += plugin static
QT += qml quick

DESTDIR += $$(TARGET_PREFIX)/File
OBJECTS_DIR = tmp
MOC_DIR = tmp
QMAKE_MOC_OPTIONS += -Muri=File

TARGET = File
TARGETPATH = File

HEADERS += \
    file_plugin.h \
    file.h

SOURCES += \
    file_plugin.cpp \
    file.cpp

OTHER_FILES += qmldir

copyfile = $$PWD/qmldir
copydest = $$DESTDIR

# On Windows, use backslashes as directory separators
win32: {
    copyfile ~= s,/,\\,g
    copydest ~= s,/,\\,g
}

# Copy the qmldir file to the same folder as the plugin binary
QMAKE_POST_LINK += $$QMAKE_COPY $$quote($$copyfile) $$quote($$copydest) $$escape_expand(\\n\\t)

