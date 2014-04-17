import QtQuick 2.1
import QtQuick.Controls 1.0
import ChannelAccess 1.0

Row {
    property bool isFalling
    property string channelID
    spacing: 6

    onIsFallingChanged:
        if (isFalling && caEdge.value != "Yes") {
            caEdge.value = "Yes"
        } else if (!isFalling && caEdge.value != "No"){
            caEdge.value = "No"
        }

    CANumber {
        id: caEdge
        channelID: parent.channelID
        onValueChanged: {
            if (value == "Yes") {
                isFalling = true
            } else {
                isFalling = false
            }
        }
    }

    ExclusiveGroup {
        id: edgeGroup
        current: if (isFalling) {
                     return falling
                 } else {
                     return rising
                 }
    }

    RadioButton {
        id: rising
        text: "Rising"
        exclusiveGroup: edgeGroup
        onClicked: isFalling = false
        anchors.verticalCenter: parent.verticalCenter
    }

    RadioButton {
        id: falling
        text: "Falling"
        exclusiveGroup: edgeGroup
        onClicked: isFalling = true
        anchors.verticalCenter: parent.verticalCenter
    }
}
