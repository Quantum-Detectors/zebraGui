#include "cadoublearray.h"

CADoubleArray::CADoubleArray()
{
}

/*double * CADoubleArray::getValue()
{
    createCAChannel();
    return value;
}*/

void CADoubleArray::caSetValue(const void *newValue, long type, long count)
{
    QList<double> newValueList;
    const double *newValues = static_cast<const double*>(newValue);
    for (long i=0; i<count; i++) {
        newValueList.append(static_cast<double>(newValues[i]));
    }
    value = newValueList;
    emit valueChanged(value);
}

QList<double> CADoubleArray::getValueList()
{
    return value;
}
