import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

PanelWindow {
    anchors.top: true
    anchors.left: true
    anchors.right: true
    implicitHeight: 30     
    color: "#00000000"

    id: root
    property int sideMargin: 20
    property int moduleMargin: 12

    RowLayout {
        id: bar
        //color: "#2a1b26"
        anchors.fill: parent
        anchors.leftMargin: sideMargin
        anchors.rightMargin: sideMargin
        spacing: 6
        //uniformCellSizes: true

        Item {
            id: leftSide
            //anchors.left: bar.left
            //anchors.top: bar.top
            //anchors.leftMargin: moduleMargin            

            Workspaces{ anchors.centerIn: parent }
        }

        Item {Layout.fillWidth: true}

        Item {
            id: centerSide

            BarClock{ anchors.verticalCenter: centerSide.verticalCenter }

            //Rectangle {
                //width: moduleMargin * 2
            //}

        }

        Item { Layout.fillWidth: true }

        Item {
            id: rightSide
            //Layout.minimumWidth: 100
            //Layout.alignment: Qt.AlignRight
            RowLayout {
                spacing: 6
                layoutDirection: Qt.RightToLeft
                id: info
                BarBattery{ Layout.fillWidth: true }
                BarVolume{ Layout.fillWidth: true }
            }
        }
        
    }
}
