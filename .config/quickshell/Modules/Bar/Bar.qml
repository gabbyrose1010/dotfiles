import QtQuick
import Quickshell
import Quickshell.Hyprland
import QtQuick.Layouts
import Quickshell.Io
import QtQuick.Controls
import "./Components/"
import "./Components/SymLinks/"

PanelWindow {
    id: panel

    anchors {
        top: true
        left: true
        right: true
    }

    implicitHeight: Theming.barHeight

    margins {
        top: Theming.barTop
        left: Theming.barLeft
        right: Theming.barRight
    }

    Rectangle {
        id: bar
        anchors.fill: parent
        color: Theming.colBg
        radius: 0
        border.color: Theming.colBord
        border.width: Theming.borderWidth
    }

    // left side
    RowLayout {
        id: leftSide

        anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
            leftMargin: 8
        }

        // components
        Workspaces {}
    }

    // center side
    Item {
        id: centerSide

        anchors {
            horizontalCenter: parent.horizontalCenter
            verticalCenter: parent.verticalCenter
        }

        // components
        BarClock {}
    }

    // right side
    Item {
        id: rightSide

        anchors {
            right: parent.right
            verticalCenter: parent.verticalCenter
            rightMargin: 8
        }

        height: parent.height
        width: rightRow.width

        Row {
            id: rightRow
            spacing: 10

            anchors {
                right: rightSide.right
                verticalCenter: rightSide.verticalCenter
            }

            // components
            BarBattery {}
            BarVolume {}
            BarBrightness {}
            BarWifi {}
            BarBluetooth {
                onClicked: bluePop()
            }
        }
    }

    // pop up window
    PopupWindow {
        id: popup
        property string name: "hello"
        anchor.window: panel
        anchor.rect.y: parentWindow.height + Theming.popTop
        color: "transparent"
        mask: Region { item: pop }
        property string location: Theming.popLoc === 
                                 ("right" || ("left" || "center")) 
                                 ? Theming.popLoc : "right"
                                 // dont judge the formatting
                                 // im on a small window :p
        anchor.rect.x: location == "right" ? (parentWindow.width - width)
                     : location == "center" ? (parentWindow.width / 2 - width / 2)
                     : 0
        implicitWidth: 500
        implicitHeight: 500
        visible: false
        PopUp { id: pop; name: popup.name } 
    }

    function bluePop() {
        popup.name = "Bluetooth"
        popup.visible = popup.visible ? false : true
        pop.visible = true
    }
}
