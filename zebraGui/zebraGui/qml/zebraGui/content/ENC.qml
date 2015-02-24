import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import ChannelAccess 1.0

GridLayout {
    columns: 2
    
    Repeater {
        model: 4    
    

        GroupBox {
            title: "POS" + (index + 1)
            Layout.alignment: Qt.AlignCenter            
            
            GridLayout {
                columns: 2
                
                Label {
                    text: "Motor current pos"
                }                          

                CALabel {
                    channelID: pvPrefix + ":M" + (index+1) + ":RBV"
                    Layout.fillWidth: true                    
                }

                Label {
                    text: "Set Zebra pos"
                }    
                
                TextField {
                    onAccepted: setPos.value = text
                    Layout.fillWidth: true
                    CANumber {
                        id: setPos
                        channelID: pvPrefix + ":POS" + (index+1) + "_SET"
                        onValueChanged: parent.text = value
                    }
                }      

                Label {
                    text: "Encoder Resolution"
                }    
                
                TextField {
                    onAccepted: setERES.value = text
                    Layout.fillWidth: true
                    CANumber {
                        id: setERES
                        channelID: pvPrefix + ":M" + (index+1) + ":ERES"
                        onValueChanged: parent.text = value
                    }
                } 
                
                Label {
                    text: "Encoder Offset"
                }    
                
                TextField {
                    onAccepted: setOff.value = text
                    Layout.fillWidth: true
                    CANumber {
                        id: setOff
                        channelID: pvPrefix + ":M" + (index+1) + ":OFF"
                        onValueChanged: parent.text = value
                    }
                } 
                                
                // Bottom 2 lines
                Rectangle {
                    color: "black"
                    height: 3
                    Layout.fillWidth: true
                    Layout.columnSpan: 2
                }
                Button {
                    text: "Copy motor pos to Zebra"
                    Layout.fillWidth: true
                    Layout.columnSpan: 2
                    onClicked: clicker.value = 1

                    CANumber {
                        id: clicker
                        channelID: pvPrefix + ":M" + (index+1) + ":SETPOS.PROC"
                    }
                }   
            }
        }    
    }
    
    Text {
        Layout.columnSpan: 2
        Layout.alignment: Qt.AlignHCenter
        text:   "If you have specified a motor record for each encoder then its current position
will be displayed in the first box. The second box lets you reference the
encoder channel by telling zebra what position it is currently at. The Copy
button lets you do copy the current position to zebra with one click. The 
resolution and offset boxes let you set the display positions of the encoders
and PC settings, where Enc_Cts * Resolution + Offset = Enc_EGUs" 
    }    
    
    GroupBox {
        title: "QUAD"
        Layout.alignment: Qt.AlignCenter        

        GridLayout {
            columns: 2

            Label {
                text: "STEP"
            }
            InputSelector {
                channelID: pvPrefix + ":QUAD_STEP"
            }

            Label {
                text: "DIR"
            }
            InputSelector {
                channelID: pvPrefix + ":QUAD_DIR"
            }

            Rectangle {
                height: 3
                color: "black"
                Layout.fillWidth: true
                Layout.columnSpan: 2
            }

            Label {
                text: "OUTA"
            }
            CAIndicator {
                channelID: pvPrefix + ":QUAD_OUTA"
                Layout.alignment: Grid.AlignRight
            }

            Label {
                text: "OUTB"
            }
            CAIndicator {
                channelID: pvPrefix + ":QUAD_OUTB"
                Layout.alignment: Grid.AlignRight
            }
        }
    }    

    Text {
        Layout.alignment: Qt.AlignHCenter
        text: "Quadrature encoder. Cycle between 4 states:
- State 1: A=0 B=0
- State 2: A=1 B=0
- State 3: A=1 B=1
- State 4: A=0 B=1

On each rising edge of STEP:
- if DIR=1 then move the the next state
- otherwise move to the previous state"
    }


    
}
