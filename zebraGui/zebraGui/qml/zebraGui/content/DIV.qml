import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0

GridLayout {
    columns: 2

    DIVBox {
        title: "DIV1"
        baseChannel: pvPrefix + ":DIV1_"
        polarityChannel: pvPrefix + ":POLARITY"
        polarityIndex: 8
        Layout.alignment: Qt.AlignCenter
    }

    DIVBox {
        title: "DIV2"
        baseChannel: pvPrefix + ":DIV2_"
        polarityChannel: pvPrefix + ":POLARITY"
        polarityIndex: 9
        Layout.alignment: Qt.AlignCenter
    }

    DIVBox {
        title: "DIV3"
        baseChannel: pvPrefix + ":DIV3_"
        polarityChannel: pvPrefix + ":POLARITY"
        polarityIndex: 10
        Layout.alignment: Qt.AlignCenter
    }

    DIVBox {
        title: "DIV4"
        baseChannel: pvPrefix + ":DIV4_"
        polarityChannel: pvPrefix + ":POLARITY"
        polarityIndex: 11
        Layout.alignment: Qt.AlignCenter
    }
    Text {
        Layout.columnSpan: 2
        Layout.alignment: Qt.AlignHCenter
        text: "The DIV block will split pulses between two outputs.
With the intial pulse being numbered 1 (or optionally 0):
- If the pulse number is divisible by divisor it is sent to OUTD and the counter is zeroed
- Otherwise it is sent to OUTN and the counter is incremented"
    }     
}
