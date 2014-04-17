#ifndef CALONG_H
#define CALONG_H

#include "caobject.h"

class CANumber : public CAObject
{
    Q_OBJECT
    Q_DISABLE_COPY(CANumber)
    Q_PROPERTY(QString value READ getValue WRITE setValue NOTIFY valueChanged)
    //Q_PROPERTY(QString dbrType READ getDBRType WRITE setDBRType)
    Q_PROPERTY(int intValue READ getIntValue WRITE setIntValue
               NOTIFY valueChanged)

public:
    explicit CANumber(CAObject *parent = 0);
    ~CANumber();
    QString getValue();
    void setValue(const QString &newValue);
    void caSetValue(const void *newValue, long type, long count);
    //void caSetValue(dbr_double_t newValue);
    int getIntValue();
    void setIntValue(int newValue);

private:
    QString value;

signals:
    void valueChanged();
};

#endif // CALONG_H
