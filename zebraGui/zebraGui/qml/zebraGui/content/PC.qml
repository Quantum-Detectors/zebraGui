import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import QtQuick.Layouts 1.0
import ChannelAccess 1.0
//import QtQuick 1.0

ColumnLayout {
    id: basePC
    spacing: 3
    property int diagramWidth: diagram.width

    Image {
        id: diagram
        fillMode: Image.PreserveAspectFit
        source: "../ZebraDiagram.png"
        anchors.horizontalCenter: parent.horizontalCenter
    }
    GroupBox {
        id: setupBox
        title: "Setup"
        Layout.fillWidth: true
        ColumnLayout {
            Layout.fillWidth: true
            RowLayout {
                Layout.fillWidth: true
                Label {
                    text: "Capture"
                    font.bold: true
                    Layout.fillWidth: true
                }

                CANumber {
                    id: caCapture
                    channelID: pvPrefix + ":PC_BIT_CAP"
                    onValueChanged: {
                        enc1.checked = intValue & 1
                        enc2.checked = intValue & 2
                        enc3.checked = intValue & 4
                        enc4.checked = intValue & 8
                        sys1.checked = intValue & 16
                        sys2.checked = intValue & 32
                        div1.checked = intValue & 64
                        div2.checked = intValue & 128
                        div3.checked = intValue & 256
                        div4.checked = intValue & 512
                    }
                }

                GridLayout {
                    Layout.fillWidth: true
                    columns: 10
                    CheckBox {
                            Layout.fillWidth: true
                        id: enc1
                        text: "Enc1"
                        checked: caCapture.intValue & 1
                        onClicked: caCapture.intValue ^= 1
                    }
                    CheckBox {
                            Layout.fillWidth: true
                        id: enc2
                        text: "Enc2"
                        onClicked: caCapture.intValue ^= 2
                    }
                    CheckBox {
                        id: enc3
                        text: "Enc3"
                        onClicked: caCapture.intValue ^= 4
                    }
                    CheckBox {
                        id: enc4
                        text: "Enc4"
                        onClicked: caCapture.intValue ^= 8
                    }
                    CheckBox {
                        id: sys1
                        text: "Sys1"
                        onClicked: caCapture.intValue ^= 16
                    }
                    CheckBox {
                        id: sys2
                        text: "Sys2"
                        onClicked: caCapture.intValue ^= 32
                    }
                    CheckBox {
                        id: div1
                        text: "Div1"
                        onClicked: caCapture.intValue ^= 64
                    }
                    CheckBox {
                        id: div2
                        text: "Div2"
                        onClicked: caCapture.intValue ^= 128
                    }
                    CheckBox {
                        id: div3
                        text: "Div3"
                        onClicked: caCapture.intValue ^= 256
                    }
                    CheckBox {
                        id: div4
                        text: "Div4"
                        onClicked: caCapture.intValue ^= 512
                    }
                }
            }
            Row {
                anchors.leftMargin: 10
                spacing: 10

                Label {
                    text: "Posn Trig"
                    font.bold: true
                    anchors.verticalCenter: parent.verticalCenter
                }

                EnumMenu {
                    channelID: pvPrefix + ":PC_ENC"
                }

                Label {
                    text: "Posn Dir"
                    font.bold: true
                    anchors.verticalCenter: parent.verticalCenter
                }

                EnumMenu {
                    channelID: pvPrefix + ":PC_DIR"
                }

                Label {
                    text: "Time Units"
                    font.bold: true
                    anchors.verticalCenter: parent.verticalCenter
                }

                EnumMenu {
                    id: timeUnits
                    channelID: pvPrefix + ":PC_TSPRE"
                }
            }
        }
    }

        PCArm { id: armBox;         Layout.fillWidth: true }

        PCGate {
            id: gateBox
            units: timeUnits.value
                    Layout.fillWidth: true
        }
        PCPulse { id: pulseBox;         Layout.fillWidth: true }

    Plot {
        id: plot
        baseName: pvPrefix + ":"
        
    }

    RowLayout {
        Layout.fillWidth: true    
        Button {
            text: "Display Captured Data..."
            Layout.fillWidth: true 
            onClicked: plot.show()
        }
        Label {
            id: downLabel
            text: "Data Download in Progress"
        }

        CAIndicator {
            id: downIndicator
            channelID: pvPrefix + ":ARRAY_ACQ"
        }    
    }
}
