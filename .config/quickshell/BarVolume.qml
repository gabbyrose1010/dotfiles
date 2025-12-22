import Quickshell
import QtQuick
import Quickshell.Io
import QtQuick.Layouts

RowLayout{
//Rectangle {
    //id: root
    //implicitWidth: 10
    Text {
        //anchors.verticalCenter: root.verticalCenter
        //anchors.right: root.right
        text: Volume.icon + " " + Volume.percent + "%"
        color: Theming.colSec
        font { family: Theming.fontFamily; pixelSize: Theming.fontSize; bold: true }
    }
//}
}
