import Quickshell
import QtQuick
import QtQuick.Effects
import "./Modules/Bar/"
import "./Modules/Bar/Popups/"

ShellRoot {
    id: root

    PanelWindow {
        id: leftBar
        visible: Theming.borders
        anchors.top: true
        anchors.bottom: true
        anchors.left: true
        width: Theming.bordWidth
        color: Theming.colBg
    }
    PanelWindow {
        id: rightBar
        visible: Theming.borders
        anchors.top: true
        anchors.bottom: true
        anchors.right: true
        width: Theming.bordWidth
        color: Theming.colBg
    }
    PanelWindow {
        id: bottomBar
        visible: Theming.borders
        anchors.bottom: true
        anchors.right: true
        anchors.left: true
        height: Theming.bordWidth
        color: Theming.colBg
    }

    Bar { id: topBar }
    
    Test { }
}
