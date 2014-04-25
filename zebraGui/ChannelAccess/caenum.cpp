#include "caenum.h"

void optionCallback(struct event_handler_args args)
{
    CAEnum *caEnum;
    if (args.status != ECA_NORMAL) {
        cerr << "caenum: Bad channel access on pv: " << ca_name(args.chid) << endl;
        return;
    }
    caEnum = (CAEnum*) args.usr;
    if (args.dbr != NULL) {
        struct dbr_ctrl_enum *ctrlEnum;
        void *foo = const_cast<void*>(args.dbr);
        ctrlEnum = (dbr_ctrl_enum*)foo;
        caEnum->caSetOptions(*ctrlEnum);
    }
}

CAEnum::CAEnum(CAObject *parent) : CAObject(parent)
{
    value = "0";
}

CAEnum::~CAEnum()
{
}

void CAEnum::setValue(const QString newValue)
{
    chid chanID;
    const char *channelIDChars;
    //cout << newValue.toStdString() << "\n";
    channelIDChars = getChannelID().toLocal8Bit().constData();
    ca_create_channel(channelIDChars, NULL, NULL, 0, &chanID);
    ca_pend_io(0.1);
    ca_put(DBR_STRING, chanID,
           static_cast<void*>(newValue.toLocal8Bit().data()));
    ca_flush_io();
    emit valueChanged();
}

QString CAEnum::getValue()
{
    createCAChannel();
    return QString(value);
}

void CAEnum::caSetValue(const void *newValue, long type, long count)
{
    value = static_cast<const char*>(newValue);
    ca_get_callback(DBR_CTRL_ENUM, getCAChannelID(), optionCallback,
                    static_cast<void*>(this));
    ca_flush_io();
    emit valueChanged();
}

QList<QString> CAEnum::getOptions()
{
    if (options.length() != 0)
        return options;
    else
        return QList<QString>();
}

void CAEnum::caSetOptions(dbr_ctrl_enum theOptions)
{
    const int n_elements = options.length();
    int changed = 0;
    for (int i=0; i<theOptions.no_str; i++) {
        QString value = QString::fromLocal8Bit(theOptions.strs[i]);
        if (i >= n_elements) {
            options.append(value);
            changed = 1;
        } else if (value != options[i]) {
            options[i] = value;
        }
    }
    if (changed) {
        emit optionsChanged();
    }
}

/*void CAEnum::setChannelID(const QString &newID)
{
    CAObject::setChannelID(newID);
}*/
