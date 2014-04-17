import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import ChannelAccess 1.0

GridLayout {
    columns: 2

    GATEBox {
        baseChannel: pvPrefix + ":GATE1_"
        polarityChannel: pvPrefix + ":POLARITY"
        polarityIndex: 0
        Layout.alignment: Qt.AlignCenter
        title: "GATE1"
    }

    GATEBox {
        baseChannel: pvPrefix + ":GATE2_"
        polarityChannel: pvPrefix + ":POLARITY"
        polarityIndex: 1
        Layout.alignment: Qt.AlignCenter
        title: "GATE2"
    }

    GATEBox {
        baseChannel: pvPrefix + ":GATE3_"
        polarityChannel: pvPrefix + ":POLARITY"
        polarityIndex: 2
        Layout.alignment: Qt.AlignCenter
        title: "GATE3"
    }

    GATEBox {
        baseChannel: pvPrefix + ":GATE4_"
        polarityChannel: pvPrefix + ":POLARITY"
        polarityIndex: 3
        Layout.alignment: Qt.AlignCenter
        title: "GATE4"
    }
    
    Text {
        Layout.columnSpan: 2
        Layout.alignment: Qt.AlignHCenter
        text: "On a rising (or falling) edge of:
- INP1, OUT will be set high
- INP2, OUT will be reset low
- Both, OUT will be reset low"
    }    
}
