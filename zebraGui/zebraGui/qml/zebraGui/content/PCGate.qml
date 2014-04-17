import QtQuick 2.1
import QtQuick.Controls 1.0
import ChannelAccess 1.0


GroupBox {
    id: gateBox
    title: "Gate"
    anchors.horizontalCenter: parent.horizontalCenter
    property string units

    Row {
        spacing: 10
        anchors.margins: 8
        Column {
            anchors.verticalCenter: parent.verticalCenter
            Label {
                text: "Trig Source"
                font.bold: true

            }

            EnumMenu {
                id: stateSelector
                channelID: pvPrefix + ":PC_GATE_SEL"
            }
        }

        TextEntry {
            id:startBox
            channelID: pvPrefix + ":PC_GATE_START"
            label: "Gate Start"
            units: gateBox.units
        }

        TextEntry {
            id:widthBox
            channelID: pvPrefix + ":PC_GATE_WID"
            label: "Gate Width"
            units: gateBox.units
        }

        TextEntry {
            id:stepBox
            channelID: pvPrefix + ":PC_GATE_STEP"
            label: "Gate Step"
            units: gateBox.units
        }

        TextEntry {
            channelID: pvPrefix + ":PC_GATE_NGATE"
            label: "Num Gates"
        }

        InputSelector {
            id: externalBox
            channelID: pvPrefix + ":PC_GATE_INP"
            visible: false
            indicatorVisible: false
            anchors.bottom: parent.bottom
            height: 25
        }

        Column {
            anchors.verticalCenter: parent.verticalCenter
            Label {
                text: "Status"
                font.bold: true
            }

            Indicator {
                CANumber {
                    id: caGateOut
                    channelID: pvPrefix + ":PC_GATE_OUT"
                    onValueChanged: if (value == 1) {
                                        parent.col = "#00FF00"
                                    } else {
                                        parent.col = "#006600"
                                    }
                }
            }
        }
    }
    states: [
        State {
            name: "Time"
            when: stateSelector.value == "Time"
            PropertyChanges {
                target: gateBox
                units: timeUnits.value
            }
        },
        State {
            name: "Position"
            when: stateSelector.value == "Position"
            PropertyChanges {
                target: gateBox
                units: "mm"
            }
        },
        State {
            name: "External"
            when: stateSelector.value == "External"
            PropertyChanges {
                target: startBox
                opacity: 0
                visible: false
            }
            PropertyChanges {
                target: widthBox
                opacity: 0                
                visible: false
            }
            PropertyChanges {
                target: stepBox
                opacity: 0                
                visible: false
            }
            PropertyChanges {
                target: externalBox
                opacity: 1                
                visible: true

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
