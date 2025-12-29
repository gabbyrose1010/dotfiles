import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Io

// NOTE: THIS IS A CHEATED VERSION OF THE BLUETOOTH POPUP
//       IT IS UNFINISHED AND ONlY DISPLAYS MY DIME 3
//       CHEATED LINES ARE COMMENTED
//       ALSO ALL BUTTONS JUST CONNECT RN SO YEAH BROKEN

//Scope {

ColumnLayout {
    id: root
    anchors.fill: parent
    spacing: 10
    property var list: ["Dime 3", "test"] // cheated
    property string blueID: "88:08:94:C8:08:36" // cheated - will be list
    property var command: ["connect", "disconnect", "trust"] // cheated?
    property var icons: ["󰴽", "", ""]

    Repeater {
        model: root.list

        RowLayout {
            spacing: 10

            Text {
                text: root.list[index]
                color: Theming.colTert
                font {
                    family: Theming.fontFamily
                    pixelSize: Theming.fontSize
                    bold: true
                }
            }
            Item { Layout.fillWidth: true }

            // these buttons could go in their own file idk
            Repeater {
                model: root.icons

                PopButtons { 
                    icon: root.icons[index]
                    command: ["bluetoothctl", root.command[index], blueID]
                }

                //MouseArea {
                    //id: mouse
                    //anchors.fill: parent
                    //hoverEnabled: true
                    //onClicked: { connect.running = true }
                //}
            }
            Item { width: 20 }
        }
    }
    Item { Layout.fillHeight: true } 
}

// button processes
// again, could go in seperate buttons file
// only one button works btw cause idc

//property string blueID: "88:08:94:C8:08:36" // cheated

//Process {
    //id: connect
    //running: false
    //command: ["bluetoothctl", "connect", blueID]
//}

//}
