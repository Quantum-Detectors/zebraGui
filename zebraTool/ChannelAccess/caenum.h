#ifndef CAENUM_H
#define CAENUM_H

#include "caobject.h"

class CAEnum : public CAObject
{
    Q_OBJECT
    Q_DISABLE_COPY(CAEnum)
    Q_PROPERTY(QString value READ getValue WRITE setValue NOTIFY valueChanged)
    Q_PROPERTY(QList<QString> options READ getOptions NOTIFY optionsChanged)
    Q_PROPERTY(QString channelID READ getChannelID WRITE setChannelID
               NOTIFY channelIDChanged)

public:
    explicit CAEnum(CAObject *parent = 0);
    ~CAEnum();
    QString getValue();
    void setValue(const QString newValue);
    QList<QString> getOptions();
    void caSetValue(const void *newValue, long type, long count);
    void caSetOptions(struct dbr_ctrl_enum theOptions);
    //void setChannelID(const QString &newID);
    //void startMonitor();

private:
    QString value;
    QList<QString> options;

signals:
    void valueChanged();
    void channelIDChanged();
    void optionsChanged();

};

#endif // CAENUM_H
