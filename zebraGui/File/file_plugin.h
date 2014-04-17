#ifndef FILE_PLUGIN_H
#define FILE_PLUGIN_H

#include <QQmlExtensionPlugin>

class FilePlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "org.qt-project.Qt.QQmlExtensionInterface")
    
public:
    void registerTypes(const char *uri);
};

#endif // FILE_PLUGIN_H

