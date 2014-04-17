import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import ChannelAccess 1.0

GroupBox {
    id: base
    property string baseChannel

    GridLayout {
        flow: GridLayout.TopToBottom
        rows: 6
        // Column 0
        Label {
            Layout.column: 0       
            Layout.row: 0 
            text: "Use?"
        }
        Repeater {
            model: 4
            CACheckBox {
                text: "INP" +  (index + 1)
                channelID: baseChannel + "ENA:B" + index
            }         
        }
        // Column 1
        Label {
            Layout.column: 1     
            Layout.row: 0                
            text: "Input source, status"
        }
        Repeater {
            model: 4
            InputSelector {
                channelID: baseChannel + "INP" + (index + 1)
            }           
        }               
        // Column 2
        Label {
            Layout.column: 2     
            Layout.row: 0                
            text: "Invert"
        }
        Repeater {
            model: 4
            CACheckBox {
                channelID: baseChannel + "INV:B" + index
            }           
        }   
        // Bottom 2 lines
        Rectangle {
            color: "black"
            height: 3
            Layout.column: 0     
            Layout.row: 5              
            Layout.fillWidth: true
            Layout.columnSpan: 3
        }

        Label {
            Layout.row: 6        
            text: "OUT"
        }
        CAIndicator {
            Layout.row: 6
            Layout.column: 1
            Layout.alignment: Qt.AlignRight
            channelID: baseChannel + "OUT"
        }
    }
}

