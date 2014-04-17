import QtQuick 2.1
import ChannelAccess 1.0
import QtQuick.Controls 1.0

Rectangle {
    color: "#777777"
    property string channelID    
    height: label.height
    
    Text {
        id: label
        color: "light green"
        height: 20
        verticalAlignment: Text.AlignVCenter
        CAText {
            channelID: parent.parent.channelID
            onValueChanged: {
                parent.text = value
            }
        }
    }
}
