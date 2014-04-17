#include "qtquick2controlsapplicationviewer.h"
#include <QtQml>
#include <channelaccess_plugin.h>
#include <file_plugin.h>

class QtQuick2PrivateWidgetsPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "org.qt-project.Qt.QQmlExtensionInterface/1.0")

public:
    void registerTypes(const char *uri);
};


int main(int argc, char *argv[])
{
    QApplication::setDesktopSettingsAware(false);
    Application app(argc, argv);
    
    QtQuick2ControlsApplicationViewer viewer;
Q_IMPORT_PLUGIN(ChannelAccessPlugin)
Q_IMPORT_PLUGIN(FilePlugin)    
Q_IMPORT_PLUGIN(QtQuick2PrivateWidgetsPlugin) 
    viewer.setContextProperty("pvPrefix",  "TESTZEBRA:ZEBRATEST:");
    viewer.setMainQmlFile(QStringLiteral("qml/zebraGui/main.qml"));
    viewer.show();

    return app.exec();
}
