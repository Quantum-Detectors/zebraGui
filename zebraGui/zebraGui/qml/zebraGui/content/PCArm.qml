import QtQuick 2.1
import QtQuick.Controls 1.0
import ChannelAccess 1.0
import QtQuick.Layouts 1.0

GroupBox {
    id: armBox
    title: "Arm"

    RowLayout {
        spacing: 10
        Layout.fillWidth: true
        Label {
            text: "Trig Source"
            font.bold: true
            anchors.verticalCenter: parent.verticalCenter
        }

        EnumMenu {
        Layout.fillWidth: true
            id: stateSelector
            channelID: pvPrefix + ":PC_ARM_SEL"
        }

        InputSelector {
            id: externalBox
            channelID: pvPrefix + ":PC_ARM_INP"
            visible: false
            indicatorVisible: false
            anchors.bottom: parent.bottom
        }

        Button {
            CANumber {
                id: caArm
                channelID: pvPrefix + ":PC_ARM"
            }
            id: armButton
            text: "Arm"
            onClicked: caArm.value = 1
        }

        Button {
            CANumber {
                id: caDisarm
                channelID: pvPrefix + ":PC_DISARM"
            }
            text: "Disarm"
            onClicked: caDisarm.value = 0
        }

        Indicator {
            CANumber {
                id: caArmOut
                channelID: pvPrefix + ":PC_ARM_OUT"
                onValueChanged: if (value == 1) {
                                    parent.col = "#00FF00"
                                } else {
                                    parent.col = "#006600"
                                }
            }
            label: "Arm Status"
            anchors.verticalCenter: parent.verticalCenter
            bit: parseInt(caArmOut.value, 10)
        }
    }

    states: [
    State {
            name: "External"
            when: stateSelector.value == "External"
            PropertyChanges {
                target: externalBox
                visible: true
                opacity: 1
            }
            PropertyChanges {
                target: armButton
                visible: false
                opacity: 0  
            }
        }
    ]
    transitions: [
        Transition {
            from: "External"
            SequentialAnimation {
                PropertyAnimation { property: "visible"; duration: 5   }
                PropertyAnimation { property: "opacity"; duration: 500 }
            }
        },
        Transition {
            to: "External"
            SequentialAnimation {
                PropertyAnimation { property: "opacity"; duration: 500 }
                PropertyAnimation { property: "visible"; duration: 5   }                
            }
        }        
    ]      
}
