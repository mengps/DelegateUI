import QtQuick
import DelegateUI

Text {
    id: control

    property int iconSource: 0
    property alias iconSize: control.font.pixelSize
    property alias iconColor: control.color

    text: String.fromCharCode(iconSource)
    font.family: __loader.name
    font.pixelSize: DelTheme.DelIconText.fontSize
    color: DelTheme.DelIconText.colorText

    FontLoader {
        id: __loader
        source: "qrc:/DelegateUI/resources/font/DelegateUI-Icons.ttf"
    }
}
