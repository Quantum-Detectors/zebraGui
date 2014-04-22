import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.0
import ChannelAccess 1.0

RowLayout {
    spacing: 50
    Layout.fillWidth: true

    FileDialog {
        id: fileDialog
        onAccepted: {
            filePath.text = fileUrl.toString().replace("file://", "")
            caFilePath.value = filePath.text
        }
    }

    ColumnLayout {
        RowLayout {
            ColumnLayout {
                anchors.top: parent.top
                Label { text: "Version" }
                Rectangle {
                    color: "#777777"
                    height: sys_ver.height
                    Layout.fillWidth: true                                    
                    Text {
                        id: sys_ver
                        color: "light green"
                        height: 20
                        verticalAlignment: Text.AlignVCenter
                        CANumber {
                            channelID: pvPrefix + ":SYS_VER"
                            onIntValueChanged: {
                                parent.text = "0x" + intValue.toString(16)
                            }
                        }
                    }   
                }                 
                Button {
                    text: "Open\nin a\nnew\nscreen"
                    Layout.maximumWidth: 50
                    Layout.minimumHeight: 80
                    Layout.alignment: Qt.AlignCenter
                    onClicked: sysWindow.show()
                }
            }

            GroupBox {
                title: "Front Panel Outputs"
                Layout.fillWidth: true

                ColumnLayout {
                    Repeater {
                        id: repeat
                        model: 12
                        property var outputs: ["OUT1_TTL", "OUT1_NIM",
                            "OUT1_LVDS", "OUT2_TTL", "OUT2_NIM", "OUT2_LVDS",
                            "OUT3_TTL", "OUT3_OC", "OUT3_LVDS", "OUT4_TTL",
                            "OUT4_NIM", "OUT4_PECL"]

                        Row {
                            spacing: 6

                            Label {
                                text: repeat.outputs[index].replace("_", " ")
                                width: 80
                                anchors.verticalCenter: parent.verticalCenter
                            }
                            InputSelector {
                                channelID: pvPrefix + ":" + repeat.outputs[index]
                            }
                        }
                    }
                }
            }
        }

        GroupBox {
            title: "Write Regs to File/Flash"
            Layout.fillWidth: true
            
            ColumnLayout {
                anchors.fill: parent

                RowLayout {
                Layout.fillWidth: true 
                    TextField {
                        id: filePath
                        placeholderText: "File to write to..."
                        maximumLength: 256
                        Layout.fillWidth: true
                        onAccepted: caFilePath.value = text
                        text: caFilePath.value

                        CAText {
                            id: caFilePath
                            channelID: pvPrefix + ":CONFIG_FILE"
                        }
                    }
                    Button {
                        text: "Select"
                        onClicked: fileDialog.open()
                    }
                }

                RowLayout {
                    Layout.fillWidth: true 
                    Button {
                        text: "Store to File"
                        onClicked: write.value = 1
                        Layout.fillWidth: true 

                        CANumber {
                            id: write
                            channelID: pvPrefix + ":CONFIG_WRITE.PROC"
                        }
                    }

                    Button {
                        text: "Restore from File"
                        onClicked: read.value = 1
                        Layout.fillWidth: true 

                        CANumber {
                            id: read
                            channelID: pvPrefix + ":CONFIG_READ.PROC"
                        }
                    }
                }

                CALabel {
                    Layout.fillWidth: true
                    channelID: pvPrefix + ":CONFIG_STATUS"
                }

                RowLayout {
                    Layout.fillWidth: true 

                    Button {
                        text: "Store to Flash"
                        onClicked: store.value = 1
                        Layout.fillWidth: true

                        CANumber {
                            id: store
                            channelID: pvPrefix + ":STORE.PROC"
                        }
                    }

                    Button {
                        text: "Restore from Flash"
                        onClicked: restore.value = 1
                        Layout.fillWidth: true

                        CANumber {
                            id: restore
                            channelID: pvPrefix + ":RESTORE.PROC"
                        }
                    }
                }
            }
        }
    }
    GroupBox {
        title: "Rear Panel Outputs          "
        Layout.fillWidth: true

        ColumnLayout {
            Repeater {
                id:rearRepeat
                model: 16
                property var outputs: ["OUT5_ENCA", "OUT5_ENCB", "OUT5_ENCZ",
                    "OUT5_CONN", "OUT6_ENCA", "OUT6_ENCB", "OUT6_ENCZ",
                    "OUT6_CONN", "OUT7_ENCA", "OUT7_ENCB", "OUT7_ENCZ",
                    "OUT7_CONN", "OUT8_ENCA", "OUT8_ENCB", "OUT8_ENCZ",
                    "OUT8_CONN"]

                Row {
                    spacing: 6

                    Label {
                        text: rearRepeat.outputs[index].replace("_", " ")
                        width: 80
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    InputSelector {
                        channelID: pvPrefix + ":" + rearRepeat.outputs[index]
                    }
                }
            }
        }
    }
}
