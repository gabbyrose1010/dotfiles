import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import qs

Item {
id: root
RowLayout{
    Repeater {
        id: work
        model: 9
        Layout.alignment: Qt.AlignVCenter

        Text {
            anchors.verticalCenter: work.verticalCenter
            property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
            property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)
            text: ws ? "󰄛" : ""
            color: isActive ? Theming.colTert : (ws ? Theming.colSec 
            : Theming.colPrim)
            font { 
                pixelSize: ws ? Theming.fontSize : Theming.fontSize * 0.5
                bold: true 
            }

            //MouseArea {
                //anchors.fill: parent
                //onClicked: Hyprland.dispatch("workspace " + (index + 1))
            //}
        }
    }

    Item { Layout.fillWidth: true }
}
}
