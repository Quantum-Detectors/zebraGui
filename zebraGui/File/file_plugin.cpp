#include "file_plugin.h"
#include "file.h"

#include <qqml.h>

void FilePlugin::registerTypes(const char *uri)
{
    // @uri File
    qmlRegisterType<File>(uri, 1, 0, "File");
}


