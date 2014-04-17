import QtQuick 2.1
import QtQuick.Controls 1.0
import ChannelAccess 1.0

Row {
    property string channelID
    property bool indicatorVisible: true
    spacing: 6

    SpinBox {
        minimumValue: 0
        maximumValue: 63
        width: 40
        onValueChanged: {
            if (caSpin1.intValue != value) {
                caSpin1.intValue = value
            }
        }
        anchors.verticalCenter: parent.verticalCenter

        CANumber {
            id: caSpin1
            channelID: parent.parent.channelID
            onValueChanged: parent.value = intValue
        }
    }

    CALabel {
        width: 100
        anchors.verticalCenter: parent.verticalCenter
        channelID: parent.channelID + ":STR"
    }

    CAIndicator {
        anchors.verticalCenter: parent.verticalCenter
        channelID: parent.channelID + ":STA"
        visible: parent.indicatorVisible
    }
}
