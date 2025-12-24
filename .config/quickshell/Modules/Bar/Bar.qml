import QtQuick
import Quickshell
import Quickshell.Hyprland
import QtQuick.Layouts
import "./Components/"

PanelWindow {
    id: panel
    
    anchors {
        top: true
        left: true
        right: true
    }

    implicitHeight: 30

    margins {
        top: 0
        left: 0
        right: 0
    }

    Rectangle {
        id: bar
        anchors.fill: parent
        color: "#1a1a1a"
        radius: 0
        border.color: "#333333"
        border.width: 3
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
            BarBluetooth {}
        }
    }
}
