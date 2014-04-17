#include "channelaccess_plugin.h"
#include "catext.h"
#include "caenum.h"
#include "canumber.h"
#include "cadoublearray.h"

#include <qqml.h>

void ChannelAccessPlugin::registerTypes(const char *uri)
{
    // @uri ChannelAccess
    qmlRegisterType<CAText>(uri, 1, 0, "CAText");
    qmlRegisterType<CAEnum>(uri, 1, 0, "CAEnum");
    qmlRegisterType<CANumber>(uri, 1, 0, "CANumber");
    qmlRegisterType<CADoubleArray>(uri, 1, 0, "CADoubleArray");
}


