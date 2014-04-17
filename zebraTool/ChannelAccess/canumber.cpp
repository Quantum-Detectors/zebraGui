#include <iostream>
using namespace std;
#include "canumber.h"

CANumber::CANumber(CAObject *parent) : CAObject(parent)
{
}

CANumber::~CANumber()
{

}

void CANumber::setValue(const QString &newValue)
{
    chid chanID;
    QByteArray channelIDBytes;
    channelIDBytes = getChannelID().toLocal8Bit();
    if (ca_create_channel(static_cast<const char*>(channelIDBytes.data()),
                          NULL, NULL, 0, &chanID) != ECA_NORMAL)
        return;
    ca_pend_io(0.1);
    ca_put(DBR_STRING, chanID,
           static_cast<void*>(newValue.toLocal8Bit().data()));
    ca_flush_io();
    emit valueChanged();
}

QString CANumber::getValue()
{
    createCAChannel();
    return QString(value);
}

int CANumber::getIntValue()
{
    return getValue().toInt();
}

void CANumber::setIntValue(int newValue)
{
    QString newStrVal;
    newStrVal.setNum(newValue);
    setValue(newStrVal);
}

void CANumber::caSetValue(const void *newValue, long type, long count)
{
    value = static_cast<const char*>(newValue);
    emit valueChanged();
}
