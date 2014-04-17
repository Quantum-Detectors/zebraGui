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
            text: "Input (INP)"
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
            text: "Divisor (DIV)"
        }
        TextField {
            onAccepted: divisor.intValue = text
            Layout.fillWidth: true
            CANumber {
                id: divisor
                channelID: baseChannel + "DIV"
                onValueChanged: parent.text = intValue
            }
        }
        Label {
            text: "First Pulse"
        }        

        Row {

            CANumber {
                id: caPulse
                channelID: baseChannel + "DIV_FIRST" + (polarityIndex - 8)
                onValueChanged: {
                    if (value == "Yes") {
                        pulseGroup.current = yesButton
                    } else {
                        pulseGroup.current = noButton
                    }
                }
            }
            
            ExclusiveGroup { 
                id: pulseGroup
                onCurrentChanged: {
                    caPulse.value = current == yesButton
                }
            }
            
            RadioButton {
                id: yesButton
                text: "#1 (OUTN)"
                exclusiveGroup: pulseGroup
                anchors.verticalCenter: parent.verticalCenter
            }            
            
            RadioButton {
                id: noButton
                text: "#0 (OUTD)"
                exclusiveGroup: pulseGroup
                anchors.verticalCenter: parent.verticalCenter
            }            
        }
                    
        Rectangle {
            height: 3
            color: "black"
            Layout.fillWidth: true
            Layout.columnSpan: 2
        }

        Label {
            text: "Every Dth\nPulse (OUTD)"
        }
        CAIndicator {
            channelID: baseChannel + "OUTD"
            Layout.alignment: Grid.AlignRight
        }

        Label {
            text: "Every other\nPulse (OUTN)"
        }
        CAIndicator {
            channelID: baseChannel + "OUTN"
            Layout.alignment: Grid.AlignRight
        }
    }
}
