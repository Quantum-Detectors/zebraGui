import QtQuick 2.0
import QtQuick.Controls 1.0
import ChannelAccess 1.0

Column {
    id: base
    property string channelID
    property string label
    property string units

    Label {
        id: label
        text: parent.label
        font.bold: true
    }

    CANumber {
        id: theValue
        channelID: parent.channelID
    }

    Row {

        TextField {
            text: theValue.value
            onAccepted: theValue.value = text
            width: label.width > 40 ? label.width + 10 : 50
        }

        Label {
            text: base.units
            font.bold: true
            anchors.verticalCenter: parent.verticalCenter
        }
    }
}
