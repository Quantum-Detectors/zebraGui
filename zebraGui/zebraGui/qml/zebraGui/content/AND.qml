import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import QtQuick.Layouts 1.0
import ChannelAccess 1.0

GridLayout {
    columns: 2
    

    ANDBox {
        title: "AND1"
        baseChannel: pvPrefix + ":AND1_"
        Layout.alignment: Qt.AlignCenter
    }

    ANDBox {
        title: "AND2"
        baseChannel: pvPrefix + ":AND2_"
        Layout.alignment: Qt.AlignCenter
    }

    ANDBox {
        title: "AND3"
        baseChannel: pvPrefix + ":AND3_"
        Layout.alignment: Qt.AlignCenter
    }

    ANDBox {
        title: "AND4"
        baseChannel: pvPrefix + ":AND4_"
        Layout.alignment: Qt.AlignCenter
    }
    
    Text {
        Layout.columnSpan: 2
        Layout.alignment: Qt.AlignHCenter
        text: "The output of an AND gate is the logical AND of its 4 inputs.
- If Use=No, then the input is ignored
- If Invert=Yes, then the input is inverted before going into the gate"    
    }
}

