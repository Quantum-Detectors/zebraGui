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

Q_IMPORT_PLUGIN(ChannelAccessPlugin)
Q_IMPORT_PLUGIN(FilePlugin)    
Q_IMPORT_PLUGIN(QtQuick2PrivateWidgetsPlugin)

int main(int argc, char *argv[])
{
    QApplication::setDesktopSettingsAware(false);
    Application app(argc, argv);
    QtQuick2ControlsApplicationViewer viewer;

    // If we have one argument then it must be our pvPrefix
    if (argc == 2) {    
        viewer.setContextProperty("pvPrefix",  argv[1]);
    } else {
        viewer.setContextProperty("pvPrefix",  "TESTZEBRA");
    }    
    viewer.setMainQmlFile(QStringLiteral("qml/zebraGui/main.qml"));
    viewer.show();

    return app.exec();
}
