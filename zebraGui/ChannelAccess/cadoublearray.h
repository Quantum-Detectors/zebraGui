#ifndef CADOUBLEARRAY_H
#define CADOUBLEARRAY_H

#include "caobject.h"

class CADoubleArray : public CAObject
{
    Q_OBJECT
    Q_DISABLE_COPY(CADoubleArray)
    //Q_PROPERTY(QList<qreal> value READ getValue WRITE setValue NOTIFY valueChanged)

public:
    CADoubleArray();
    void caSetValue(const void *newValue, long type, long count);
    Q_INVOKABLE QList<double> getValueList();
    //QList<qreal> getValue();
    //void setValue();

private:
    QList<double> value;

signals:
    void valueChanged(QList<double> newList);
};

#endif // CADOUBLEARRAY_H
