# Add more folders to ship with the application, here
folder_01.source = qml/zebraGui
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01

# Additional import path used to resolve QML modules in Creator's code model
LIBS += -L../../prefix/File -lFile
LIBS += -L../../prefix/ChannelAccess -lChannelAccess
LIBS += -l readline
LIBS += $$(EPICS_BASE)/lib/linux-x86_64/libca.a
LIBS += $$(EPICS_BASE)/lib/linux-x86_64/libCom.a
LIBS += -L$$[QT_INSTALL_PREFIX]/qml/QtQuick/PrivateWidgets -lwidgetsplugin
INCLUDEPATH += ../File ../ChannelAccess
 
CONFIG += static qt import_plugins 
DEFINES += STATIC_BUILD
 
SOURCES += main.cpp

# Installation path
target.path = $$(TARGET_PREFIX)

# Please do not modify the following two lines. Required for deployment.
include(qtquick2controlsapplicationviewer/qtquick2controlsapplicationviewer.pri)
qtcAddDeployment()
