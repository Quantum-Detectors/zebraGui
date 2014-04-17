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
            text: "Input"
        }
        InputSelector {
            channelID: baseChannel + "INP"
        }

        Label {
            text: "Trigger on"
        }
        EdgeSelector {
            channelID: polarityChannel + ":B" + polarityIndex.toString(16).toUpperCase()  
        }

        Label {
            text: "Delay Before"
        }
        TextField {
            onAccepted: preDelay.value = text
            Layout.fillWidth: true
            CANumber {
                id: preDelay
                channelID: baseChannel + "DLY"
                onValueChanged: parent.text = value
            }
        }

        Label {
            text: "Pulse Width"
        }
        TextField {
            onAccepted: pulseWidth.value = text
            Layout.fillWidth: true
            CANumber {
                id: pulseWidth
                channelID: baseChannel + "WID"
                onValueChanged: parent.text = value
            }
        }

        Label {
            text: "Time Units"
        }
        EnumMenu {
            channelID: baseChannel + "PRE"
        }

        Rectangle {
            height: 3
            color: "black"
            Layout.fillWidth: true
            Layout.columnSpan: 2
        }

        Label {
            text: "Output Pulse"
        }
        CAIndicator {
            channelID: baseChannel + "OUT"
            Layout.alignment: Grid.AlignRight
        }
        Label {
            text: "Trig While Active"
        }
        CAIndicator {
            channelID: pvPrefix + ":SYS_STATERR.B" + (polarityIndex - 12)
            Layout.alignment: Grid.AlignRight
                    onCol: "#FF0000"
                    offCol: "#660000"              
        }        
    }
}
