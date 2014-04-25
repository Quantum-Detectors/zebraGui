#include "caobject.h"

void callback(struct event_handler_args args)
{
    CAObject *caObject;
    if (args.status != ECA_NORMAL) {
        cerr << "caobject: Bad channel access on pv: " << ca_name(args.chid) << endl;
        return;
    }
    caObject = (CAObject*) args.usr;
    if (args.dbr != NULL) {
        caObject->caSetValue(args.dbr, args.type, args.count);
    }
}

void channelStatus(struct connection_handler_args args)
{
    CAObject *caObject;
    if (args.op == CA_OP_CONN_UP) {
        caObject = (CAObject*) ca_puser(args.chid);
        caObject->startMonitor();
    }
}

CAObject::CAObject(QQuickItem *parent) :
    QQuickItem(parent)
{
    int success;
    struct ca_client_context *context;
    channelID = QString("");
    caChannelID = 0;
    caEventID = 0;
    thisType = -1;
    // Attach to current context or create a new one if required.
    context = ca_current_context();
    if (context) {
        success = ca_attach_context(context);
        //cout << success << " Context " << getChannelID().toStdString() << "\n";
    } else {
        success = ca_context_create(ca_enable_preemptive_callback);
        //cout << "Create\n";
        /*switch (success) {
        case ECA_NORMAL:
            cout << "Preemptive\n";
            break;
        case ECA_ALLOCMEM:
            cout << "Allocz\n";
            break;
        case ECA_NOTTHREADED:
            cout << "NotThreaded\n";
        }*/

    }
    if (success != ECA_ISATTACHED && success != ECA_NORMAL)
        cerr << "ERROR: Bad context!\n";
}

CAObject::~CAObject()
{
    if (caEventID)
        ca_clear_subscription(caEventID);
}

void CAObject::startMonitor()
{
    void *pThis = this;
    if (thisType == -1)
        thisType = ca_field_type(caChannelID);
    /*if (thisType != DBR_CHAR)
        ca_create_subscription(DBR_STRING, 0, getCAChannelID(), DBE_VALUE,
                               callback, pThis, NULL);
    else
        ca_create_subscription(DBR_CHAR, 0, getCAChannelID(), DBE_VALUE,
                               callback, pThis, NULL);*/
    if (ca_element_count(getCAChannelID()) == 1)
        ca_create_subscription(DBR_STRING, 0, getCAChannelID(), DBE_VALUE,
                               callback, pThis, NULL);
    else
        ca_create_subscription(thisType, 0, getCAChannelID(), DBE_VALUE,
                               callback, pThis, NULL);
}

void CAObject::createCAChannel()
{
    QByteArray channelIDBytes;
    int chanCreationStatus;
    if (!channelID.isEmpty() && !caChannelID) {
        channelIDBytes = channelID.toLocal8Bit();
        chanCreationStatus = ca_create_channel(
                    (const char*) channelIDBytes.data(), channelStatus,
                    this, ChannelPriority, &caChannelID);
        setType(ca_field_type(caChannelID));
    } 
}

void CAObject::caSetValue(const void *newValue, long type, long count)
{
}

void CAObject::setChannelID(const QString &newID)
{
    channelID = newID;
    createCAChannel();
    emit channelIDChanged();
}
