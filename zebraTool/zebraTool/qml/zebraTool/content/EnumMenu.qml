import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.0
import ChannelAccess 1.0

RowLayout {
    property string channelID
    property string value: caEnum.value

    CAEnum {
        id: caEnum
        channelID: parent.channelID
        onValueChanged: {
            for (var i = 0; i < optionsList.count; ++i) {
                if (optionsList.get(i).name == value) {
                    combo.currentIndex = i
                    break
                 }
            }
        }
        onOptionsChanged: {
            optionsList.clear()
            for (var opt in options) {            
                optionsList.append({"name": options[opt]})
            }
            valueChanged()
        }
    }

    ListModel {
        id: optionsList
    }

    ComboBox {
        id: combo
        model: optionsList
        property bool beenActivated: false
        onActivated: beenActivated = true
        onCurrentIndexChanged: {
            if (beenActivated && caEnum.value != optionsList.get(currentIndex).name) {
                caEnum.value = optionsList.get(currentIndex).name
            }
        }
        textRole: "name"
    }
}
