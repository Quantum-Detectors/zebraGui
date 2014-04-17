import QtQuick 2.1
import ChannelAccess 1.0

Indicator {
    property string channelID
    property string onCol: "#00FF00"
    property string offCol: "#006600"    

    CANumber {
        channelID: parent.channelID
        onIntValueChanged: {
            if (value == 1) {
                parent.col = parent.onCol
            } else {
                parent.col = parent.offCol
            }
        }
    }
}
