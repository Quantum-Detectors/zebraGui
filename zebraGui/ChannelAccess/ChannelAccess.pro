TEMPLATE = lib
CONFIG += plugin static
QT += qml quick

DESTDIR += $$(TARGET_PREFIX)/ChannelAccess
OBJECTS_DIR = tmp
MOC_DIR = tmp
QMAKE_MOC_OPTIONS += -Muri=ChannelAccess

TARGET = ChannelAccess

unix {
#LIBS += -L$$(EPICS_BASE)/lib/linux-x86_64 -lca
# -Wl,-rpath $$(EPICS_BASE)/lib/linux-x86_64

INCLUDEPATH += $$(EPICS_BASE)/include/ \
$$(EPICS_BASE)/include/os/Linux/
}

win32 {
LIBS += -L$$(EPICS_BASE)/lib/win32-x86 -lca

INCLUDEPATH += $$(EPICS_BASE)/include/ \
$$(EPICS_BASE)/include/os/WIN32
}

# Input
SOURCES += \
    channelaccess_plugin.cpp \
    caobject.cpp \
    catext.cpp \
    caenum.cpp \
    canumber.cpp \
    cadoublearray.cpp

HEADERS += \
    channelaccess_plugin.h \
    caobject.h \
    catext.h \
    caenum.h \
    canumber.h \
    cadoublearray.h

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



