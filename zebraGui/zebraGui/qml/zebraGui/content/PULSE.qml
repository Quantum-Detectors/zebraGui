import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0

GridLayout {
    columns: 2

    PULSEBox {
        title: "PULSE1"
        baseChannel: pvPrefix + ":PULSE1_"
        polarityChannel: pvPrefix + ":POLARITY"
        polarityIndex: 12
        Layout.alignment: Qt.AlignCenter
    }

    PULSEBox {
        title: "PULSE2"
        baseChannel: pvPrefix + ":PULSE2_"
        polarityChannel: pvPrefix + ":POLARITY"
        polarityIndex: 13
        Layout.alignment: Qt.AlignCenter
    }

    PULSEBox {
        title: "PULSE3"
        baseChannel: pvPrefix + ":PULSE3_"
        polarityChannel: pvPrefix + ":POLARITY"
        polarityIndex: 14
        Layout.alignment: Qt.AlignCenter
    }

    PULSEBox {
        title: "PULSE4"
        baseChannel: pvPrefix + ":PULSE4_"
        polarityChannel: pvPrefix + ":POLARITY"
        polarityIndex: 15
        Layout.alignment: Qt.AlignCenter
    }
    
    Text {
        Layout.columnSpan: 2
        Layout.alignment: Qt.AlignHCenter
        text: "On a rising edge of its input, a PULSE gate will:
- Keep its output low for delay time units
- Set its output high for width time units"
    }      
}
