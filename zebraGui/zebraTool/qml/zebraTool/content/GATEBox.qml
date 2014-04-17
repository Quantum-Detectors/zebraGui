import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import ChannelAccess 1.0

GroupBox {
    property string baseChannel
    property string polarityChannel
    property int polarityIndex

    GridLayout {
        columns: 2

        Label {
            text: "INP1 (set)"
        }
        InputSelector {
            channelID: baseChannel + "INP1"
        }

        Label {
            text: "Trigger edge"
        }
        EdgeSelector {
            channelID: polarityChannel + ":B" + polarityIndex
        }

        Label {
            text: "INP2 (reset)"
        }
        InputSelector {
            channelID: baseChannel + "INP2"
        }

        Label {
            text: "Trigger edge"
        }
        EdgeSelector {
            channelID: polarityChannel + ":B" + (polarityIndex + 4)
        }
        Rectangle {
            color: "black"
            height: 3
            Layout.fillWidth: true
            Layout.columnSpan: 2
        }
        Label {
            text: "OUT"
        }
        CAIndicator {
            Layout.alignment: Qt.AlignRight
            channelID: baseChannel + "OUT"
        }        
    }
}
