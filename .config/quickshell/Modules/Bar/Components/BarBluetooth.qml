import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Controls.Basic
import "./SymLinks/"
import qs.Modules.Bar

Button {
    id: root
    flat: true
    width: text.width
    height: text.height
    //text: qsTr(Bluetooth.displayString ? Bluetooth.icon + " " + Bluetooth.shortName
          //: Bluetooth.icon)

    Text {
        id: text
        text: qsTr(Bluetooth.displayString ? Bluetooth.icon + " " + Bluetooth.shortName
            : Bluetooth.icon)
        color: mouse.containsMouse ? Theming.colTert : Theming.colSec
        font {
            family: Theming.fontFamily
            pixelSize: Theming.fontSize
            bold: true
        }
        
        MouseArea {
            id: mouse
            anchors.fill: parent
            hoverEnabled: true
            propagateComposedEvents: true
            onClicked: { root.click() }
        }
    }   
}
