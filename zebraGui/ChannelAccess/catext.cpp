#include <iostream>
using namespace std;
#include "catext.h"

CAText::CAText(CAObject *parent) : CAObject(parent)
{

}

CAText::~CAText()
{

}

void CAText::setValue(const QString &newValue)
{
    chid chanID;
    QByteArray valueBytes, channelIDBytes;
    valueBytes = newValue.toLocal8Bit();
    channelIDBytes = getChannelID().toLocal8Bit();
    if (ca_create_channel(static_cast<const char*>(channelIDBytes.constData()),
                          NULL, NULL, 0, &chanID) != ECA_NORMAL) {
        return;
    }
    ca_pend_io(0.5);
    if (ca_field_type(chanID) == DBF_STRING)
        ca_put(DBR_STRING, chanID,
               static_cast<const void*>(valueBytes.constData()));
    else
        ca_array_put(DBR_CHAR, ca_element_count(chanID), chanID,
                     static_cast<const void*>(valueBytes.constData()));
    ca_flush_io();
    emit valueChanged();
}

QString CAText::getValue()
{
    createCAChannel();
    return value;
}

void CAText::caSetValue(const void *newValue, long type, long count)
{
    value = QString::fromLocal8Bit(static_cast<const char*>(newValue));
    emit valueChanged();
}
