#ifndef CATEXT_H
#define CATEXT_H

#include "caobject.h"

class CAText : public CAObject
{
    Q_OBJECT
    Q_DISABLE_COPY(CAText)
    Q_PROPERTY(QString value READ getValue WRITE setValue NOTIFY valueChanged)
    /*Q_PROPERTY(QString channelID READ getChannelID WRITE setChannelID
               NOTIFY channelIDChanged)*/
    
public:
    explicit CAText(CAObject *parent = 0);
    ~CAText();
    QString getValue();
    void setValue(const QString &str);
    void caSetValue(const void *newValue, long type, long count);
    void startMonitor();

private:
    QString value;

signals:
    void valueChanged();
    void channelIDChanged();
};

QML_DECLARE_TYPE(CAText)

#endif // CATEXT_H

