#ifndef CAOBJECT_H
#define CAOBJECT_H

#include <QQuickItem>
#include "cadef.h"
#include <iostream>
using namespace std;

const capri ChannelPriority = 0;

void callback(struct event_handler_args args);
void channelStatus(struct connection_handler_args args);

class CAObject : public QQuickItem
{
    Q_OBJECT
    Q_DISABLE_COPY(CAObject)
    Q_PROPERTY(QString channelID READ getChannelID WRITE setChannelID
               NOTIFY channelIDChanged)
public:
    explicit CAObject(QQuickItem *parent = 0);
    ~CAObject();
    const QString getChannelID() const { return channelID; }
    void setChannelID(const QString &newID);
    void startMonitor();
    void setType(const int newType) { thisType = newType; }
    int getType() const { return thisType; }
    void setCAChannelID(chid newID) { caChannelID = newID; }
    chid getCAChannelID() const { return caChannelID; }
    void createCAChannel();
    virtual void caSetValue(const void *newValue, long type, long count);
    
signals:
    void valueChanged();
    void channelIDChanged();
    
public slots:

private:
    int thisType;
    chid caChannelID;
    evid caEventID;
    QString channelID;

    
};

#endif // CAOBJECT_H
