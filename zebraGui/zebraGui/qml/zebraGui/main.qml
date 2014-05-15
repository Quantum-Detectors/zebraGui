import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Window 2.0
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.0
import File 1.0
import ChannelAccess 1.0
import "content"

ApplicationWindow {

    id: mainWindow
    title: "Zebra: " + pvPrefix
    minimumHeight: 650
    minimumWidth: byteInd1_1.width + byteInd2_1.width + 750 // diagram width + padding

    ApplicationWindow {
        id: sysWindow
        width: sys.width
        height: sys.height
        title: "Zebra SYS"

        SYS {
            id: sys
        }
    }

    RowLayout {
        id: allLayout
        anchors.fill: parent

        ColumnLayout {
            RowLayout {
                anchors.top: parent.top        
                Column {
                    anchors.top: parent.top
                    Label {
                        text: "SYS1"
                        font.bold: true
                    }            
                    ByteIndicator {
                        id: byteInd1_1
                        Layout.fillHeight: true
                        bits: 16
                        labels: [' 0: DISCONNECT', ' 1: IN1_TTL', ' 2: IN1_NIM', ' 3: IN1_LVDS', ' 4: IN2_TTL', ' 5: IN2_NIM', ' 6: IN2_LVDS', ' 7: IN3_TTL', ' 8: IN3_OC', ' 9: IN3_LVDS', '10: IN4_TTL', '11: IN4_CMP', '12: IN4_PECL', '13: IN5_ENCA', '14: IN5_ENCB', '15: IN5_ENCZ']
                        indicatorSize: 14
                        fontSize: 9
                        channelID: pvPrefix + ":SYS_STAT1LO"
                    }
                    ByteIndicator {
                        id: byteInd1_2
                        Layout.fillHeight: true
                        bits: 16
                        labels: ['16: IN5_CONN', '17: IN6_ENCA', '18: IN6_ENCB', '19: IN6_ENCZ', '20: IN6_CONN', '21: IN7_ENCA', '22: IN7_ENCB', '23: IN7_ENCZ', '24: IN7_CONN', '25: IN8_ENCA', '26: IN8_ENCB', '27: IN8_ENCZ', '28: IN8_CONN', '29: PC_ARM', '30: PC_GATE', '31: PC_PULSE']
                        indicatorSize: 14
                        fontSize: 9
                        channelID: pvPrefix + ":SYS_STAT1HI"
                    }                       
                }
                Column {
                    anchors.top: parent.top
                    Label {
                        text: "SYS2"
                        font.bold: true
                    }             
                    ByteIndicator {
                        id: byteInd2_1
                        Layout.fillHeight: true
                        bits: 16
                        labels: ['32: AND1', '33: AND2', '34: AND3', '35: AND4', '36: OR1', '37: OR2', '38: OR3', '39: OR4', '40: GATE1', '41: GATE2', '42: GATE3', '43: GATE4', '44: DIV1_OUTD', '45: DIV2_OUTD', '46: DIV3_OUTD', '47: DIV4_OUTD']
                        indicatorSize: 14
                        fontSize: 9
                        channelID: pvPrefix + ":SYS_STAT2LO"
                    }
                    ByteIndicator {
                        id: byteInd2_2
                        Layout.fillHeight: true
                        bits: 16
                        labels: ['48: DIV1_OUTN', '49: DIV2_OUTN', '50: DIV3_OUTN', '51: DIV4_OUTN', '52: PULSE1', '53: PULSE2', '54: PULSE3', '55: PULSE4', '56: QUAD_OUTA', '57: QUAD_OUTB', '58: CLOCK_1KHZ', '59: CLOCK_1MHZ', '60: SOFT_IN1', '61: SOFT_IN2', '62: SOFT_IN3', '63: SOFT_IN4']
                        indicatorSize: 14
                        fontSize: 9
                        channelID: pvPrefix + ":SYS_STAT2HI"
                    }
                }
            }
            ColumnLayout {
                Label {
                    text: "Error State:"
                    font.bold: true
                }
                ByteIndicator {
                    id: errInd1
                    Layout.fillHeight: true
                    bits: 8
                    labels: ['PULSE1 Trig while active', 'PULSE2 Trig while active', 'PULSE3 Trig while active', 'PULSE4 Trig while active', 'PC buff overflow', "Err5", "Err6", "Err7", "Err8"]
                    indicatorSize: 14
                    fontSize: 9
                    channelID: pvPrefix + ":SYS_STATERR"
                    onCol: "#FF0000"
                    offCol: "#660000"                  
                } 
            }            
        }         
        ColumnLayout {
            Layout.fillHeight: true
            Layout.fillWidth: true
            TabView {
                Layout.fillWidth: true
                Layout.fillHeight: true

                NumberAnimation {
                     id: fadeIn
                     properties: "opacity"
                     from: 0
                     to: 1
                    duration: 300
                }
                                               
                onCurrentIndexChanged: {
                    fadeIn.stop()
                    fadeIn.target = __tabs.get(currentIndex).tab.children[0]   
                    fadeIn.start()
                }

                Tab {
                    anchors.margins: 10
                    title: "PC"
                    PC { }
                }

                Tab {
                    title: "AND"
                    anchors.margins: 10
                    AND { id: andTab }
                }

                Tab {
                    title: "OR"
                    anchors.margins: 10
                    OR { id: orTab }
                }

                Tab {
                    title: "GATE"
                    anchors.margins: 10
                    GATE { }
                }

                Tab {
                    title: "DIV"
                    anchors.margins: 10
                    DIV {}
                }

                Tab {
                    title: "PULSE"
                    anchors.margins: 10
                    PULSE {}
                }

                Tab {
                    title: "ENC"
                    anchors.margins: 10
                    ENC {}
                }

                Tab {
                    title: "SYS"
                    anchors.margins: 10
                    SYS {}
                }
            }
            RowLayout {
                Label {
                    text: "Comms:"
                    font.bold: true                    
                }

                CALabel {
                    width: 90
                    channelID: pvPrefix + ":CONNECTED"
                }

                Rectangle { // Seperator
                    Layout.fillWidth: true
                    height: 20
                    color: "#00000000"
                }
                
                Label {
                    text: "Soft In:"
                    font.bold: true
                }                
                
                Repeater {
                    model: 4                    
                    CACheckBox {
                        text: "INP" +  (index + 1)
                        channelID: pvPrefix + ":SOFT_IN:B" + index
                    }              
                }
                Label {
                    text: "Block State:"
                    font.bold: true                    
                }    

                Button {
                    text: "Reset"
                    CANumber {
                        id: caReset
                        channelID: pvPrefix + ":SYS_RESET.PROC"
                    }
                    id: resetButton
                    onClicked: caReset.value = 1                    
                }

                Button {
                    text: "Exit"                   
                    onClicked: Qt.quit()
                }
            }
        }
    }
    Rectangle {
        anchors.fill: parent                    
        color: "white"
        id: zebraRect
        Image {
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            smooth: true
            source: "ZebraLogo.png"
        }
        NumberAnimation {
             id: zebraFade
             target: zebraRect
             properties: "opacity"
             from: 1
             to: 0
             duration: 1500
        }          
    }    
    Component.onCompleted: zebraFade.start()
}
