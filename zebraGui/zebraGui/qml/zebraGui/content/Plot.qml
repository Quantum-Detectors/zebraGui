import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.0
import ChannelAccess 1.0
import File 1.0

ApplicationWindow {
    width: 8*tableView.colWidth + 20
    height: 480
    property string baseName
    property real lastUpdate: Date.now() - 10000
    title: "Zebra Data: " + pvPrefix

    WorkerScript {
        id: worker
        source: "updateTable.js"
    }

    WorkerScript {
        id: saver
        source: "fileWriter.js"
        onMessage: {
            file.writeFile(messageObject.newCSV)
            file.closeFile()
        }
    }

    CANumber {
        id: numDLPoints
        channelID: baseName + "PC_NUM_DOWN"
    }

    CANumber {
        id: downloading
        channelID: baseName + "ARRAY_ACQ"
        onValueChanged: {
            if (Number(value) === 0) {
                var enc1List = enc1.getValueList()
                var enc2List = enc2.getValueList()
                var enc3List = enc3.getValueList()
                var enc4List = enc4.getValueList()
                var sys1List = sys1.getValueList()
                var sys2List = sys2.getValueList()                
                var div1List = div1.getValueList()
                var div2List = div2.getValueList()
                var div3List = div3.getValueList()
                var div4List = div4.getValueList()
                var message = {"enc1List": enc1List,
                    "enc2List": enc2List,
                    "enc3List": enc3List,
                    "enc4List": enc4List,
                    "sys1List": sys1List,
                    "sys2List": sys2List,                    
                    "div1List": div1List,
                    "div2List": div2List,
                    "div3List": div3List,
                    "div4List": div4List,
                    "nPoints": numDLPoints.value,
                    "listModel": listModel}
                worker.sendMessage(message)
            }
        }
    }

    CADoubleArray {
        id: enc1
        channelID: baseName + "PC_ENC1"
    }

    CADoubleArray {
        id: enc2
        channelID: baseName + "PC_ENC2"
    }

    CADoubleArray {
        id: enc3
        channelID: baseName + "PC_ENC3"
    }

    CADoubleArray {
        id: enc4
        channelID: baseName + "PC_ENC4"
    }

    CADoubleArray {
        id: sys1
        channelID: baseName + "PC_SYS1"
    }

    CADoubleArray {
        id: sys2
        channelID: baseName + "PC_SYS2"
    }

    CADoubleArray {
        id: div1
        channelID: baseName + "PC_DIV1"
    }

    CADoubleArray {
        id: div2
        channelID: baseName + "PC_DIV2"
    }

    CADoubleArray {
        id: div3
        channelID: baseName + "PC_DIV3"
    }

    CADoubleArray {
        id: div4
        channelID: baseName + "PC_DIV4"
    }

    ListModel {
        id: listModel
    }

    File { id: file }

    FileDialog {
        id: fileDialog
        onAccepted: {
            var message = {"data": listModel}
            file.openFile(
                        fileDialog.fileUrls.toString().replace("file://", ""),
                        "w")
            saver.sendMessage(message)
        }
    }

    RowLayout {
        anchors.fill: parent
        anchors.rightMargin: 5

        TableView {
            id: tableView
            property int colWidth: 75
            TableViewColumn { role: "enc1"; title: "ENC1"; width: tableView.colWidth }
            TableViewColumn { role: "enc2"; title: "ENC2"; width: tableView.colWidth }
            TableViewColumn { role: "enc3"; title: "ENC3"; width: tableView.colWidth }
            TableViewColumn { role: "enc4"; title: "ENC4"; width: tableView.colWidth }
            TableViewColumn { role: "sys1"; title: "SYS1"; width: tableView.colWidth }
            TableViewColumn { role: "sys2"; title: "SYS2"; width: tableView.colWidth }            
            TableViewColumn { role: "div1"; title: "DIV1"; width: tableView.colWidth }
            TableViewColumn { role: "div2"; title: "DIV2"; width: tableView.colWidth }
            TableViewColumn { role: "div3"; title: "DIV3"; width: tableView.colWidth }
            TableViewColumn { role: "div4"; title: "DIV4"; width: tableView.colWidth }
            model: listModel
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        Column {
            spacing: 10

            Grid {
                spacing: 10
                columns: 2
                Label {
                    text: "Points Captured"
                }

                Rectangle {
                    color: "#777777"
                    width: 80
                    height: 20
                    //anchors.verticalCenter: parent.verticalCenter
                    Label {
                        id: captured
                        text: Number(caCaptured.value)
                        color: "light green"
                        //anchors.centerIn: parent
                        CAText {
                            id: caCaptured
                            channelID: baseName + "PC_NUM_CAP"
                        }
                    }
                }

                Label {
                    text: "Points Downloaded"
                }

                Rectangle {
                    color: "#777777"
                    width: 80
                    height: 20
                    //anchors.verticalCenter: parent.verticalCenter
                    Label {
                        id: downloaded
                        text: Number(caDownloaded.value)
                        color: "light green"
                        //anchors.centerIn: parent
                        CAText {
                            id: caDownloaded
                            channelID: baseName + "PC_NUM_DOWN"
                        }
                    }
                }
            }

            Row {
                spacing: parent.width - downLabel.width - downIndicator.width
                Label {
                    id: downLabel
                    text: "Data Download in Progress"
                }

                CAIndicator {
                    id: downIndicator
                    channelID: baseName + "ARRAY_ACQ"
                }
            }

            Button {
                text: "Save Data"
                onClicked: fileDialog.open()
            }
        }
    }
}
