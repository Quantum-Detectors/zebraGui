import QtQuick 2.0
import ChannelAccess 1.0

Column {
    id: myByte
    property int bits
    property var labels
    property int indicatorSize
    property int fontSize
    property var channelID
    property int caBitsval
    property var indicators
    property string onCol: "#00FF00"
    property string offCol: "#006600"    
    indicatorSize: 16
    fontSize: 10
    caBitsval: parseInt(caBits.value)  

    CAText {
        id: caBits
        channelID: parent.channelID
        onValueChanged: {
            var newVal = 0;
            for (var i in parent.indicators) {
                var indicator = parent.indicators[i]
                newVal = value
                if ((value & Math.pow(2, i)) == Math.pow(2, i)) {
                    indicator.col = parent.onCol
                } else {
                    indicator.col = parent.offCol
                }
            }
        }
    }

    Component {
        id: myIndicator
        Indicator { }
    }

    Component.onCompleted: {
        indicators = []
        for (var i=0; i<bits; i++) {
            indicators.push(myIndicator.createObject(myByte, {label: labels[i],
                                                         size: indicatorSize,
                                                         fontSize: fontSize,
                                                         byt: caBitsval,
                                                         bit: i}))
        }
    }
}
