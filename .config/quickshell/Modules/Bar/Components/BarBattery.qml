import Quickshell
import QtQuick
import Quickshell.Io
import "~/dotfiles/.config/quickshell/Info/Battery.qml"
//Rectangle {
    //id: root

    Text {
        anchors.verticalCenter: root.verticalCenter
        //anchors.right: root.right
        text: Battery.icon + " " + Battery.percent + "%"
        color: Theming.colSec
        font { family: Theming.fontFamily; pixelSize: Theming.fontSize; bold: true }
    }
//}
