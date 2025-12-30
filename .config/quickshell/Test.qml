 import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Effects

PanelWindow {
id: root

color: "transparent"
visible: true
//exclusiveZone: 10
aboveWindows: false
mask: Region { item: container; intersection: Intersection.Xor }

anchors {
top: true
left: true
bottom: true
right: true
}

//anchors.margins: 10

Item {
id: container
anchors.fill: parent

Rectangle {
anchors.fill: parent

color: Theming.colBg

layer.enabled: true
layer.effect: MultiEffect {
maskSource: mask
maskEnabled: true
maskInverted: true
maskThresholdMin: 0.5
maskSpreadAtMin: 1
}
}

Item {
id: mask

anchors.fill: parent
layer.enabled: true
visible: false

Rectangle {
anchors.fill: parent
anchors.leftMargin: 2
anchors.rightMargin: 2
anchors.topMargin: 2
anchors.bottomMargin: 2
radius: Theming.round
}
}
}
}
