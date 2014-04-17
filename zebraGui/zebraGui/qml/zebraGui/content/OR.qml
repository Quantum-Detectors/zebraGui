import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import QtQuick.Layouts 1.0
import ChannelAccess 1.0

GridLayout {
    columns: 2

    ANDBox {
        title: "OR1"
        baseChannel: pvPrefix + ":OR1_"
        Layout.alignment: Qt.AlignCenter
    }

    ANDBox {
        title: "OR2"
        baseChannel: pvPrefix + ":OR2_"
        Layout.alignment: Qt.AlignCenter
    }

    ANDBox {
        title: "OR3"
        baseChannel: pvPrefix + ":OR3_"
        Layout.alignment: Qt.AlignCenter
    }

    ANDBox {
        title: "OR4"
        baseChannel: pvPrefix + ":OR4_"
        Layout.alignment: Qt.AlignCenter
    }
    
    Text {
        Layout.columnSpan: 2
        Layout.alignment: Qt.AlignHCenter
        text: "The output of an OR gate is the logical OR of its 4 inputs.
- If Use=No, then the input is ignored
- If Invert=Yes, then the input is inverted before going into the gate"    
    }    
}
