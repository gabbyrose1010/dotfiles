import Quickshell
import QtQuick
import Quickshell.Io

Text {
    property var command: ["echo", "hello"]
    property string icon: "oops"
    text: icon
    color: mouse.containsMouse ? Theming.colPrim : Theming.colTert
    font {
        family: Theming.fontFamily
        pixelSize: mouse.containsMouse ? Theming.fontSize 
                 : Theming.fontSize * 0.9
        bold: true
    }    

    MouseArea {
        id: mouse
        anchors.fill: parent
        hoverEnabled: true
        onClicked: { process.exec(command) }
    }

    Process {
        id: process
    }

}
