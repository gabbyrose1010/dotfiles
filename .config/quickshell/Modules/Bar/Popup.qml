import Quickshell
import QtQuick
import QtQuick.Layouts
import "./Components/SymLinks/"
import "./Popups/"

Rectangle {
    id: root
    width: 300
    height: 300
    color: Theming.colBg
    border.color: Theming.colBord
    border.width: Theming.borderWidth
    anchors.top: parent.top
    anchors.right: parent.right

    property string name
    property variant list: ["Colors", "bears", "you"]
    property variant butList: ["󰴽", "", ""]

    Rectangle {
        id: top
        width: parent.width
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.leftMargin: Theming.borderWidth
        height: title.height        
        color: "transparent"

        Text {
            id: title
            text: name
            color: Theming.colSec
            font {
                family: Theming.fontFamily
                pixelSize: Theming.fontSize * 1.3
                bold: true
            }
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 5
            anchors.leftMargin: 10
        }

        Rectangle {
            id: closeButton
            height: title.height
            width: title.height
            color: "transparent"
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: Theming.borderWidth
            anchors.rightMargin: Theming.borderWidth + 5

            Text {
                id: xBut
                anchors.centerIn: parent
                text: ""
                color: xMouse.containsMouse ? Theming.colPrim : Theming.colTert
                font {
                    family: Theming.fontFamily
                    pixelSize: xMouse.containsMouse ? Theming.fontSize * 1.2 
                             : Theming.fontSize * 1.1
                    bold: true
                }
            }

            MouseArea {
                id: xMouse
                anchors.fill: parent
                hoverEnabled: true
                onClicked: { root.visible = false }
            }
        }
    }

    Rectangle {
        id: menu
        height: root.height
        width: root.width
        color: "transparent"
        anchors.top: top.bottom
        anchors.left: parent.left
        anchors.leftMargin: 10 + Theming.borderWidth
        anchors.topMargin: 10

        ColumnLayout {
            anchors.fill: parent
            spacing: 10
            Repeater {
                model: list

                RowLayout {
                    spacing: 10
                    Text { 
                        text: list[index]
                        color: Theming.colTert
                        font {
                            family: Theming.fontFamily
                            pixelSize: Theming.fontSize
                            bold: true
                        }
                    }
                    Item { Layout.fillWidth: true }
                    Repeater {
                        id: buts    
                        model: butList
                        Text {
                            text: butList[index]
                        }
                    }
                    Item { width: 20 }
                }
            }
            Item { Layout.fillHeight: true }
        }
    }

    Rectangle {
        width: parent.width / 3
        color: "transparent"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: cornerImg.height
        anchors.right: parent.right
        AnimatedImage {
            id: cornerImg 
            source: Theming.popImg
            fillMode: Image.PreserveAspectFit
            width: parent.width 
        }
    }
}
