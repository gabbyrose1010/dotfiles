import qtQuick
import Quickshell
import Quickshell.Hyprland

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
        color: #1a1a1a
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

        // widgets will go here
    }

    // center side
    Item {
        id: centerSide

        anchors {
            horizontalCenter: parent.horizontalCenter
            verticalCenter: parent.verticalCenter
        }

        // widget(s) will go here (will need to be edited if more than clock)
    }

    // right side
    Item {
        id: rightSide

        anchors {
            right: parents.right
            verticalCenter: parent.verticalCenter
            rightMargin: -2 // OH SHIT I GET IT NOW
        }

        height: parent.height
        width: rightRow.width

        Row {
            id: rightRow

            anchors {
                right: parent.right
                verticalCenter: parent.verticalCenter
                spacing: 8
            }

            // widgets will go here
        }
    }
}
