import QtQuick 2.1
import QtQuick.Controls 1.0
import ChannelAccess 1.0

GroupBox {
    id: pulseBox
    title: "Pulse"
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
                channelID: pvPrefix + ":PC_PULSE_SEL"
            }
        }

        TextEntry {
            id: pulseStart
            channelID: pvPrefix + ":PC_PULSE_START"
            label: "Pulse Start"
            units: pulseBox.units
        }

        TextEntry {
            id: pulseWidth
            channelID: pvPrefix + ":PC_PULSE_WID"
            label: "Pulse Width"
            units: pulseBox.units
        }

        TextEntry {
            id: pulseStep
            channelID: pvPrefix + ":PC_PULSE_STEP"
            label: "Pulse Step"
            units: pulseBox.units
        }

        TextEntry {
            id: captDelay
            channelID: pvPrefix + ":PC_PULSE_DLY"
            label: "Capt Delay"
            units: pulseBox.units
            visible: false
        }

        TextEntry {
            id: maxPulses
            channelID: pvPrefix + ":PC_PULSE_MAX"
            label: "Max Pulses"
        }

        InputSelector {
            id: externalBox
            channelID: pvPrefix + ":PC_PULSE_INP"
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
                    id: caPulseOut
                    channelID: pvPrefix + ":PC_PULSE_OUT"
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
                target: pulseBox
                units: timeUnits.value
            }

            PropertyChanges {
                target: captDelay
                visible: true
            }
        },
        State {
            name: "Position"
            when: stateSelector.value == "Position"
            PropertyChanges {
                target: pulseBox
                units: "mm"
            }
        },
        State {
            name: "External"
            when: stateSelector.value == "External"
            PropertyChanges {
                target: pulseStart
                visible: false
                opacity: 0  
            }
            PropertyChanges {
                target: pulseWidth
                visible: false
                opacity: 0  
            }
            PropertyChanges {
                target: pulseStep
                visible: false
                opacity: 0  
            }
            PropertyChanges {
                target: externalBox
                visible: true
                opacity: 1
            }
            PropertyChanges {
                target: maxPulses
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
