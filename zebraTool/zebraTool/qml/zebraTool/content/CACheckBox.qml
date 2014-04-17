import QtQuick 2.1
import ChannelAccess 1.0
import QtQuick.Controls 1.0

CheckBox {
    property string channelID
    CANumber {
        id: pv
        channelID: parent.channelID
        visible: false
        onValueChanged: {
            if (value == "Yes" || intValue == 1) {
                parent.checked = 1
            } else {
                parent.checked = 0
            }
        }
    }
    onClicked: pv.intValue = checked
}
