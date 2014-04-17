#ifndef CHANNELACCESS_PLUGIN_H
#define CHANNELACCESS_PLUGIN_H

#include <QQmlExtensionPlugin>

class ChannelAccessPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "org.qt-project.Qt.QQmlExtensionInterface")
    
public:
    void registerTypes(const char *uri);
};

#endif // CHANNELACCESS_PLUGIN_H

