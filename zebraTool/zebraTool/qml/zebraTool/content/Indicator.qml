import QtQuick 2.0

Row {
    id: indicator
    spacing: 2
    property string label
    property int size
    property int fontSize
    property int bit
    property int byt
    property bool on
    property string col: "green"
    size: 16
    fontSize: 10
    Rectangle {
        id: rect
        width: size
        height: size
        border.color: "black"
        color: parent.col
        anchors.verticalCenter: parent.verticalCenter
    }
    Text {
        color: "black"
        text: label
        font.pointSize: fontSize
        verticalAlignment: Text.AlignVCenter
    }
}
